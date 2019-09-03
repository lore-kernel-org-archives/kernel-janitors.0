From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Tue, 03 Sep 2019 15:36:25 +0000
Subject: [PATCH -next] usb: cdns3: Remove redundant dev_err call in cdns3_probe()
Message-Id: <20190903153625.85691-1-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi <felipe.balbi@linux.intel.com>, Pawel Laszczak <pawell@cadence.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org

There is a error message within devm_ioremap_resource
already, so remove the dev_err call to avoid redundant
error message.

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/usb/cdns3/core.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/usb/cdns3/core.c b/drivers/usb/cdns3/core.c
index 300df58a190b..9b1d8fed4e5a 100644
--- a/drivers/usb/cdns3/core.c
+++ b/drivers/usb/cdns3/core.c
@@ -462,10 +462,8 @@ static int cdns3_probe(struct platform_device *pdev)
 
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "dev");
 	regs = devm_ioremap_resource(dev, res);
-	if (IS_ERR(regs)) {
-		dev_err(dev, "couldn't iomap dev resource\n");
+	if (IS_ERR(regs))
 		return PTR_ERR(regs);
-	}
 	cdns->dev_regs	= regs;
 
 	cdns->otg_irq = platform_get_irq_byname(pdev, "otg");
