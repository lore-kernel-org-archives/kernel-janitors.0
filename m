From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Sat, 04 May 2019 06:54:38 +0000
Subject: [PATCH -next] usb: gadget: udc: lpc32xx: fix return value check in lpc32xx_udc_probe()
Message-Id: <20190504070407.56915-1-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Vladimir Zapolskiy <vz@mleia.com>, Sylvain
 Lemieux <slemieux.tyco@gmail.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: kernel-janitors@vger.kernel.org, linux-usb@vger.kernel.org, Wei Yongjun <weiyongjun1@huawei.com>, linux-arm-kernel@lists.infradead.org

In case of error, the function devm_ioremap_resource() returns ERR_PTR()
and never returns NULL. The NULL test in the return value check should
be replaced with IS_ERR().

This issue was detected by using the Coccinelle software.

Fixes: 408b56ca5c8e ("usb: gadget: udc: lpc32xx: simplify probe")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/usb/gadget/udc/lpc32xx_udc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/udc/lpc32xx_udc.c b/drivers/usb/gadget/udc/lpc32xx_udc.c
index d8f1c60793ed..00fb79c6d025 100644
--- a/drivers/usb/gadget/udc/lpc32xx_udc.c
+++ b/drivers/usb/gadget/udc/lpc32xx_udc.c
@@ -3070,9 +3070,9 @@ static int lpc32xx_udc_probe(struct platform_device *pdev)
 	}
 
 	udc->udp_baseaddr = devm_ioremap_resource(dev, res);
-	if (!udc->udp_baseaddr) {
+	if (IS_ERR(udc->udp_baseaddr)) {
 		dev_err(udc->dev, "IO map failure\n");
-		return -ENOMEM;
+		return PTR_ERR(udc->udp_baseaddr);
 	}
 
 	/* Get USB device clock */
