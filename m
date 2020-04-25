From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sat, 25 Apr 2020 07:00:56 +0000
Subject: [PATCH] iio: dac: ad5592r: Fix a typo in the name of a function
Message-Id: <20200425070056.31664-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: lars@metafoo.de, Michael.Hennerich@analog.com, stefan.popa@analog.com, jic23@kernel.org, knaack.h@gmx.de, pmeerw@pmeerw.net
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

This module is related to AD5592R, not AD5593R, so be consistent in naming.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/iio/dac/ad5592r.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/dac/ad5592r.c b/drivers/iio/dac/ad5592r.c
index 34ba059a77da..49308ad13c4b 100644
--- a/drivers/iio/dac/ad5592r.c
+++ b/drivers/iio/dac/ad5592r.c
@@ -98,7 +98,7 @@ static int ad5592r_reg_read(struct ad5592r_state *st, u8 reg, u16 *value)
 	return 0;
 }
 
-static int ad5593r_gpio_read(struct ad5592r_state *st, u8 *value)
+static int ad5592r_gpio_read(struct ad5592r_state *st, u8 *value)
 {
 	int ret;
 
@@ -121,7 +121,7 @@ static const struct ad5592r_rw_ops ad5592r_rw_ops = {
 	.read_adc = ad5592r_read_adc,
 	.reg_write = ad5592r_reg_write,
 	.reg_read = ad5592r_reg_read,
-	.gpio_read = ad5593r_gpio_read,
+	.gpio_read = ad5592r_gpio_read,
 };
 
 static int ad5592r_spi_probe(struct spi_device *spi)
-- 
2.20.1
