From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 28 Mar 2014 08:33:00 +0000
Subject: [patch] iio: adc: checking for NULL instead of IS_ERR() in probe
Message-Id: <20140328083126.GO25192@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jonathan Cameron <jic23@kernel.org>
Cc: Johannes Thumshirn <morbidrsa@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-iio@vger.kernel.org, kernel-janitors@vger.kernel.org

mcb_request_mem() returns an ERR_PTR(), it doesn't return NULL.

Fixes: 74aeac4da66f ('iio: adc: Add MEN 16z188 ADC driver')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/iio/adc/men_z188_adc.c b/drivers/iio/adc/men_z188_adc.c
index 6989c16..b58d630 100644
--- a/drivers/iio/adc/men_z188_adc.c
+++ b/drivers/iio/adc/men_z188_adc.c
@@ -121,8 +121,8 @@ static int men_z188_probe(struct mcb_device *dev,
 	indio_dev->num_channels = ARRAY_SIZE(z188_adc_iio_channels);
 
 	mem = mcb_request_mem(dev, "z188-adc");
-	if (!mem)
-		return -ENOMEM;
+	if (IS_ERR(mem))
+		return PTR_ERR(mem);
 
 	adc->base = ioremap(mem->start, resource_size(mem));
 	if (adc->base = NULL)
