From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 26 Oct 2017 13:45:43 +0000
Subject: [PATCH] iio/pressure/hp206c: Use common error handling code in hp206c_conv_and_read()
Message-Id: <bbe04556-c62c-6074-d663-884a702614f4@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-iio@vger.kernel.org, Crestez Dan Leonard <leonard.crestez@intel.com>, Hartmut Knaack <knaack.h@gmx.de>, Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 26 Oct 2017 15:34:46 +0200

Add a jump target so that a specific error message is stored only once
at the end of this function implementation.
Replace two calls of the function "dev_err" by goto statements.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/iio/pressure/hp206c.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/iio/pressure/hp206c.c b/drivers/iio/pressure/hp206c.c
index c38c19678cf6..978338f2a6e5 100644
--- a/drivers/iio/pressure/hp206c.c
+++ b/drivers/iio/pressure/hp206c.c
@@ -176,10 +176,8 @@ static int hp206c_conv_and_read(struct iio_dev *indio_dev,
 	struct i2c_client *client = data->client;
 
 	ret = hp206c_wait_dev_rdy(indio_dev);
-	if (ret < 0) {
-		dev_err(&indio_dev->dev, "Device not ready: %d\n", ret);
-		return ret;
-	}
+	if (ret < 0)
+		goto report_failure;
 
 	ret = i2c_smbus_write_byte(client, conv_cmd);
 	if (ret < 0) {
@@ -190,16 +188,18 @@ static int hp206c_conv_and_read(struct iio_dev *indio_dev,
 	usleep_range(sleep_us, sleep_us * 3 / 2);
 
 	ret = hp206c_wait_dev_rdy(indio_dev);
-	if (ret < 0) {
-		dev_err(&indio_dev->dev, "Device not ready: %d\n", ret);
-		return ret;
-	}
+	if (ret < 0)
+		goto report_failure;
 
 	ret = hp206c_read_20bit(client, read_cmd);
 	if (ret < 0)
 		dev_err(&indio_dev->dev, "Failed read: %d\n", ret);
 
 	return ret;
+
+report_failure:
+	dev_err(&indio_dev->dev, "Device not ready: %d\n", ret);
+	return ret;
 }
 
 static int hp206c_read_raw(struct iio_dev *indio_dev,
-- 
2.14.3

