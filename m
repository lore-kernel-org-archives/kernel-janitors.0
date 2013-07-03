From: Ferruh Yigit <fery@cypress.com>
Date: Wed, 03 Jul 2013 17:14:52 +0000
Subject: [PATCH] Input: cyttsp4 - kfree xfer_buf on error path in probe()
Message-Id: <1372871693-9871-1-git-send-email-fery@cypress.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <51D42CD3.2000705@cypress.com>
In-Reply-To: <51D42CD3.2000705@cypress.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, ttdrivers@cypress.com, Javier Martinez Canillas <javier@dowhile0.org>, linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org, Ferruh Yigit <fery@cypress.com>

If probe() fails after cd->xfer_buf allocated, it will not freed.
Added kfree(cd->xfer_buf) with and error label.

Signed-off-by: Ferruh Yigit <fery@cypress.com>
---
 drivers/input/touchscreen/cyttsp4_core.c |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/cyttsp4_core.c b/drivers/input/touchscreen/cyttsp4_core.c
index a7987e1..edcf799 100644
--- a/drivers/input/touchscreen/cyttsp4_core.c
+++ b/drivers/input/touchscreen/cyttsp4_core.c
@@ -2049,7 +2049,7 @@ struct cyttsp4 *cyttsp4_probe(const struct cyttsp4_bus_ops *ops,
 	cd->irq = gpio_to_irq(cd->cpdata->irq_gpio);
 	if (cd->irq < 0) {
 		rc = -EINVAL;
-		goto error_free_cd;
+		goto error_free_xfer;
 	}
 
 	dev_set_drvdata(dev, cd);
@@ -2117,6 +2117,8 @@ error_request_irq:
 	if (cd->cpdata->init)
 		cd->cpdata->init(cd->cpdata, 0, dev);
 	dev_set_drvdata(dev, NULL);
+error_free_xfer:
+	kfree(cd->xfer_buf);
 error_free_cd:
 	kfree(cd);
 error_alloc_data:
-- 
1.7.9.5

