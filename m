From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 03 Nov 2017 08:33:57 +0000
Subject: [PATCH] staging: iio: ad7746: Improve unlocking of a mutex in ad7746_start_calib()
Message-Id: <57f5d20b-cc13-07b2-51cf-53704327df27@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devel@driverdev.osuosl.org, linux-iio@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Hartmut Knaack <knaack.h@gmx.de>, Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 3 Nov 2017 09:26:28 +0100

* Add a jump target so that a call of the function "mutex_unlock" is stored
  only twice in this function implementation.

* Replace two calls by goto statements.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/staging/iio/cdc/ad7746.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/iio/cdc/ad7746.c b/drivers/staging/iio/cdc/ad7746.c
index a124853a05f0..c4a864725376 100644
--- a/drivers/staging/iio/cdc/ad7746.c
+++ b/drivers/staging/iio/cdc/ad7746.c
@@ -302,23 +302,24 @@ static inline ssize_t ad7746_start_calib(struct device *dev,
 	mutex_lock(&chip->lock);
 	regval |= chip->config;
 	ret = i2c_smbus_write_byte_data(chip->client, AD7746_REG_CFG, regval);
-	if (ret < 0) {
-		mutex_unlock(&chip->lock);
-		return ret;
-	}
+	if (ret < 0)
+		goto unlock;
 
 	do {
 		msleep(20);
 		ret = i2c_smbus_read_byte_data(chip->client, AD7746_REG_CFG);
-		if (ret < 0) {
-			mutex_unlock(&chip->lock);
-			return ret;
-		}
+		if (ret < 0)
+			goto unlock;
+
 	} while ((ret = regval) && timeout--);
 
 	mutex_unlock(&chip->lock);
 
 	return len;
+
+unlock:
+	mutex_unlock(&chip->lock);
+	return ret;
 }
 
 static ssize_t ad7746_start_offset_calib(struct device *dev,
-- 
2.15.0

