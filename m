From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 19 Feb 2017 09:58:47 +0000
Subject: [PATCH] NFC: st21nfca: Fix potential memory leak
Message-Id: <20170219095847.9397-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: lauro.venancio@openbossa.org, aloisio.almeida@openbossa.org, sameo@linux.intel.com, christophe.ricard@gmail.com
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

If all bits of 'dev_mask' are already set, there is a memory leak because
'info' should be freed before returning.

While fixing it, 'return -ENOMEM' directly if the first kzalloc fails.
This makes the code more readable.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/nfc/st21nfca/core.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/nfc/st21nfca/core.c b/drivers/nfc/st21nfca/core.c
index dacb9166081b..50be3b788f1c 100644
--- a/drivers/nfc/st21nfca/core.c
+++ b/drivers/nfc/st21nfca/core.c
@@ -959,10 +959,8 @@ int st21nfca_hci_probe(void *phy_id, struct nfc_phy_ops *phy_ops,
 	unsigned long quirks = 0;
 
 	info = kzalloc(sizeof(struct st21nfca_hci_info), GFP_KERNEL);
-	if (!info) {
-		r = -ENOMEM;
-		goto err_alloc_hdev;
-	}
+	if (!info)
+		return -ENOMEM;
 
 	info->phy_ops = phy_ops;
 	info->phy_id = phy_id;
@@ -978,8 +976,10 @@ int st21nfca_hci_probe(void *phy_id, struct nfc_phy_ops *phy_ops,
 	 * persistent info to discriminate 2 identical chips
 	 */
 	dev_num = find_first_zero_bit(dev_mask, ST21NFCA_NUM_DEVICES);
-	if (dev_num >= ST21NFCA_NUM_DEVICES)
-		return -ENODEV;
+	if (dev_num >= ST21NFCA_NUM_DEVICES) {
+		r = -ENODEV;
+		goto err_alloc_hdev;
+	}
 
 	set_bit(dev_num, dev_mask);
 
-- 
2.9.3

