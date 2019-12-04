From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Wed, 04 Dec 2019 06:45:35 +0000
Subject: [PATCH] iio: adc: ti-ads7950: Fix a typo in an error message
Message-Id: <20191204064535.13025-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jic23@kernel.org, knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net, justinpopo6@gmail.com, linus.walleij@linaro.org
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Fix a typo:
   s/get get/to get/

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/iio/adc/ti-ads7950.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/adc/ti-ads7950.c b/drivers/iio/adc/ti-ads7950.c
index 2e66e4d586ff..f9edc1207f75 100644
--- a/drivers/iio/adc/ti-ads7950.c
+++ b/drivers/iio/adc/ti-ads7950.c
@@ -602,7 +602,7 @@ static int ti_ads7950_probe(struct spi_device *spi)
 
 	st->reg = devm_regulator_get(&spi->dev, "vref");
 	if (IS_ERR(st->reg)) {
-		dev_err(&spi->dev, "Failed get get regulator \"vref\"\n");
+		dev_err(&spi->dev, "Failed to get regulator \"vref\"\n");
 		ret = PTR_ERR(st->reg);
 		goto error_destroy_mutex;
 	}
-- 
2.20.1
