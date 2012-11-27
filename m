From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 27 Nov 2012 07:24:52 +0000
Subject: [patch] iio:gyro: adis16136: divide by zero in write_frequency()
Message-Id: <20121127072452.GA8239@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jonathan Cameron <jic23@cam.ac.uk>
Cc: Lars-Peter Clausen <lars@metafoo.de>, linux-iio@vger.kernel.org, kernel-janitors@vger.kernel.org

It's slightly cleaner to use kstrtouint() because we pass unsigned ints
to adis16136_set_freq().  On 64 bit systems, if the user passed LONG_MIN
then it we would get past the test against zero but crash in
adis16136_set_freq() because we truncate the high bits away.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/iio/gyro/adis16136.c b/drivers/iio/gyro/adis16136.c
index 05486df..b4ee339 100644
--- a/drivers/iio/gyro/adis16136.c
+++ b/drivers/iio/gyro/adis16136.c
@@ -203,10 +203,10 @@ static ssize_t adis16136_write_frequency(struct device *dev,
 {
 	struct iio_dev *indio_dev = dev_to_iio_dev(dev);
 	struct adis16136 *adis16136 = iio_priv(indio_dev);
-	long val;
+	unsigned int val;
 	int ret;
 
-	ret = kstrtol(buf, 10, &val);
+	ret = kstrtouint(buf, 10, &val);
 	if (ret)
 		return ret;
 
