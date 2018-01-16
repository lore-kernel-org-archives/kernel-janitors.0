From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 16 Jan 2018 20:04:04 +0000
Subject: [PATCH] mailbox/pcc: Delete an error message for a failed memory allocation in acpi_pcc_probe()
Message-Id: <60382a41-83d9-b7a6-e904-e2c869012414@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Jassi Brar <jassisinghbrar@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 16 Jan 2018 20:55:22 +0100

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/mailbox/pcc.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/mailbox/pcc.c b/drivers/mailbox/pcc.c
index 3ef7f036ceea..78097ae183ec 100644
--- a/drivers/mailbox/pcc.c
+++ b/drivers/mailbox/pcc.c
@@ -478,10 +478,8 @@ static int __init acpi_pcc_probe(void)
 
 	pcc_mbox_channels = kzalloc(sizeof(struct mbox_chan) *
 			sum, GFP_KERNEL);
-	if (!pcc_mbox_channels) {
-		pr_err("Could not allocate space for PCC mbox channels\n");
+	if (!pcc_mbox_channels)
 		return -ENOMEM;
-	}
 
 	pcc_doorbell_vaddr = kcalloc(sum, sizeof(void *), GFP_KERNEL);
 	if (!pcc_doorbell_vaddr) {
-- 
2.15.1

