From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 15 Oct 2017 20:36:34 +0000
Subject: [PATCH] ipmi_si: Delete an error message for a failed memory allocation in try_smi_init()
Message-Id: <dc91d8bf-c484-4411-f307-cadf7ad510f5@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: openipmi-developer@lists.sourceforge.net, Corey Minyard <minyard@acm.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 15 Oct 2017 22:30:11 +0200

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/char/ipmi/ipmi_si_intf.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/char/ipmi/ipmi_si_intf.c b/drivers/char/ipmi/ipmi_si_intf.c
index 55e0c42bee4d..2aed46a6c49c 100644
--- a/drivers/char/ipmi/ipmi_si_intf.c
+++ b/drivers/char/ipmi/ipmi_si_intf.c
@@ -2095,7 +2095,6 @@ static int try_smi_init(struct smi_info *new_smi)
 	/* Allocate the state machine's data and initialize it. */
 	new_smi->si_sm = kmalloc(new_smi->handlers->size(), GFP_KERNEL);
 	if (!new_smi->si_sm) {
-		pr_err(PFX "Could not allocate state machine memory\n");
 		rv = -ENOMEM;
 		goto out_err;
 	}
-- 
2.14.2

