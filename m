From: Colin King <colin.king@canonical.com>
Date: Mon, 08 Oct 2018 21:09:04 +0000
Subject: [PATCH] iio: adc: ina2xx: fix missing break statement
Message-Id: <20181008210904.9362-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, =?UTF-8?q?Stefan=20Br=C3=BCns?= <stefan.bruens@rwth-aachen.de>, linux-iio@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The IIO_CHAN_INFO_SCALE case is missing a break statement and in
the unlikely event that chan->address is not matched in the nested
switch statement then the code falls through to the following
IIO_CHAN_INFO_HARDWAREGAIN case.  Fix this by adding the missing
break.   While we are fixing this, it's probably a good idea to
add in a break statement to the IIO_CHAN_INFO_HARDWAREGAIN case
too (this is a moot point).

Detected by CoverityScan, CID#1462408 ("Missing break in switch")

Fixes: ca6a2d86acae ("iio: adc: ina2xx: Allow setting Shunt Voltage PGA gain and Bus Voltage range")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/iio/adc/ina2xx-adc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/iio/adc/ina2xx-adc.c b/drivers/iio/adc/ina2xx-adc.c
index d1239624187d..9bc5986780b9 100644
--- a/drivers/iio/adc/ina2xx-adc.c
+++ b/drivers/iio/adc/ina2xx-adc.c
@@ -250,6 +250,7 @@ static int ina2xx_read_raw(struct iio_dev *indio_dev,
 			*val2 = chip->shunt_resistor_uohm;
 			return IIO_VAL_FRACTIONAL;
 		}
+		break;
 
 	case IIO_CHAN_INFO_HARDWAREGAIN:
 		switch (chan->address) {
@@ -262,6 +263,7 @@ static int ina2xx_read_raw(struct iio_dev *indio_dev,
 			*val = chip->range_vbus = 32 ? 1 : 2;
 			return IIO_VAL_INT;
 		}
+		break;
 	}
 
 	return -EINVAL;
-- 
2.17.1
