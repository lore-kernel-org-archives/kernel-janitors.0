From: Colin King <colin.king@canonical.com>
Date: Mon, 02 Jul 2018 10:13:59 +0000
Subject: [PATCH] iio: dac: remove redundant pointer chip_info and spi_dev_id
Message-Id: <20180702101359.16461-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Silvan Murer <silvan.murer@gmail.com>, linux-iio@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Pointers chip_info and spi_dev_id are being assigned but are never used
hence they are redundant and can be removed.

Cleans up clang warning:
warning: variable 'chip_info' set but not used [-Wunused-but-set-variable]

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/iio/dac/ltc2632.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/iio/dac/ltc2632.c b/drivers/iio/dac/ltc2632.c
index cca278eaa138..28e9b7656b20 100644
--- a/drivers/iio/dac/ltc2632.c
+++ b/drivers/iio/dac/ltc2632.c
@@ -87,12 +87,7 @@ static int ltc2632_read_raw(struct iio_dev *indio_dev,
 			    int *val2,
 			    long m)
 {
-	struct ltc2632_chip_info *chip_info;
-
 	const struct ltc2632_state *st = iio_priv(indio_dev);
-	const struct spi_device_id *spi_dev_id = spi_get_device_id(st->spi_dev);
-
-	chip_info = (struct ltc2632_chip_info *)spi_dev_id->driver_data;
 
 	switch (m) {
 	case IIO_CHAN_INFO_SCALE:
-- 
2.17.1

