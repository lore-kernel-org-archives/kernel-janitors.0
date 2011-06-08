From: Dan Carpenter <error27@gmail.com>
Date: Wed, 08 Jun 2011 06:42:21 +0000
Subject: [patch] Staging: iio: dereferencing uninitialized variable
Message-Id: <20110608064221.GD3846@shale.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

In the error handling, it dereferences "st" before it has been
initialized.  I also just tidied it up a bit to remove some extra
conditions.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/staging/iio/adc/max1363_core.c b/drivers/staging/iio/adc/max1363_core.c
index 98cebd2..72b0917 100644
--- a/drivers/staging/iio/adc/max1363_core.c
+++ b/drivers/staging/iio/adc/max1363_core.c
@@ -1255,12 +1255,15 @@ static int __devinit max1363_probe(struct i2c_client *client,
 	struct regulator *reg;
 
 	reg = regulator_get(&client->dev, "vcc");
-	if (!IS_ERR(reg)) {
-		ret = regulator_enable(reg);
-		if (ret)
-			goto error_put_reg;
+	if (IS_ERR(reg)) {
+		ret = PTR_ERR(reg);
+		goto error_out;
 	}
 
+	ret = regulator_enable(reg);
+	if (ret)
+		goto error_put_reg;
+
 	indio_dev = iio_allocate_device(sizeof(struct max1363_state));
 	if (indio_dev = NULL) {
 		ret = -ENOMEM;
@@ -1323,6 +1326,7 @@ static int __devinit max1363_probe(struct i2c_client *client,
 	}
 
 	return 0;
+
 error_uninit_ring:
 	iio_ring_buffer_unregister(indio_dev->ring);
 error_cleanup_ring:
@@ -1335,12 +1339,10 @@ error_free_device:
 	else
 		iio_device_unregister(indio_dev);
 error_disable_reg:
-	if (!IS_ERR(st->reg))
-		regulator_disable(st->reg);
+	regulator_disable(reg);
 error_put_reg:
-	if (!IS_ERR(st->reg))
-		regulator_put(st->reg);
-
+	regulator_put(reg);
+error_out:
 	return ret;
 }
 
