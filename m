From: Dave Jones <davej@redhat.com>
Date: Thu, 19 Feb 2004 02:51:39 +0000
Subject: [Kernel-janitors] Re: reference_init.pl for Linux 2.6
Message-Id: <20040219025138.GA1838@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040218182313.7b7b915e.rddunlap@osdl.org>
In-Reply-To: <20040218182313.7b7b915e.rddunlap@osdl.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Randy.Dunlap" <rddunlap@osdl.org>
Cc: kjo <kernel-janitors@osdl.org>, lkml <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@osdl.org>, Linus Torvalds <torvalds@osdl.org>

On Wed, Feb 18, 2004 at 06:23:13PM -0800, Randy.Dunlap wrote:

 > and output from Linux 2.6.3 is at:
 > http://developer.osdl.org/rddunlap/scripts/badrefs.out

Error: ./arch/i386/kernel/cpu/cpufreq/longhaul.o .text refers to 00000358 R_386_PC32 .init.text
Error: ./arch/i386/kernel/cpu/cpufreq/longhaul.o .text refers to 000003ac R_386_PC32 .init.text
Error: ./arch/i386/kernel/cpu/cpufreq/longrun.o .text refers to 0000019b R_386_PC32 .init.text

Here come the cpufreq fixes..
(Linus: also at bk://linux-dj.bkbits.net/cpufreq, with 2 other trivial bits)

		Dave

# This is a BitKeeper generated patch for the following project:
# Project Name: Linux kernel tree
# This patch format is intended for GNU patch command version 2.5 or higher.
# This patch includes the following deltas:
#	           ChangeSet	1.1635  -> 1.1636 
#	arch/i386/kernel/cpu/cpufreq/longhaul.c	1.52    -> 1.53   
#
# The following is the BitKeeper ChangeSet Log
# --------------------------------------------
# 04/02/19	davej@redhat.com	1.1636
# [CPUFREQ] Add extra __init markers to longhaul driver.
# Caught by Randy Dunlap.
# longhaul_cpu_init only gets called during startup, and calls
# other __init routines.
# --------------------------------------------
#
diff -Nru a/arch/i386/kernel/cpu/cpufreq/longhaul.c b/arch/i386/kernel/cpu/cpufreq/longhaul.c
--- a/arch/i386/kernel/cpu/cpufreq/longhaul.c	Thu Feb 19 02:49:01 2004
+++ b/arch/i386/kernel/cpu/cpufreq/longhaul.c	Thu Feb 19 02:49:01 2004
@@ -186,6 +186,7 @@
 	return target;
 }
 
+
 static int guess_fsb(int maxmult)
 {
 	int speed = (cpu_khz/1000);
@@ -203,7 +204,6 @@
 }
 
 
-
 static int __init longhaul_get_ranges (void)
 {
 	struct cpuinfo_x86 *c = cpu_data;
@@ -359,7 +359,7 @@
 	return 0;
 }
 
-static int longhaul_cpu_init (struct cpufreq_policy *policy)
+static int __init longhaul_cpu_init (struct cpufreq_policy *policy)
 {
 	struct cpuinfo_x86 *c = cpu_data;
 	char *cpuname=NULL;
# This is a BitKeeper generated patch for the following project:
# Project Name: Linux kernel tree
# This patch format is intended for GNU patch command version 2.5 or higher.
# This patch includes the following deltas:
#	           ChangeSet	1.1636  -> 1.1637 
#	arch/i386/kernel/cpu/cpufreq/longrun.c	1.17    -> 1.18   
#
# The following is the BitKeeper ChangeSet Log
# --------------------------------------------
# 04/02/19	davej@redhat.com	1.1637
# [CPUFREQ] Add extra __init markers to longrun driver.
# Caught by Randy Dunlap.
# longrun_cpu_init() only gets called during startup, and calls
# other __init routines.
# --------------------------------------------
#
diff -Nru a/arch/i386/kernel/cpu/cpufreq/longrun.c b/arch/i386/kernel/cpu/cpufreq/longrun.c
--- a/arch/i386/kernel/cpu/cpufreq/longrun.c	Thu Feb 19 02:49:08 2004
+++ b/arch/i386/kernel/cpu/cpufreq/longrun.c	Thu Feb 19 02:49:08 2004
@@ -220,7 +220,7 @@
 }
 
 
-static int longrun_cpu_init(struct cpufreq_policy *policy)
+static int __init longrun_cpu_init(struct cpufreq_policy *policy)
 {
 	int                     result = 0;
 
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
