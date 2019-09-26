From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 26 Sep 2019 08:10:18 +0000
Subject: [PATCH] iio: imu: adis16480: clean up a condition
Message-Id: <20190926081016.GA2332@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lars-Peter Clausen <lars@metafoo.de>
Cc: Michael Hennerich <Michael.Hennerich@analog.com>, Stefan Popa <stefan.popa@analog.com>, Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The "t" variable is unsigned so it can't be less than zero.  We really
are just trying to prevent divide by zero bugs so just checking against
zero is sufficient.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/iio/imu/adis16480.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/imu/adis16480.c b/drivers/iio/imu/adis16480.c
index b99d73887c9f..e144e567675d 100644
--- a/drivers/iio/imu/adis16480.c
+++ b/drivers/iio/imu/adis16480.c
@@ -318,7 +318,7 @@ static int adis16480_set_freq(struct iio_dev *indio_dev, int val, int val2)
 	unsigned int t, reg;
 
 	t =  val * 1000 + val2 / 1000;
-	if (t <= 0)
+	if (t = 0)
 		return -EINVAL;
 
 	/*
-- 
2.20.1
