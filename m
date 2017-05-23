From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 23 May 2017 20:51:20 +0000
Subject: [PATCH 1/5] MIPS: pm-cps: Delete an error message for a failed memory allocation in cps_pm_online_cp
Message-Id: <b4a16560-9557-8d4c-d46c-2dd658bfa036@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <e866716c-5ce4-3658-f944-e310007db127@users.sourceforge.net>
In-Reply-To: <e866716c-5ce4-3658-f944-e310007db127@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-mips@linux-mips.org, Ingo Molnar <mingo@kernel.org>, James Hogan <james.hogan@imgtec.com>, Kees Cook <keescook@chromium.org>, Marcin Nowakowski <marcin.nowakowski@imgtec.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Matt Redfearn <matt.redfearn@imgtec.com>, Paul Burton <paul.burton@imgtec.com>, =?UTF-8?Q?Ralf_B=c3=a4chle?= <ralf@linux-mips.org>, Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From c7eaa7be6235b37023b23b40b36737f72e5b4b3f Mon Sep 17 00:00:00 2001
From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 23 May 2017 21:30:11 +0200
Subject: [PATCH 1/5] MIPS: pm-cps: Delete an error message for a failed memory allocation in cps_pm_online_cpu()

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Link: http://events.linuxfoundation.org/sites/events/files/slides/LCJ16-Refactor_Strings-WSang_0.pdf
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/mips/kernel/pm-cps.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/mips/kernel/pm-cps.c b/arch/mips/kernel/pm-cps.c
index 5f928c34c148..d662838e418f 100644
--- a/arch/mips/kernel/pm-cps.c
+++ b/arch/mips/kernel/pm-cps.c
@@ -666,7 +666,6 @@ static int cps_pm_online_cpu(unsigned int cpu)
-		if (!core_rc) {
-			pr_err("Failed allocate core %u ready_count\n", core);
+		if (!core_rc)
 			return -ENOMEM;
-		}
+
 		per_cpu(ready_count_alloc, core) = core_rc;
 
 		/* Ensure ready_count is aligned to a cacheline boundary */
-- 
2.13.0

