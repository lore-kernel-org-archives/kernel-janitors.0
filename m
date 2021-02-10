From: Colin King <colin.king@canonical.com>
Date: Wed, 10 Feb 2021 19:07:52 +0000
Subject: [PATCH][next] media: i2c: imx334: Fix a read of the uninitialized variable ret
Message-Id: <20210210190752.146631-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Paul J . Murphy" <paul.j.murphy@intel.com>, Daniele Alessandrelli <daniele.alessandrelli@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Martina Krasteva <martinax.krasteva@intel.com>, Gjorgji Rosikopulos <gjorgjix.rosikopulos@intel.com>, linux-media@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently there is a dev_err error message that is printing the
error status in variable ret (that has not been set) instead of
the correct error status from imx334->reset_gpio.  Fix this.

Addresses-Coverity: ("Uninitialized scalar variable")
Fixes: 9746b11715c3 ("media: i2c: Add imx334 camera sensor driver")

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/i2c/imx334.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/imx334.c b/drivers/media/i2c/imx334.c
index 07e31bc2ef18..f8b1caf26c9b 100644
--- a/drivers/media/i2c/imx334.c
+++ b/drivers/media/i2c/imx334.c
@@ -790,7 +790,8 @@ static int imx334_parse_hw_config(struct imx334 *imx334)
 	imx334->reset_gpio = devm_gpiod_get_optional(imx334->dev, "reset",
 						     GPIOD_OUT_LOW);
 	if (IS_ERR(imx334->reset_gpio)) {
-		dev_err(imx334->dev, "failed to get reset gpio %d", ret);
+		dev_err(imx334->dev, "failed to get reset gpio %ld",
+			IS_ERR_VALUE(imx334->reset_gpio));
 		return PTR_ERR(imx334->reset_gpio);
 	}
 
-- 
2.30.0
