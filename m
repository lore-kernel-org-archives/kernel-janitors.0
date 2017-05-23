From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 23 May 2017 20:52:20 +0000
Subject: [PATCH 2/5] MIPS: smp-cps: Delete error messages for failed memory allocations in cps_prepare_cpus()
Message-Id: <3e8f04ae-8457-0531-e38e-0e682b99ed3f@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <e866716c-5ce4-3658-f944-e310007db127@users.sourceforge.net>
In-Reply-To: <e866716c-5ce4-3658-f944-e310007db127@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-mips@linux-mips.org, Ingo Molnar <mingo@kernel.org>, James Hogan <james.hogan@imgtec.com>, Kees Cook <keescook@chromium.org>, Marcin Nowakowski <marcin.nowakowski@imgtec.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Matt Redfearn <matt.redfearn@imgtec.com>, Paul Burton <paul.burton@imgtec.com>, =?UTF-8?Q?Ralf_B=c3=a4chle?= <ralf@linux-mips.org>, Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 23 May 2017 21:41:32 +0200

Omit two extra messages for memory allocation failures in this function.

This issue was detected by using the Coccinelle software.

Link: http://events.linuxfoundation.org/sites/events/files/slides/LCJ16-Refactor_Strings-WSang_0.pdf
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/mips/kernel/smp-cps.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/arch/mips/kernel/smp-cps.c b/arch/mips/kernel/smp-cps.c
index 36954ddd0b9f..bc8d7f6a62c2 100644
--- a/arch/mips/kernel/smp-cps.c
+++ b/arch/mips/kernel/smp-cps.c
@@ -171,7 +171,5 @@ static void __init cps_prepare_cpus(unsigned int max_cpus)
-	if (!mips_cps_core_bootcfg) {
-		pr_err("Failed to allocate boot config for %u cores\n", ncores);
+	if (!mips_cps_core_bootcfg)
 		goto err_out;
-	}
 
 	/* Allocate VPE boot configuration structs */
 	for (c = 0; c < ncores; c++) {
@@ -182,8 +180,5 @@ static void __init cps_prepare_cpus(unsigned int max_cpus)
-		if (!mips_cps_core_bootcfg[c].vpe_config) {
-			pr_err("Failed to allocate %u VPE boot configs\n",
-			       core_vpes);
+		if (!mips_cps_core_bootcfg[c].vpe_config)
 			goto err_out;
-		}
 	}
 
 	/* Mark this CPU as booted */
-- 
2.13.0

