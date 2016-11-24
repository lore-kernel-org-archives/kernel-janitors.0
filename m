From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 24 Nov 2016 13:38:07 +0000
Subject: [patch] iio: tsl2583: make array large enough
Message-Id: <20161124133807.GA32255@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20161118140326.GA20458@basecamp.onstation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jonathan Cameron <jic23@kernel.org>
Cc: Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Brian Masney <masneyb@onstation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Eva Rachel Retuya <eraretuya@gmail.com>, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

This array is supposed to have 10 elements.  Smatch complains that with
the current code we can have n = max_ints and read beyond the end of
the array.

Fixes: ac4f6eee8fe8 ("staging: iio: TAOS tsl258x: Device driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/iio/light/tsl2583.c b/drivers/iio/light/tsl2583.c
index 0b87f6a..a78b602 100644
--- a/drivers/iio/light/tsl2583.c
+++ b/drivers/iio/light/tsl2583.c
@@ -565,7 +565,7 @@ static ssize_t in_illuminance_lux_table_store(struct device *dev,
 	struct iio_dev *indio_dev = dev_to_iio_dev(dev);
 	struct tsl2583_chip *chip = iio_priv(indio_dev);
 	const unsigned int max_ints = TSL2583_MAX_LUX_TABLE_ENTRIES * 3;
-	int value[TSL2583_MAX_LUX_TABLE_ENTRIES * 3];
+	int value[TSL2583_MAX_LUX_TABLE_ENTRIES * 3 + 1];
 	int ret = -EINVAL;
 	unsigned int n;
 
