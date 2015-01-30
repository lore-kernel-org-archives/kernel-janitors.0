From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 30 Jan 2015 08:30:59 +0000
Subject: [patch] iio: imu: adis16400: Fix sign extension
Message-Id: <20150130083058.GD21357@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lars-Peter Clausen <lars@metafoo.de>
Cc: Michael Hennerich <Michael.Hennerich@analog.com>, Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Peter Meerwald <pmeerw@pmeerw.net>, linux-iio@vger.kernel.org, kernel-janitors@vger.kernel.org, Rasmus Villemoes <linux@rasmusvillemoes.dk>

Because of C's type promotion rules, the code shifts in
"((val16 & 0xFFF) << 4) >> 4;" cancel each other out and they're a
no-op.

The intention here was to sign-extend then 11th bit so we can use the
sign_extend32() function.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Please review this carefully.  I'm pretty sure it's correct but this is
the first time I've ever used the sign_extend32() function.

diff --git a/drivers/iio/imu/adis16400_core.c b/drivers/iio/imu/adis16400_core.c
index b70873d..ed636c9 100644
--- a/drivers/iio/imu/adis16400_core.c
+++ b/drivers/iio/imu/adis16400_core.c
@@ -414,7 +414,7 @@ static int adis16400_read_raw(struct iio_dev *indio_dev,
 		mutex_unlock(&indio_dev->mlock);
 		if (ret)
 			return ret;
-		val16 = ((val16 & 0xFFF) << 4) >> 4;
+		val16 = sign_extend32(val16, 11);
 		*val = val16;
 		return IIO_VAL_INT;
 	case IIO_CHAN_INFO_OFFSET:
