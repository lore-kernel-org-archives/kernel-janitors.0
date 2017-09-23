From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sat, 23 Sep 2017 06:06:18 +0000
Subject: [PATCH 1/3] iio: adc: twl4030: Fix an error handling path in 'twl4030_madc_probe()'
Message-Id: <4bcd315895de7135369e6e0d2402fc2794f2ee99.1506146101.git.christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cover.1506146101.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <cover.1506146101.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jic23@kernel.org, knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net, sre@kernel.org, wsa@the-dreams.de, kishon@ti.com
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

If 'devm_regulator_get()' fails, we should go through the existing error
handling path instead of returning directly, as done is all the other
error handling paths in this function.

Fixes: 7cc97d77ee8a ("iio: adc: twl4030: Fix ADC[3:6] readings")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/iio/adc/twl4030-madc.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/adc/twl4030-madc.c b/drivers/iio/adc/twl4030-madc.c
index 1edd99f0c5e5..80ab2ed70b85 100644
--- a/drivers/iio/adc/twl4030-madc.c
+++ b/drivers/iio/adc/twl4030-madc.c
@@ -887,8 +887,10 @@ static int twl4030_madc_probe(struct platform_device *pdev)
 
 	/* Enable 3v1 bias regulator for MADC[3:6] */
 	madc->usb3v1 = devm_regulator_get(madc->dev, "vusb3v1");
-	if (IS_ERR(madc->usb3v1))
-		return -ENODEV;
+	if (IS_ERR(madc->usb3v1)) {
+		ret = -ENODEV;
+		goto err_i2c;
+	}
 
 	ret = regulator_enable(madc->usb3v1);
 	if (ret)
-- 
2.11.0

