From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 26 Apr 2017 21:04:10 +0000
Subject: [PATCH 1/2] input: touchscreen: mxs-lradc: Checking for ERR_PTR instead of NULL in probe
Message-Id: <20170426210410.k2pe5ov2nkxtuf54@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Ksenija Stanojevic <ksenija.stanojevic@gmail.com>
Cc: Marek Vasut <marex@denx.de>, Lee Jones <lee.jones@linaro.org>, linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-iio@vger.kernel.org

devm_ioremap() returns NULL on error.  It never returns error pointers.

Fixes: d81ca730e3e4 ("input: touchscreen: mxs-lradc: Add support for touchscreen")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/input/touchscreen/mxs-lradc-ts.c b/drivers/input/touchscreen/mxs-lradc-ts.c
index 4b4aebfe3e7f..ff9cda29d9a0 100644
--- a/drivers/input/touchscreen/mxs-lradc-ts.c
+++ b/drivers/input/touchscreen/mxs-lradc-ts.c
@@ -631,8 +631,8 @@ static int mxs_lradc_ts_probe(struct platform_device *pdev)
 
 	iores = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	ts->base = devm_ioremap(dev, iores->start, resource_size(iores));
-	if (IS_ERR(ts->base))
-		return PTR_ERR(ts->base);
+	if (!ts->base)
+		return -ENOMEM;
 
 	ret = of_property_read_u32(node, "fsl,lradc-touchscreen-wires",
 				   &ts_wires);
