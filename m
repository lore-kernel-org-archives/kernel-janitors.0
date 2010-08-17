From: Tobias Klauser <tklauser@distanz.ch>
Date: Tue, 17 Aug 2010 16:13:05 +0000
Subject: [PATCH] sunhme: Use return value of register_netdev
Message-Id: <1282061585-19527-1-git-send-email-tklauser@distanz.ch>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org

Use the return value provided by register_netdev on error instead of
using a previously set value.

Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
---
 drivers/net/sunhme.c |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/sunhme.c b/drivers/net/sunhme.c
index bd0df1c..d96431e 100644
--- a/drivers/net/sunhme.c
+++ b/drivers/net/sunhme.c
@@ -2808,7 +2808,8 @@ static int __devinit happy_meal_sbus_probe_one(struct platform_device *op, int i
 	happy_meal_set_initial_advertisement(hp);
 	spin_unlock_irq(&hp->happy_lock);
 
-	if (register_netdev(hp->dev)) {
+	err = register_netdev(hp->dev);
+	if (err) {
 		printk(KERN_ERR "happymeal: Cannot register net device, "
 		       "aborting.\n");
 		goto err_out_free_coherent;
@@ -3130,7 +3131,8 @@ static int __devinit happy_meal_pci_probe(struct pci_dev *pdev,
 	happy_meal_set_initial_advertisement(hp);
 	spin_unlock_irq(&hp->happy_lock);
 
-	if (register_netdev(hp->dev)) {
+	err = register_netdev(hp->dev);
+	if (err) {
 		printk(KERN_ERR "happymeal(PCI): Cannot register net device, "
 		       "aborting.\n");
 		goto err_out_iounmap;
-- 
1.7.0.4

