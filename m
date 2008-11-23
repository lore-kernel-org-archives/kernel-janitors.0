From: "Hannes Eder" <hannes@hanneseder.net>
Date: Sun, 23 Nov 2008 12:35:48 +0000
Subject: [PATCH] x86: Remove duplicate #define from 'cpufeature.h'
Message-Id: <154e089b0811230435m5d3182feyff0babb8c55cec72@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ingo Molnar <mingo@elte.hu>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Remove duplicate #define from 'cpufeature.h'.

This also fixes the following sparse warning:

arch/x86/kernel/cpu/capflags.c:54:3: warning: Initializer entry defined twice
arch/x86/kernel/cpu/capflags.c:58:3:   also defined here

Signed-off-by: Hannes Eder <hannes@hanneseder.net>
---
 arch/x86/include/asm/cpufeature.h |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/arch/x86/include/asm/cpufeature.h
b/arch/x86/include/asm/cpufeature.h
index 694d1f8..5bce8ed 100644
--- a/arch/x86/include/asm/cpufeature.h
+++ b/arch/x86/include/asm/cpufeature.h
@@ -80,7 +80,6 @@
 #define X86_FEATURE_UP		(3*32+ 9) /* smp kernel running on up */
 #define X86_FEATURE_FXSAVE_LEAK (3*32+10) /* "" FXSAVE leaks FOP/FIP/FOP */
 #define X86_FEATURE_ARCH_PERFMON (3*32+11) /* Intel Architectural PerfMon */
-#define X86_FEATURE_NOPL	(3*32+20) /* The NOPL (0F 1F) instructions */
 #define X86_FEATURE_PEBS	(3*32+12) /* Precise-Event Based Sampling */
 #define X86_FEATURE_BTS		(3*32+13) /* Branch Trace Store */
 #define X86_FEATURE_SYSCALL32	(3*32+14) /* "" syscall in ia32 userspace */
