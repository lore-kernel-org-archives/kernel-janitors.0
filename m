From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 17 May 2017 15:45:25 +0000
Subject: [PATCH 1/2] spidev: Delete error messages for failed memory allocations in spidev_open()
Message-Id: <894ea82b-c53b-ccb3-63b2-4adabe518a6d@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <c5452d8c-d123-d5e9-b2cc-a386d1325aec@users.sourceforge.net>
In-Reply-To: <c5452d8c-d123-d5e9-b2cc-a386d1325aec-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-spi-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 17 May 2017 17:17:49 +0200

Omit two extra messages for memory allocation failures in this function.

This issue was detected by using the Coccinelle software.

Link: http://events.linuxfoundation.org/sites/events/files/slides/LCJ16-Refactor_Strings-WSang_0.pdf
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/spi/spidev.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/spi/spidev.c b/drivers/spi/spidev.c
index 9a2a79a871ba..e6dc37fbea4e 100644
--- a/drivers/spi/spidev.c
+++ b/drivers/spi/spidev.c
@@ -603,7 +603,6 @@ static int spidev_open(struct inode *inode, struct file *filp)
 	if (!spidev->tx_buffer) {
 		spidev->tx_buffer = kmalloc(bufsiz, GFP_KERNEL);
 		if (!spidev->tx_buffer) {
-			dev_dbg(&spidev->spi->dev, "open/ENOMEM\n");
 			status = -ENOMEM;
 			goto err_find_dev;
 		}
@@ -612,7 +611,6 @@ static int spidev_open(struct inode *inode, struct file *filp)
 	if (!spidev->rx_buffer) {
 		spidev->rx_buffer = kmalloc(bufsiz, GFP_KERNEL);
 		if (!spidev->rx_buffer) {
-			dev_dbg(&spidev->spi->dev, "open/ENOMEM\n");
 			status = -ENOMEM;
 			goto err_alloc_rx_buf;
 		}
-- 
2.13.0

