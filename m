From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 30 Apr 2014 21:05:29 +0000
Subject: [patch v2] [patch] staging: iio: ad799x: remove some unneeded IS_ERR() checks
Message-Id: <20140430210529.GA6008@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <53615EED.8040600@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jonathan Cameron <jic23@kernel.org>
Cc: Lars-Peter Clausen <lars@metafoo.de>, Hartmut Knaack <knaack.h@gmx.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, Aida Mynzhasova <ai.c.c0der@gmail.com>, Masanari Iida <standby24x7@gmail.com>, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

My static checker is upset that we check IS_ERR(t->reg) when we know it
is not an ERR_PTR.

Checking for IS_ERR() twice is often a sign of confusion and buggy code.
In this case, if the call to "ret = regulator_enable(st->vref);" fails,
then we call "regulator_disable(st->vref);" and that's a mistake because
"st->vref" is not enabled.

I fixed these problems and Hartmut Knaack pointed out a couple unneeded
IS_ERR() checks in ad799x_remove() so I have removed those as well.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: remove the unneeded checks in ad799x_remove() as well.  Updated the
    commit message to say that it's actually a small bug fix.

diff --git a/drivers/iio/adc/ad799x.c b/drivers/iio/adc/ad799x.c
index 16a8b14..39b4cb4 100644
--- a/drivers/iio/adc/ad799x.c
+++ b/drivers/iio/adc/ad799x.c
@@ -717,7 +717,7 @@ static int ad799x_probe(struct i2c_client *client,
 	ret = iio_triggered_buffer_setup(indio_dev, NULL,
 		&ad799x_trigger_handler, NULL);
 	if (ret)
-		goto error_disable_reg;
+		goto error_disable_vref;
 
 	if (client->irq > 0) {
 		ret = devm_request_threaded_irq(&client->dev,
@@ -739,11 +739,10 @@ static int ad799x_probe(struct i2c_client *client,
 
 error_cleanup_ring:
 	iio_triggered_buffer_cleanup(indio_dev);
+error_disable_vref:
+	regulator_disable(st->vref);
 error_disable_reg:
-	if (!IS_ERR(st->vref))
-		regulator_disable(st->vref);
-	if (!IS_ERR(st->reg))
-		regulator_disable(st->reg);
+	regulator_disable(st->reg);
 
 	return ret;
 }
@@ -756,10 +755,8 @@ static int ad799x_remove(struct i2c_client *client)
 	iio_device_unregister(indio_dev);
 
 	iio_triggered_buffer_cleanup(indio_dev);
-	if (!IS_ERR(st->vref))
-		regulator_disable(st->vref);
-	if (!IS_ERR(st->reg))
-		regulator_disable(st->reg);
+	regulator_disable(st->vref);
+	regulator_disable(st->reg);
 	kfree(st->rx_buf);
 
 	return 0;
