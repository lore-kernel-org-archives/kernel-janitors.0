From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 06 Aug 2017 08:00:20 +0000
Subject: [PATCH] ATM-lanai: Delete an error message for a failed memory allocation in lanai_init_one()
Message-Id: <ce30adf8-c5be-df17-0c74-42061ff2fd42@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-atm-general@lists.sourceforge.net, netdev@vger.kernel.org, Chas Williams <3chas3@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 6 Aug 2017 09:42:52 +0200

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Link: http://events.linuxfoundation.org/sites/events/files/slides/LCJ16-Refactor_Strings-WSang_0.pdf
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/atm/lanai.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/atm/lanai.c b/drivers/atm/lanai.c
index 2351dad78ff5..f4cb6c5870bf 100644
--- a/drivers/atm/lanai.c
+++ b/drivers/atm/lanai.c
@@ -2562,11 +2562,8 @@ static int lanai_init_one(struct pci_dev *pci,
 	int result;
 
 	lanai = kmalloc(sizeof(*lanai), GFP_KERNEL);
-	if (lanai = NULL) {
-		printk(KERN_ERR DEV_LABEL
-		       ": couldn't allocate dev_data structure!\n");
+	if (!lanai)
 		return -ENOMEM;
-	}
 
 	atmdev = atm_dev_register(DEV_LABEL, &pci->dev, &ops, -1, NULL);
 	if (atmdev = NULL) {
-- 
2.13.4

