From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 09 Feb 2021 11:04:48 +0000
Subject: [PATCH] media: i2c: imx334: Fix an error message
Message-Id: <YCJsUCngklBkJMgw@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Paul J. Murphy" <paul.j.murphy@intel.com>, Martina Krasteva <martinax.krasteva@intel.com>
Cc: Daniele Alessandrelli <daniele.alessandrelli@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Jacopo Mondi <jacopo@jmondi.org>, Gjorgji Rosikopulos <gjorgjix.rosikopulos@intel.com>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

The "ret" variable is uninitialized in this error message.

Fixes: 9746b11715c3 ("media: i2c: Add imx334 camera sensor driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
When new drivers are merged into the kernel, then could we use the
driver prefix?  In other words something like this:

media: i2c/imx334: Add imx334 camera sensor driver

 drivers/media/i2c/imx334.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/imx334.c b/drivers/media/i2c/imx334.c
index 07e31bc2ef18..7fbea7caef42 100644
--- a/drivers/media/i2c/imx334.c
+++ b/drivers/media/i2c/imx334.c
@@ -790,8 +790,9 @@ static int imx334_parse_hw_config(struct imx334 *imx334)
 	imx334->reset_gpio = devm_gpiod_get_optional(imx334->dev, "reset",
 						     GPIOD_OUT_LOW);
 	if (IS_ERR(imx334->reset_gpio)) {
+		ret = PTR_ERR(imx334->reset_gpio);
 		dev_err(imx334->dev, "failed to get reset gpio %d", ret);
-		return PTR_ERR(imx334->reset_gpio);
+		return ret;
 	}
 
 	/* Get sensor input clock */
-- 
2.30.0
