From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 22 Apr 2016 10:04:14 +0000
Subject: [patch] iio: light: apds9960: silence uninitialized variable warning
Message-Id: <20160422100414.GG11398@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jonathan Cameron <jic23@kernel.org>
Cc: Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Matt Ranostay <mranostay@gmail.com>, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

It causes a static checker warning if we use "buf" on the failure path
so move that inside the if statement.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/iio/light/apds9960.c b/drivers/iio/light/apds9960.c
index a6af56a..fbdd172 100644
--- a/drivers/iio/light/apds9960.c
+++ b/drivers/iio/light/apds9960.c
@@ -491,9 +491,10 @@ static int apds9960_read_raw(struct iio_dev *indio_dev,
 		case IIO_INTENSITY:
 			ret = regmap_bulk_read(data->regmap, chan->address,
 					       &buf, 2);
-			if (!ret)
+			if (!ret) {
 				ret = IIO_VAL_INT;
-			*val = le16_to_cpu(buf);
+				*val = le16_to_cpu(buf);
+			}
 			break;
 		default:
 			ret = -EINVAL;
