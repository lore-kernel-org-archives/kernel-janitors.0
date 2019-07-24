From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Wed, 24 Jul 2019 21:38:28 +0000
Subject: [PATCH] backlight: lms283gf05: Fix a typo in the description passed to 'devm_gpio_request_one()'
Message-Id: <20190724213828.16916-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: lee.jones@linaro.org, daniel.thompson@linaro.org, jingoohan1@gmail.com, b.zolnierkie@samsung.com
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

The description passed to 'devm_gpio_request_one()' should be related to
LMS283GF05, not LMS285GF05.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/video/backlight/lms283gf05.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/backlight/lms283gf05.c b/drivers/video/backlight/lms283gf05.c
index 4237aaa7f269..4b62ed7e58c0 100644
--- a/drivers/video/backlight/lms283gf05.c
+++ b/drivers/video/backlight/lms283gf05.c
@@ -161,7 +161,7 @@ static int lms283gf05_probe(struct spi_device *spi)
 		ret = devm_gpio_request_one(&spi->dev, pdata->reset_gpio,
 				GPIOF_DIR_OUT | (!pdata->reset_inverted ?
 				GPIOF_INIT_HIGH : GPIOF_INIT_LOW),
-				"LMS285GF05 RESET");
+				"LMS283GF05 RESET");
 		if (ret)
 			return ret;
 	}
-- 
2.20.1
