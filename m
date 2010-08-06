From: Kulikov Vasiliy <segooon@gmail.com>
Date: Fri, 06 Aug 2010 19:51:54 +0000
Subject: [PATCH 09/18] isdn: mISDN: call disable_pci_device() if pci_probe() failed
Message-Id: <1281124316-13626-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Karsten Keil <isdn@linux-pingi.de>, "David S. Miller" <davem@davemloft.net>, Andrew Morton <akpm@linux-foundation.org>, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Peter Huewe <peterhuewe@gmx.de>, Tejun Heo <tj@kernel.org>, netdev@vger.kernel.org

Driver should call disable_pci_device() if it returns from pci_probe()
with error. Also it must not be called if request_region() fails as
it means that somebody uses device resources and rules the device.

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
---
 drivers/isdn/hardware/mISDN/mISDNinfineon.c |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/drivers/isdn/hardware/mISDN/mISDNinfineon.c b/drivers/isdn/hardware/mISDN/mISDNinfineon.c
index d2dd61d..142744c 100644
--- a/drivers/isdn/hardware/mISDN/mISDNinfineon.c
+++ b/drivers/isdn/hardware/mISDN/mISDNinfineon.c
@@ -1094,6 +1094,7 @@ inf_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 		pr_info("mISDN: do not have informations about adapter at %s\n",
 			pci_name(pdev));
 		kfree(card);
+		pci_disable_device(pdev);
 		return -EINVAL;
 	} else
 		pr_notice("mISDN: found adapter %s at %s\n",
@@ -1103,7 +1104,8 @@ inf_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	pci_set_drvdata(pdev, card);
 	err = setup_instance(card);
 	if (err) {
-		pci_disable_device(card->pdev);
+		if (err != -EBUSY)
+			pci_disable_device(pdev);
 		kfree(card);
 		pci_set_drvdata(pdev, NULL);
 	} else if (ent->driver_data = INF_SCT_1) {
@@ -1114,6 +1116,7 @@ inf_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 			sc = kzalloc(sizeof(struct inf_hw), GFP_KERNEL);
 			if (!sc) {
 				release_card(card);
+				pci_disable_device(pdev);
 				return -ENOMEM;
 			}
 			sc->irq = card->irq;
@@ -1121,6 +1124,8 @@ inf_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 			sc->ci = card->ci + i;
 			err = setup_instance(sc);
 			if (err) {
+				if (err != -EBUSY)
+					pci_disable_device(pdev);
 				kfree(sc);
 				release_card(card);
 				break;
-- 
1.7.0.4

