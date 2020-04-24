From: Colin King <colin.king@canonical.com>
Date: Fri, 24 Apr 2020 13:04:19 +0000
Subject: [PATCH][next] iio: adc: ad7476: remove redundant null check on an array
Message-Id: <20200424130419.22940-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dragos Bogdan <dragos.bogdan@analog.com>, Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, linux-iio@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The null check on st->chip_info->convst_channel is redundant because
convst_channel is a 2 element array of struct iio_chan_spec objects
and this can never be null. Fix this by removing the null check.

Addresses-Coverity: ("Array compared against 0")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/iio/adc/ad7476.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/adc/ad7476.c b/drivers/iio/adc/ad7476.c
index e9984a38fc4c..4e816d714ad2 100644
--- a/drivers/iio/adc/ad7476.c
+++ b/drivers/iio/adc/ad7476.c
@@ -309,7 +309,7 @@ static int ad7476_probe(struct spi_device *spi)
 	indio_dev->num_channels = 2;
 	indio_dev->info = &ad7476_info;
 
-	if (st->convst_gpio && st->chip_info->convst_channel)
+	if (st->convst_gpio)
 		indio_dev->channels = st->chip_info->convst_channel;
 	/* Setup default message */
 
-- 
2.25.1
