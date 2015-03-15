From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sun, 15 Mar 2015 10:48:19 +0000
Subject: [patch] mfd: max77843: fix an error code in max77843_chg_init()
Message-Id: <20150315104819.GB20691@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Samuel Ortiz <sameo@linux.intel.com>, Jaewon Kim <jaewon02.kim@samsung.com>
Cc: Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

"max77843->i2c_chg" is NULL, not an error pointer.  Let's return -ENODEV
instead.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/mfd/max77843.c b/drivers/mfd/max77843.c
index a354ac6..1074a0d 100644
--- a/drivers/mfd/max77843.c
+++ b/drivers/mfd/max77843.c
@@ -79,7 +79,7 @@ static int max77843_chg_init(struct max77843 *max77843)
 	if (!max77843->i2c_chg) {
 		dev_err(&max77843->i2c->dev,
 				"Cannot allocate I2C device for Charger\n");
-		return PTR_ERR(max77843->i2c_chg);
+		return -ENODEV;
 	}
 	i2c_set_clientdata(max77843->i2c_chg, max77843);
 
