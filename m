From: Colin King <colin.king@canonical.com>
Date: Thu, 07 Feb 2019 09:39:02 +0000
Subject: [PATCH] iio: adc: ads124s08: fix spelling mistake "converions" -> "conversions"
Message-Id: <20190207093902.7081-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Dan Murphy <dmurphy@ti.com>, linux-iio@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in several dev_err messages. Fix these.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/iio/adc/ti-ads124s08.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/iio/adc/ti-ads124s08.c b/drivers/iio/adc/ti-ads124s08.c
index c2cf58908fc8..53f17e4f2f23 100644
--- a/drivers/iio/adc/ti-ads124s08.c
+++ b/drivers/iio/adc/ti-ads124s08.c
@@ -232,7 +232,7 @@ static int ads124s_read_raw(struct iio_dev *indio_dev,
 
 		ret = ads124s_write_cmd(indio_dev, ADS124S08_START_CONV);
 		if (ret) {
-			dev_err(&priv->spi->dev, "Start converions failed\n");
+			dev_err(&priv->spi->dev, "Start conversions failed\n");
 			goto out;
 		}
 
@@ -246,7 +246,7 @@ static int ads124s_read_raw(struct iio_dev *indio_dev,
 
 		ret = ads124s_write_cmd(indio_dev, ADS124S08_STOP_CONV);
 		if (ret) {
-			dev_err(&priv->spi->dev, "Stop converions failed\n");
+			dev_err(&priv->spi->dev, "Stop conversions failed\n");
 			goto out;
 		}
 
@@ -283,12 +283,12 @@ static irqreturn_t ads124s_trigger_handler(int irq, void *p)
 
 		ret = ads124s_write_cmd(indio_dev, ADS124S08_START_CONV);
 		if (ret)
-			dev_err(&priv->spi->dev, "Start ADC converions failed\n");
+			dev_err(&priv->spi->dev, "Start ADC conversions failed\n");
 
 		buffer[j] = ads124s_read(indio_dev, scan_index);
 		ret = ads124s_write_cmd(indio_dev, ADS124S08_STOP_CONV);
 		if (ret)
-			dev_err(&priv->spi->dev, "Stop ADC converions failed\n");
+			dev_err(&priv->spi->dev, "Stop ADC conversions failed\n");
 
 		j++;
 	}
-- 
2.20.1
