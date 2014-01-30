From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 30 Jan 2014 11:59:14 +0000
Subject: [patch] iio:imu:adis16400 remove an unneeded check
Message-Id: <20140130115914.GJ12734@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jonathan Cameron <jic23@kernel.org>
Cc: Lars-Peter Clausen <lars@metafoo.de>, Sachin Kamat <sachin.kamat@linaro.org>, linux-iio@vger.kernel.org, kernel-janitors@vger.kernel.org

We know "ret" is zero here so there is no need to check.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/iio/imu/adis16400_core.c b/drivers/iio/imu/adis16400_core.c
index 368660dfe135..411586f49dae 100644
--- a/drivers/iio/imu/adis16400_core.c
+++ b/drivers/iio/imu/adis16400_core.c
@@ -281,7 +281,7 @@ static ssize_t adis16400_write_frequency(struct device *dev,
 	st->variant->set_freq(st, val);
 	mutex_unlock(&indio_dev->mlock);
 
-	return ret ? ret : len;
+	return len;
 }
 
 /* Power down the device */
