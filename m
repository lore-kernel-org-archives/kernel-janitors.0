From: Kulikov Vasiliy <segooon@gmail.com>
Date: Sat, 10 Jul 2010 12:28:57 +0000
Subject: [PATCH] adm8211: fix memory leak
Message-Id: <1278764938-9417-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Michael Wu <flamingice@sourmilk.net>, "John W. Linville" <linville@tuxdriver.com>, "David S. Miller" <davem@davemloft.net>, Johannes Berg <johannes@sipsolutions.net>, Kalle Valo <kalle.valo@iki.fi>, "Luis R. Rodriguez" <lrodriguez@atheros.com>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org

We must free priv->eeprom allocated in adm8211_read_eeprom().

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
---
 drivers/net/wireless/adm8211.c |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/drivers/net/wireless/adm8211.c b/drivers/net/wireless/adm8211.c
index 880ad9d..bde2fa8 100644
--- a/drivers/net/wireless/adm8211.c
+++ b/drivers/net/wireless/adm8211.c
@@ -1903,7 +1903,7 @@ static int __devinit adm8211_probe(struct pci_dev *pdev,
 	if (err) {
 		printk(KERN_ERR "%s (adm8211): Cannot register device\n",
 		       pci_name(pdev));
-		goto err_free_desc;
+		goto err_free_eeprom;
 	}
 
 	printk(KERN_INFO "%s: hwaddr %pM, Rev 0x%02x\n",
@@ -1912,6 +1912,9 @@ static int __devinit adm8211_probe(struct pci_dev *pdev,
 
 	return 0;
 
+ err_free_eeprom:
+	kfree(priv->eeprom);
+
  err_free_desc:
 	pci_free_consistent(pdev,
 			    sizeof(struct adm8211_desc) * priv->rx_ring_size +
-- 
1.7.0.4

