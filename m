From: Dan Carpenter <error27@gmail.com>
Date: Thu, 30 Jun 2011 09:01:31 +0000
Subject: [patch] Staging: iio: release locks on error paths
Message-Id: <20110630090131.GL14591@shale.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

There are a couple places here where we should have called
mutex_unlock() before returning.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/staging/iio/accel/adis16201_core.c b/drivers/staging/iio/accel/adis16201_core.c
index cbc59c5..2fd01ae 100644
--- a/drivers/staging/iio/accel/adis16201_core.c
+++ b/drivers/staging/iio/accel/adis16201_core.c
@@ -305,13 +305,17 @@ static int adis16201_read_raw(struct iio_dev *indio_dev,
 		mutex_lock(&indio_dev->mlock);
 		addr = adis16201_addresses[chan->address][0];
 		ret = adis16201_spi_read_reg_16(indio_dev, addr, &val16);
-		if (ret)
+		if (ret) {
+			mutex_unlock(&indio_dev->mlock);
 			return ret;
+		}
 
 		if (val16 & ADIS16201_ERROR_ACTIVE) {
 			ret = adis16201_check_status(indio_dev);
-			if (ret)
+			if (ret) {
+				mutex_unlock(&indio_dev->mlock);
 				return ret;
+			}
 		}
 		val16 = val16 & ((1 << chan->scan_type.realbits) - 1);
 		if (chan->scan_type.sign = 's')
