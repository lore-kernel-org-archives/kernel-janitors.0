From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Fri, 14 Apr 2006 18:30:44 +0000
Subject: [KJ] [linuxram@us.ibm.com: [RFC PATCH 1/2] Makefile: export-symbol
Message-Id: <20060414183044.GA6872@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============26493099952535859=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============26493099952535859==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Not sure if everyone on the list follows LKML, but the report mentioned
below (depending on the discussion that might occur on LKML) may be a
useful tool for a janitorial task. Lots of exports that are unused
(similar to what Adrian Bunk's been doing). Maybe a find, verify with
maintainer kind of thing (ideally, the subsystem maintainers would do
that themselves, but they are busy people :)

Thanks,
Nish

----- Forwarded message from Ram Pai <linuxram@us.ibm.com> -----

Date: 	Thu, 13 Apr 2006 05:38:26 -0700 (PDT)
From: Ram Pai <linuxram@us.ibm.com>
To: linux-kernel@vger.kernel.org
Cc: akpm@osdl.org, arjan@infradead.org, greg@kroah.com, hch@infradead.org,
	linuxram@us.ibm.com
Subject: [RFC PATCH 1/2] Makefile: export-symbol usage report generator.

I ran a report to extract export-symbol usage by kernel modules.  The results
are at http://www.sudhaa.com/~ram/misc/export_report.txt

The report lists:
1. All the exported symbols and their usage counts by in-kernel modules.
2. for each in-kernel module, lists the modules and the exported symbols
	from those modules, that it depends on.

Highlights: 
	On x86 architecture
 	(1) 880 exported symbols not used by any in-kernel modules.
        (2) 1792 exported symbols used only once.

I hope this report/tool shall help all inkernel modules to revisit their usage
of kernel interfaces.

This patch integrates the report-generator into the kernel build process. After
applying this patch, invoke 'make export_report'  and it creates the report in
Documentation/export_report.txt

Signed-off-by Ram Pai (linuxram@us.ibm.com)

 Makefile                 |   12 ++++
 scripts/Makefile.modpost |    7 ++
 scripts/export_report.pl    |  135 +++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 154 insertions(+)

Index: 2617rc1/scripts/Makefile.modpost
===================================================================
--- 2617rc1.orig/scripts/Makefile.modpost	2006-04-12 17:20:35.000000000 -0700
+++ 2617rc1/scripts/Makefile.modpost	2006-04-12 17:21:11.000000000 -0700
@@ -60,9 +60,16 @@
 	$(if $(KBUILD_EXTMOD),-o $(modulesymfile)) \
 	$(filter-out FORCE,$^)
 
+quiet_cmd_importfile = IMPORT_EXTRACT
+      cmd_importfile =  perl $(objtree)/scripts/export_report.pl  \
+	-k $(kernelsymfile) \
+	-o $(objtree)/Documentation/export_report.txt	\
+	$(patsubst %.o,%.mod.c,$(filter-out vmlinux FORCE, $^))
+
 PHONY += __modpost
 __modpost: $(wildcard vmlinux) $(modules:.ko=.o) FORCE
 	$(call cmd,modpost)
+	$(if $(KBUILD_EXPORT_REPORT), $(call cmd,importfile))
 
 # Declare generated files as targets for modpost
 $(symverfile):         __modpost ;
Index: 2617rc1/scripts/export_report.pl
===================================================================
--- /dev/null	1970-01-01 00:00:00.000000000 +0000
+++ 2617rc1/scripts/export_report.pl	2006-04-12 17:21:29.000000000 -0700
@@ -0,0 +1,134 @@
+#!/usr/bin/perl
+#
+# (C) Copyright IBM Corporation 2006.
+#	Released under GPL v2.
+#	Author : Ram Pai (linuxram@us.ibm.com)
+#
+# Usage: export_report.pl -k Module.symvers [-o report_file ] *.mod.c
+# 
+
+use Getopt::Std;
+
+sub numerically {
+	($sym, $no1) = split / /, $a;
+	($sym, $no2) = split / /, $b;
+	return $no1 <=> $no2;
+}
+
+sub alphabetically {
+	($module1, $value1, undef) = split / /, "@{$a}";
+	($module2, $value2, undef) = split / /, "@{$b}";
+	if ($value1 == $value2) {
+		if ($module1 lt $module2) {
+			return 1;
+		} elsif ($module1 eq $module2) {
+			return 0;
+		} 
+		return -1;
+	}
+	return $value1 <=> $value2;
+}
+
+sub print_depends_on {
+	my ($href) = @_;
+	print "\n";
+	while (($mod, $list) = each %$href) {
+		print "\t$mod:\n";
+		foreach $sym (sort numerically @{$list}) {
+			($symbol, $no) = split / /, $sym;
+			printf("\t\t%-25s\t%-25d\n", $symbol, $no);
+		}
+		print "\n";
+	}
+	print "\n";
+	print "~"x80 , "\n";
+}
+
+sub usage {
+        die "Usage: @_ -h -k Module.symvers  [ -o outputfile ] \n";
+}
+
+
+if (not getopts('hk:o:') or defined $opt_h or not defined $opt_k) {
+        usage($0);
+}
+
+unless (open(MODULE_SYMVERS, $opt_k)) {
+	die "Sorry, cannot open $opt_k: $!\n";
+}
+
+if (defined $opt_o) {
+	unless (open(OUTPUT_HANDLE, ">$opt_o")) {
+		die "Sorry, cannot open $opt_o: $!\n";
+	}
+	select OUTPUT_HANDLE;
+}
+
+#
+# collect all the symbols and their attributes from the 
+# Module.symvers file
+#
+while ( <MODULE_SYMVERS> ) {
+	chomp;
+	($crc, $symbol, $module, $gpl) = split;
+	$SYMBOL { $symbol } =  [ $module , "0" , $symbol, $gpl];
+}
+close(MODULE_SYMVERS);
+
+#
+# collect the usage count of each symbol.
+#
+for ($i = 0; $i <= $#ARGV; $i++) {
+	$thismod = $ARGV[$i];
+	unless (open(MODULE_MODULE, $thismod)) {
+		print "Sorry, cannot open $kernel: $!\n";
+		next;
+	}
+	while ( <MODULE_MODULE> ) {
+		chomp;
+		if ( $_ !~ /0x[0-9a-f]{7,8},/ ) {
+			next;
+		}
+		(undef, undef, undef, undef, $symbol) = split /([,"])/, $_;
+		($module, $value, $symbol, $gpl) = @{$SYMBOL{$symbol}};
+		$SYMBOL{ $symbol } =  [ $module , $value+1 , $symbol, $gpl];
+		push(@{$MODULE{$thismod}} , $symbol);
+	}
+	close(MODULE_MODULE);
+}
+
+
+print "\tTHIS FILE REPORTS THE USAGE PATTERNS OF EXPORTED SYMBOLS BY IN_TREE\n";
+print "\t\t\t\tMODULES\n";
+printf("%s\n\n\n","x"x80);
+printf("\t\t\t\INDEX\n\n\n");
+printf("SECTION 1: USAGE COUNTS OF ALL EXPORTED SYMBOLS\n");
+printf("SECTION 2: LIST OF MODULES AND THE EXPORTED SYMBOLS THEY USE\n");
+printf("%s\n\n\n","x"x80);
+printf("SECTION 1:\tTHE EXPORTED SYMBOLS AND THEIR USAGE COUNT\n\n");
+printf("%-25s\t%-25s\t%-5s\t%-25s\n", "SYMBOL", "MODULE", "USAGE COUNT", "EXPORT TYPE");
+#
+# print the list of unused exported symbols
+#
+foreach $list (sort alphabetically values(%SYMBOL)) {
+	($module, $value, $symbol, $gpl) = split / /, "@{$list}";
+	printf("%-25s\t%-25s\t%-10s\t%-25s\n", $symbol, $module, $value, $gpl);
+}
+printf("%s\n\n\n","x"x80);
+
+
+printf("SECTION 2:\n\tThis section reports export-symbol-usage of in-kernel
+modules. Each module lists all the modules, and the symbols from the module it
+depends on.  Each listed symbol reports the number of modules using that
+symbols.\n");
+
+print "~"x80 , "\n";
+while (($thismod, $list) = each %MODULE) {
+	undef %depends;
+	print "\t\t\t$thismod\n";
+	foreach $symbol (@{$list}) {
+		($module, $value, undef, $gpl) = @{$SYMBOL{$symbol}};
+		push (@{$depends{"$module"}}, "$symbol $value");
+	}
+	print_depends_on(\%depends);
+}
Index: 2617rc1/Makefile
===================================================================
--- 2617rc1.orig/Makefile	2006-04-12 17:20:35.000000000 -0700
+++ 2617rc1/Makefile	2006-04-12 17:21:11.000000000 -0700
@@ -363,7 +363,7 @@
 # Detect when mixed targets is specified, and make a second invocation
 # of make so .config is not included in this case either (for *config).
 
-no-dot-config-targets := clean mrproper distclean \
+no-dot-config-targets := clean mrproper distclean export_report\
 			 cscope TAGS tags help %docs check%
 
 config-targets := 0
@@ -433,6 +433,16 @@
 core-y		:= usr/
 endif # KBUILD_EXTMOD
 
+ifeq ($(MAKECMDGOALS), export_report)
+  	KBUILD_EXPORT_REPORT := 1
+	export KBUILD_EXPORT_REPORT
+endif
+
+PHONY += export_report
+export_report: FORCE
+	$(Q)$(MAKE) allmodconfig 
+	$(Q)$(MAKE) vmlinux modules
+
 ifeq ($(dot-config),1)
 # In this section, we need .config
 
@@ -1029,6 +1039,8 @@
 	@echo  '  cscope	  - Generate cscope index'
 	@echo  '  kernelrelease	  - Output the release version string'
 	@echo  '  kernelversion	  - Output the version stored in Makefile'
+	@echo  '  export_report	  - Output the export symbol usage '
+	@echo  '		 	in Documentation/export_symbol.txt'
 	@echo  ''
 	@echo  'Static analysers'
 	@echo  '  checkstack      - Generate a list of stack hogs'
-
To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
Please read the FAQ at  http://www.tux.org/lkml/


----- End forwarded message -----

-- 
Nishanth Aravamudan <nacc@us.ibm.com>
IBM Linux Technology Center

--===============26493099952535859==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============26493099952535859==--
