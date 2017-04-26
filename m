From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 26 Apr 2017 21:03:49 +0000
Subject: [PATCH] iio: adc: mxs-lradc: Checking IS_ERR() instead of NULL
Message-Id: <20170426210349.sjmf65ck5awfgz22@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jonathan Cameron <jic23@kernel.org>, Ksenija Stanojevic <ksenija.stanojevic@gmail.com>
Cc: Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Lee Jones <lee.jones@linaro.org>, Marek Vasut <marex@denx.de>, linux-iio@vger.kernel.org, kernel-janitors@vger.kernel.org

devm_ioremap() returns NULL on error.  It doesn't return error pointers.

Fixes: 6dd112b9f85e ("iio: adc: mxs-lradc: Add support for ADC driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/iio/adc/mxs-lradc-adc.c b/drivers/iio/adc/mxs-lradc-adc.c
index b0c7d8ee5cb8..493e2a26415d 100644
--- a/drivers/iio/adc/mxs-lradc-adc.c
+++ b/drivers/iio/adc/mxs-lradc-adc.c
@@ -719,8 +719,8 @@ static int mxs_lradc_adc_probe(struct platform_device *pdev)
 
 	iores = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	adc->base = devm_ioremap(dev, iores->start, resource_size(iores));
-	if (IS_ERR(adc->base))
-		return PTR_ERR(adc->base);
+	if (!adc->base)
+		return -ENOMEM;
 
 	init_completion(&adc->completion);
 	spin_lock_init(&adc->lock);
