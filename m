From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 14 Mar 2017 07:56:32 +0000
Subject: [PATCH] mux: checking for IS_ERR() instead of NULL or vice versa
Message-Id: <20170314075243.GA6169@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Rosin <peda@axentia.se>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

This error handling is mixed up.  mux_chip_alloc() doesn't return error
pointers but devm_mux_chip_alloc() does.

Fixes: 4f5078327db1 ("mux: minimal mux subsystem and gpio-based mux controller")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/mux/mux-core.c b/drivers/mux/mux-core.c
index 46088a0f9677..de678520a329 100644
--- a/drivers/mux/mux-core.c
+++ b/drivers/mux/mux-core.c
@@ -167,9 +167,9 @@ struct mux_chip *devm_mux_chip_alloc(struct device *dev,
 		return ERR_PTR(-ENOMEM);
 
 	mux_chip = mux_chip_alloc(dev, controllers, sizeof_priv);
-	if (IS_ERR(mux_chip)) {
+	if (!mux_chip) {
 		devres_free(ptr);
-		return mux_chip;
+		return ERR_PTR(-ENOMEM);
 	}
 
 	*ptr = mux_chip;
diff --git a/drivers/mux/mux-gpio.c b/drivers/mux/mux-gpio.c
index 04c6e548ecdc..d0596a3c2f79 100644
--- a/drivers/mux/mux-gpio.c
+++ b/drivers/mux/mux-gpio.c
@@ -63,8 +63,8 @@ static int mux_gpio_probe(struct platform_device *pdev)
 
 	mux_chip = devm_mux_chip_alloc(dev, 1, sizeof(*mux_gpio) +
 				       pins * sizeof(*mux_gpio->val));
-	if (!mux_chip)
-		return -ENOMEM;
+	if (IS_ERR(mux_chip))
+		return PTR_ERR(mux_chip);
 
 	mux_gpio = mux_chip_priv(mux_chip);
 	mux_gpio->val = (int *)(mux_gpio + 1);
diff --git a/drivers/mux/mux-adg792a.c b/drivers/mux/mux-adg792a.c
index d58971641fdc..8972f4f6c655 100644
--- a/drivers/mux/mux-adg792a.c
+++ b/drivers/mux/mux-adg792a.c
@@ -65,8 +65,8 @@ static int adg792a_probe(struct i2c_client *i2c,
 		return -EINVAL;
 
 	mux_chip = devm_mux_chip_alloc(dev, cells ? 3 : 1, 0);
-	if (!mux_chip)
-		return -ENOMEM;
+	if (IS_ERR(mux_chip))
+		return PTR_ERR(mux_chip);
 
 	mux_chip->ops = &adg792a_ops;
 
