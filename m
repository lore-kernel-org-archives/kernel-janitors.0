From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 18 Aug 2012 08:48:30 +0000
Subject: [patch] staging:iio: prevent divide by zero bugs
Message-Id: <20120818084830.GC30592@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jonathan Cameron <jic23@cam.ac.uk>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <michael.hennerich@analog.com>, Paul Gortmaker <paul.gortmaker@windriver.com>, linux-iio@vger.kernel.org, devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org

"val" is used as a divisor later, so we should check for zero here to
avoid a division by zero.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/iio/imu/adis16400_core.c b/drivers/staging/iio/imu/adis16400_core.c
index 4ce9e3d..e803db1 100644
--- a/drivers/staging/iio/imu/adis16400_core.c
+++ b/drivers/staging/iio/imu/adis16400_core.c
@@ -234,6 +234,8 @@ static ssize_t adis16400_write_frequency(struct device *dev,
 	ret = strict_strtol(buf, 10, &val);
 	if (ret)
 		return ret;
+	if (val = 0)
+		return -EINVAL;
 
 	mutex_lock(&indio_dev->mlock);
 
diff --git a/drivers/staging/iio/gyro/adis16260_core.c b/drivers/staging/iio/gyro/adis16260_core.c
index 93aa431..eb8e9d6 100644
--- a/drivers/staging/iio/gyro/adis16260_core.c
+++ b/drivers/staging/iio/gyro/adis16260_core.c
@@ -195,6 +195,8 @@ static ssize_t adis16260_write_frequency(struct device *dev,
 	ret = strict_strtol(buf, 10, &val);
 	if (ret)
 		return ret;
+	if (val = 0)
+		return -EINVAL;
 
 	mutex_lock(&indio_dev->mlock);
 	if (spi_get_device_id(st->us)) {
diff --git a/drivers/staging/iio/adc/ad7192.c b/drivers/staging/iio/adc/ad7192.c
index 405d9a8..942b3ce 100644
--- a/drivers/staging/iio/adc/ad7192.c
+++ b/drivers/staging/iio/adc/ad7192.c
@@ -647,6 +647,8 @@ static ssize_t ad7192_write_frequency(struct device *dev,
 	ret = strict_strtoul(buf, 10, &lval);
 	if (ret)
 		return ret;
+	if (lval = 0)
+		return -EINVAL;
 
 	mutex_lock(&indio_dev->mlock);
 	if (iio_buffer_enabled(indio_dev)) {
diff --git a/drivers/staging/iio/meter/ade7759.c b/drivers/staging/iio/meter/ade7759.c
index b3f7e0f..eb0a2a9 100644
--- a/drivers/staging/iio/meter/ade7759.c
+++ b/drivers/staging/iio/meter/ade7759.c
@@ -385,6 +385,8 @@ static ssize_t ade7759_write_frequency(struct device *dev,
 	ret = strict_strtol(buf, 10, &val);
 	if (ret)
 		return ret;
+	if (val = 0)
+		return -EINVAL;
 
 	mutex_lock(&indio_dev->mlock);
 
diff --git a/drivers/staging/iio/meter/ade7753.c b/drivers/staging/iio/meter/ade7753.c
index f04ece7..3ccff18 100644
--- a/drivers/staging/iio/meter/ade7753.c
+++ b/drivers/staging/iio/meter/ade7753.c
@@ -425,6 +425,8 @@ static ssize_t ade7753_write_frequency(struct device *dev,
 	ret = strict_strtol(buf, 10, &val);
 	if (ret)
 		return ret;
+	if (val = 0)
+		return -EINVAL;
 
 	mutex_lock(&indio_dev->mlock);
 
diff --git a/drivers/staging/iio/meter/ade7754.c b/drivers/staging/iio/meter/ade7754.c
index 6cee28a..abb1e9c 100644
--- a/drivers/staging/iio/meter/ade7754.c
+++ b/drivers/staging/iio/meter/ade7754.c
@@ -445,6 +445,8 @@ static ssize_t ade7754_write_frequency(struct device *dev,
 	ret = strict_strtol(buf, 10, &val);
 	if (ret)
 		return ret;
+	if (val = 0)
+		return -EINVAL;
 
 	mutex_lock(&indio_dev->mlock);
 
