From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sun, 15 Mar 2015 10:56:04 +0000
Subject: [patch 2/2] extcon: max77843: fix an error code in max77843_init_muic_regmap()
Message-Id: <20150315105604.GE20691@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: MyungJoo Ham <myungjoo.ham@samsung.com>
Cc: Chanwoo Choi <cw00.choi@samsung.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

"max77843->i2c_muic" is NULL, not an error code.  Let's return -ENODEV
here.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/extcon/extcon-max77843.c b/drivers/extcon/extcon-max77843.c
index a3f80ca..6f0ed5a 100644
--- a/drivers/extcon/extcon-max77843.c
+++ b/drivers/extcon/extcon-max77843.c
@@ -715,7 +715,7 @@ static int max77843_init_muic_regmap(struct max77843 *max77843)
 	if (!max77843->i2c_muic) {
 		dev_err(&max77843->i2c->dev,
 				"Cannot allocate I2C device for MUIC\n");
-		return PTR_ERR(max77843->i2c_muic);
+		return -ENODEV;
 	}
 
 	i2c_set_clientdata(max77843->i2c_muic, max77843);
