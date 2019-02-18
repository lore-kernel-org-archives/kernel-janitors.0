From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Mon, 18 Feb 2019 06:57:35 +0000
Subject: [PATCH -next] iio: adc: ingenic: remove redundant dev_err call in ingenic_adc_probe()
Message-Id: <20190218065735.159915-1-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Artur Rojek <contact@artur-rojek.eu>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, linux-iio@vger.kernel.org, kernel-janitors@vger.kernel.org

There is a error message within devm_ioremap_resource
already, so remove the dev_err call to avoid redundant
error message.

Fixes: 1a78daea107d ("IIO: add Ingenic JZ47xx ADC driver.")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/iio/adc/ingenic-adc.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/iio/adc/ingenic-adc.c b/drivers/iio/adc/ingenic-adc.c
index 6ee1673deb0d..8f9c125939a8 100644
--- a/drivers/iio/adc/ingenic-adc.c
+++ b/drivers/iio/adc/ingenic-adc.c
@@ -302,10 +302,8 @@ static int ingenic_adc_probe(struct platform_device *pdev)
 
 	mem_base = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	adc->base = devm_ioremap_resource(dev, mem_base);
-	if (IS_ERR(adc->base)) {
-		dev_err(dev, "Unable to ioremap mmio resource\n");
+	if (IS_ERR(adc->base))
 		return PTR_ERR(adc->base);
-	}
 
 	adc->clk = devm_clk_get(dev, "adc");
 	if (IS_ERR(adc->clk)) {
