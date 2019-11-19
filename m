From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 19 Nov 2019 06:21:24 +0000
Subject: [PATCH] iio: adc: intel_mrfld_adc: Allocating too much data in probe()
Message-Id: <20191119062124.kgwg7ujxe6k2ft3o@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jonathan Cameron <jic23@kernel.org>, Vincent Pelletier <plr.vincent@gmail.com>
Cc: Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-iio@vger.kernel.org, kernel-janitors@vger.kernel.org

This probe function is passing the wrong size to devm_iio_device_alloc().
It is supposed to be the size of the private data.  Fortunately,
sizeof(*indio_dev) is larger than sizeof(struct mrfld_adc) so it doesn't
cause a runtime problem.

Fixes: a7118662734a ("iio: adc: intel_mrfld_adc: Add Basin Cove ADC driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/iio/adc/intel_mrfld_adc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/adc/intel_mrfld_adc.c b/drivers/iio/adc/intel_mrfld_adc.c
index 67d096f8180d..c35a1beb817c 100644
--- a/drivers/iio/adc/intel_mrfld_adc.c
+++ b/drivers/iio/adc/intel_mrfld_adc.c
@@ -185,7 +185,7 @@ static int mrfld_adc_probe(struct platform_device *pdev)
 	int irq;
 	int ret;
 
-	indio_dev = devm_iio_device_alloc(dev, sizeof(*indio_dev));
+	indio_dev = devm_iio_device_alloc(dev, sizeof(struct mrfld_adc));
 	if (!indio_dev)
 		return -ENOMEM;
 
-- 
2.11.0
