From: Kulikov Vasiliy <segooon@gmail.com>
Date: Fri, 06 Aug 2010 19:52:44 +0000
Subject: [PATCH 11/18] pcmcia: pd6729: call disable_pci_device() if pci_probe() failed
Message-Id: <1281124366-13716-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Dominik Brodowski <linux@dominikbrodowski.net>, Komuro <komurojun-mbn@nifty.com>, Wolfram Sang <w.sang@pengutronix.de>, "David S. Miller" <davem@davemloft.net>, Tejun Heo <tj@kernel.org>, linux-pcmcia@lists.infradead.org, linux-kernel@vger.kernel.org

Driver should call disable_pci_device() if it returns from pci_probe()
with error. Also it must not be called if pci_request_region() fails as
it means that somebody uses device resources and rules the device.

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
---
 drivers/pcmcia/pd6729.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pcmcia/pd6729.c b/drivers/pcmcia/pd6729.c
index b8a869a..1858c3a 100644
--- a/drivers/pcmcia/pd6729.c
+++ b/drivers/pcmcia/pd6729.c
@@ -646,7 +646,7 @@ static int __devinit pd6729_pci_probe(struct pci_dev *dev,
 	if (!pci_resource_start(dev, 0)) {
 		dev_warn(&dev->dev, "refusing to load the driver as the "
 			"io_base is NULL.\n");
-		goto err_out_free_mem;
+		goto err_out_disable;
 	}
 
 	dev_info(&dev->dev, "Cirrus PD6729 PCI to PCMCIA Bridge at 0x%llx "
@@ -666,7 +666,7 @@ static int __devinit pd6729_pci_probe(struct pci_dev *dev,
 	ret = pci_request_regions(dev, "pd6729");
 	if (ret) {
 		dev_warn(&dev->dev, "pci request region failed.\n");
-		goto err_out_disable;
+		goto err_out_free_mem;
 	}
 
 	if (dev->irq = NO_IRQ)
-- 
1.7.0.4

