From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 24 May 2017 18:03:45 +0000
Subject: [PATCH 1/2] blackfin: Delete an error message for a failed memory allocation in bfin_pm_suspend_mem_
Message-Id: <ba3c2de3-a43d-0725-90c2-9c3b465eeb84@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <a8f92213-f0c5-8a4f-2b9e-60645f426210@users.sourceforge.net>
In-Reply-To: <a8f92213-f0c5-8a4f-2b9e-60645f426210@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: adi-buildroot-devel@lists.sourceforge.net, Ingo Molnar <mingo@kernel.org>, Steven Miao <realmz6@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 24 May 2017 19:29:25 +0200

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Link: http://events.linuxfoundation.org/sites/events/files/slides/LCJ16-Refactor_Strings-WSang_0.pdf
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/blackfin/mach-common/pm.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/blackfin/mach-common/pm.c b/arch/blackfin/mach-common/pm.c
index 5ece38a5b758..f4d442b7a1a1 100644
--- a/arch/blackfin/mach-common/pm.c
+++ b/arch/blackfin/mach-common/pm.c
@@ -151,10 +151,8 @@ int bfin_pm_suspend_mem_enter(void)
 					 + L1_DATA_B_LENGTH + L1_SCRATCH_LENGTH,
 					  GFP_ATOMIC);
 
-	if (memptr = NULL) {
-		panic("bf53x_suspend_l1_mem malloc failed");
+	if (!memptr)
 		return -ENOMEM;
-	}
 
 #ifndef CONFIG_BF60x
 	wakeup = bfin_read_VR_CTL() & ~FREQ;
-- 
2.13.0

