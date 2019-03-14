From: Colin King <colin.king@canonical.com>
Date: Thu, 14 Mar 2019 23:22:33 +0000
Subject: [PATCH] iio: adc: fix indentation issue, remove extra tab
Message-Id: <20190314232233.25602-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stefan Popa <stefan.popa@analog.com>, Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, linux-iio@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

A return statement is indented one level too deeply; clean this
up by removing a tab.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/iio/adc/ad7124.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/adc/ad7124.c b/drivers/iio/adc/ad7124.c
index 7d5e5311d8de..659ef37d5fe8 100644
--- a/drivers/iio/adc/ad7124.c
+++ b/drivers/iio/adc/ad7124.c
@@ -411,7 +411,7 @@ static int ad7124_init_channel_vref(struct ad7124_state *st,
 			dev_err(&st->sd.spi->dev,
 				"Error, trying to use external voltage reference without a %s regulator.\n",
 				ad7124_ref_names[refsel]);
-				return PTR_ERR(st->vref[refsel]);
+			return PTR_ERR(st->vref[refsel]);
 		}
 		st->channel_config[channel_number].vref_mv  			regulator_get_voltage(st->vref[refsel]);
-- 
2.20.1
