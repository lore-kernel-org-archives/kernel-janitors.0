From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 18 Nov 2016 11:51:54 +0000
Subject: [patch] iio: tsl2583: off by one in in_illuminance_lux_table_store()
Message-Id: <20161118115153.GC3281@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jonathan Cameron <jic23@kernel.org>, Jon Brenner <jbrenner@taosinc.com>
Cc: Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Brian Masney <masneyb@onstation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Eva Rachel Retuya <eraretuya@gmail.com>, linux-iio@vger.kernel.org, kernel-janitors@vger.kernel.org

The value[] array has "max_ints" elements so this should be >= instead
of >.

Fixes: ac4f6eee8fe8 ("staging: iio: TAOS tsl258x: Device driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/iio/light/tsl2583.c b/drivers/iio/light/tsl2583.c
index 0b87f6a..faef6bd 100644
--- a/drivers/iio/light/tsl2583.c
+++ b/drivers/iio/light/tsl2583.c
@@ -580,7 +580,7 @@ static ssize_t in_illuminance_lux_table_store(struct device *dev,
 	 * and the last table entry is all 0.
 	 */
 	n = value[0];
-	if ((n % 3) || n < 6 || n > max_ints) {
+	if ((n % 3) || n < 6 || n >= max_ints) {
 		dev_err(dev,
 			"%s: The number of entries in the lux table must be a multiple of 3 and within the range [6, %d]\n",
 			__func__, max_ints);
