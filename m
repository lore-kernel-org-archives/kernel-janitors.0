From: Markus Elfring <Markus.Elfring@web.de>
Date: Thu, 19 Sep 2019 13:56:56 +0000
Subject: [PATCH] usb: gadget: udc: lpc32xx: Use devm_platform_ioremap_resource() in lpc32xx_udc_probe()
Message-Id: <6671a08a-fb20-f15e-5dbd-8b6b710e0ef9@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Alexandre Belloni <alexandre.belloni@bootlin.com>, Arnd Bergmann <arnd@arndb.de>, Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Stephen Boyd <swboyd@chromium.org>, Sylvain Lemieux <slemieux.tyco@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>, Wei Yongjun <weiyongjun1@huawei.com>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Himanshu Jha <himanshujha199640@gmail.com>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 19 Sep 2019 15:47:24 +0200

Simplify this function implementation by using a known wrapper function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/usb/gadget/udc/lpc32xx_udc.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/usb/gadget/udc/lpc32xx_udc.c b/drivers/usb/gadget/udc/lpc32xx_udc.c
index b3e073fb88c6..0ed3fd8c6610 100644
--- a/drivers/usb/gadget/udc/lpc32xx_udc.c
+++ b/drivers/usb/gadget/udc/lpc32xx_udc.c
@@ -3000,7 +3000,6 @@ static int lpc32xx_udc_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct lpc32xx_udc *udc;
 	int retval, i;
-	struct resource *res;
 	dma_addr_t dma_handle;
 	struct device_node *isp1301_node;

@@ -3048,9 +3047,6 @@ static int lpc32xx_udc_probe(struct platform_device *pdev)
 	 *  IORESOURCE_IRQ, USB device interrupt number
 	 *  IORESOURCE_IRQ, USB transceiver interrupt number
 	 */
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res)
-		return -ENXIO;

 	spin_lock_init(&udc->lock);

@@ -3061,7 +3057,7 @@ static int lpc32xx_udc_probe(struct platform_device *pdev)
 			return udc->udp_irq[i];
 	}

-	udc->udp_baseaddr = devm_ioremap_resource(dev, res);
+	udc->udp_baseaddr = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(udc->udp_baseaddr)) {
 		dev_err(udc->dev, "IO map failure\n");
 		return PTR_ERR(udc->udp_baseaddr);
--
2.23.0
