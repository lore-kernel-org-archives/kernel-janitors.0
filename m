From: Michael Still <mikal@stillhq.com>
Date: Mon, 19 Apr 2004 00:19:53 +0000
Subject: [Kernel-janitors] [RFT] Update to the mandocs build target
Message-Id: <40831B29.9010108@stillhq.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------040900060607060404050003"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------040900060607060404050003
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit


Heya,

a while ago I whipped up a mandocs build target for 2.6 which is now 
included with the default kernel. The attached patch updates this build 
target to more exhaustively identify potential man pages. This makes the 
build of this target a little slower than before, but gives you a _lot_ 
more manpages.

I'm interested in some people applying the patch to the latest kernel, 
and letting me know if it works for them before I unleash it upon the 
masses.

Thanks,
Mikal

-- 

Michael Still (mikal@stillhq.com) | "All my life I've had one dream,
http://www.stillhq.com            |  to achieve my many goals"
UTC + 11                          |    -- Homer Simpson

--------------040900060607060404050003
Content-Type: text/plain;
 name="mandocsimp-004"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="mandocsimp-004"

diff -Nur linux-2.6.5-cset-20040404_0407/Documentation/DocBook/Makefile linux-2.6.5-cset-20040404_0407-mandocsimp/Documentation/DocBook/Makefile
--- linux-2.6.5-cset-20040404_0407/Documentation/DocBook/Makefile	2004-04-13 13:39:39.000000000 +1000
+++ linux-2.6.5-cset-20040404_0407-mandocsimp/Documentation/DocBook/Makefile	2004-04-13 13:44:11.000000000 +1000
@@ -24,7 +24,7 @@
 
 ###
 # The targets that may be used.
-.PHONY:	sgmldocs psdocs pdfdocs htmldocs mandocs installmandocs
+.PHONY:	sgmldocs psdocs pdfdocs htmldocs mandocs installmandocs cleanmandocs
 
 BOOKS := $(addprefix $(obj)/,$(DOCBOOKS))
 sgmldocs: $(BOOKS)
@@ -38,12 +38,6 @@
 HTML := $(patsubst %.sgml, %.html, $(BOOKS))
 htmldocs: $(HTML)
 
-MAN := $(patsubst %.sgml, %.9, $(BOOKS))
-mandocs: $(MAN)
-
-installmandocs: mandocs
-	$(MAKEMAN) install Documentation/DocBook/man
-
 ###
 #External programs used
 KERNELDOC = scripts/kernel-doc
@@ -139,9 +133,18 @@
 ###
 # Rule to generate man files - output is placed in the man subdirectory
 
-%.9:	%.sgml
-	$(SPLITMAN) $< $(objtree)/Documentation/DocBook/man "$(VERSION).$(PATCHLEVEL).$(SUBLEVEL)"
-	$(MAKEMAN) convert $(objtree)/Documentation/DocBook/man $<
+mandocs:
+	echo "" > $(obj)/allcomments.sgml
+	find $(objtree) -type f -name "*.[ch]" -exec $(KERNELDOC) -docbook -silentfail {} >> $(obj)/allcomments.sgml \;
+	$(SPLITMAN) $(obj)/allcomments.sgml $(objtree)/Documentation/DocBook/man "$(VERSION).$(PATCHLEVEL).$(SUBLEVEL)"
+	$(MAKEMAN) convert $(objtree)/Documentation/DocBook/man $(obj)/allcomments.sgml
+
+installmandocs: $(objtree)/Documentation/DocBook/allcomments.sgml
+	$(MAKEMAN) install Documentation/DocBook/man
+
+cleanmandocs:
+	find $(objtree)/Documentation/DocBook/man -type f -name "*.sgml" -exec rm -f {} \;
+	find $(objtree)/Documentation/DocBook/man -type f -name "*.9.gz" -exec rm -f {} \;
 
 ###
 # Rules to generate postscripts and PNG imgages from .fig format files
@@ -196,7 +199,8 @@
 	$(patsubst %.sgml, %.9,    $(DOCBOOKS)) \
 	$(patsubst %.fig,%.eps,    $(IMG-parportbook)) \
 	$(patsubst %.fig,%.png,    $(IMG-parportbook)) \
-	$(C-procfs-example)
+	$(C-procfs-example) \
+	allcomments.sgml
 
 ifneq ($(wildcard $(patsubst %.html,%,$(HTML))),)
 clean-rule := rm -rf $(wildcard $(patsubst %.html,%,$(HTML)))
diff -Nur linux-2.6.5-cset-20040404_0407/Documentation/DocBook/man/Makefile linux-2.6.5-cset-20040404_0407-mandocsimp/Documentation/DocBook/man/Makefile
--- linux-2.6.5-cset-20040404_0407/Documentation/DocBook/man/Makefile	2004-04-13 13:39:39.000000000 +1000
+++ linux-2.6.5-cset-20040404_0407-mandocsimp/Documentation/DocBook/man/Makefile	2004-04-13 13:45:23.000000000 +1000
@@ -1,3 +1,3 @@
 # Rules are put in Documentation/DocBook
 
-clean-files := *.9.gz *.sgml manpage.links manpage.refs
+clean-files := manpage.links manpage.refs
diff -Nur linux-2.6.5-cset-20040404_0407/Makefile linux-2.6.5-cset-20040404_0407-mandocsimp/Makefile
--- linux-2.6.5-cset-20040404_0407/Makefile	2004-04-13 13:39:55.000000000 +1000
+++ linux-2.6.5-cset-20040404_0407-mandocsimp/Makefile	2004-04-13 13:44:11.000000000 +1000
@@ -799,7 +799,7 @@
 quiet_cmd_rmfiles = $(if $(rm-files),CLEAN   $(rm-files))
       cmd_rmfiles = rm -rf $(rm-files)
 
-clean: archclean $(clean-dirs)
+clean: archclean $(clean-dirs) cleanmandocs
 	$(call cmd,rmdirs)
 	$(call cmd,rmfiles)
 	@find . $(RCS_FIND_IGNORE) \
diff -Nur linux-2.6.5-cset-20040404_0407/scripts/kernel-doc linux-2.6.5-cset-20040404_0407-mandocsimp/scripts/kernel-doc
--- linux-2.6.5-cset-20040404_0407/scripts/kernel-doc	2004-04-13 13:39:24.000000000 +1000
+++ linux-2.6.5-cset-20040404_0407-mandocsimp/scripts/kernel-doc	2004-04-13 13:44:11.000000000 +1000
@@ -2,12 +2,13 @@
 
 use strict;
 
-## Copyright (c) 1998 Michael Zucchi, All Rights Reserved        ##
+## Copyright (C) 1998     Michael Zucchi, All Rights Reserved    ##
 ## Copyright (C) 2000, 1  Tim Waugh <twaugh@redhat.com>          ##
-## Copyright (C) 2001  Simon Huggins                             ##
+## Copyright (C) 2001     Simon Huggins                          ##
+## Copyright (C) 2004     Michael Still <mikal@stillhq.com>      ##
 ## 								 ##
 ## #define enhancements by Armin Kuster <akuster@mvista.com>	 ##
-## Copyright (c) 2000 MontaVista Software, Inc.			 ##
+## Copyright (C) 2000 MontaVista Software, Inc.			 ##
 ## 								 ##
 ## This software falls under the GNU General Public License.     ##
 ## Please read the COPYING file for more information             ##
@@ -36,6 +37,7 @@
 #              Small fixes (like spaces vs. \s in regex)
 # -- Tim Jansen <tim@tjansen.de>
 
+# 15/03/2004 - Tweaked script to better support mandocs target
 
 #
 # This will read a 'c' file and scan for embedded comments in the
@@ -45,7 +47,7 @@
 # Note: This only supports 'c'.
 
 # usage:
-# kerneldoc [ -docbook | -html | -text | -man ]
+# kerneldoc [ -docbook [-silentfail] | -html | -text | -man ]
 #           [ -function funcname [ -function funcname ...] ] c file(s)s > outputfile
 # or
 #           [ -nofunction funcname [ -function funcname ...] ] c file(s)s > outputfile
@@ -206,7 +208,7 @@
 
 
 sub usage {
-    print "Usage: $0 [ -v ] [ -docbook | -html | -text | -man ]\n";
+    print "Usage: $0 [ -v ] [ -docbook [-silentfail] | -html | -text | -man ]\n";
     print "         [ -function funcname [ -function funcname ...] ]\n";
     print "         [ -nofunction funcname [ -nofunction funcname ...] ]\n";
     print "         c source file(s) > outputfile\n";
@@ -283,6 +285,8 @@
 
 my $undescribed = "-- undescribed --";
 
+my $silentfail = 0;
+
 reset_state();
 
 while ($ARGV[0] =~ m/^-(.*)/) {
@@ -322,7 +326,9 @@
     } elsif (($cmd eq "-h") || ($cmd eq "--help")) {
 	usage();
     } elsif ($cmd eq '-filelist') {
-	    $filelist = shift @ARGV;
+	$filelist = shift @ARGV;
+    } elsif ($cmd eq '-silentfail') {
+	$silentfail = 1;
     }
 }
 
@@ -1701,8 +1707,10 @@
           }
     }
     if ($initial_section_counter == $section_counter) {
-	print STDERR "Warning(${file}): no structured comments found\n";
-	if ($output_mode eq "sgml") {
+        if($silentfail == 0){
+	    print STDERR "Warning(${file}): no structured comments found\n";
+	}
+	if (($output_mode eq "sgml") && ($silentfail == 0)) {
 	    # The template wants at least one RefEntry here; make one.
 	    print "<refentry>\n";
 	    print " <refnamediv>\n";
diff -Nur linux-2.6.5-cset-20040404_0407/scripts/makeman linux-2.6.5-cset-20040404_0407-mandocsimp/scripts/makeman
--- linux-2.6.5-cset-20040404_0407/scripts/makeman	2004-04-13 13:39:24.000000000 +1000
+++ linux-2.6.5-cset-20040404_0407-mandocsimp/scripts/makeman	2004-04-13 13:44:11.000000000 +1000
@@ -2,7 +2,7 @@
 
 use strict;
 
-## Copyright (C) Michael Still (mikal@stillhq.com)
+## Copyright (C) 2003, 4     Michael Still (mikal@stillhq.com)
 ## Released under the terms of the GNU GPL
 ##
 ## A script to make or install the manpages extracted by split-man
@@ -176,7 +176,7 @@
   }
 }
 elsif($ARGV[0] eq "install"){
-  system("mkdir -p /usr/local/man/man9/; install $ARGV[1]/*.9.gz /usr/local/man/man9/");
+  system("mkdir -p /usr/local/man/man9/; find $ARGV[1] -type f -name '*.9.gz' -exec install {} /usr/local/man/man9/ \\;");
 }
 else{
   die "Usage: makeman [convert | install] <dir> <file>\n";

--------------040900060607060404050003
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------040900060607060404050003--
