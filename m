From: Dan Carpenter <error27@gmail.com>
Date: Sun, 07 Mar 2010 12:36:45 +0000
Subject: [patch] regulator: handle kcalloc() failure
Message-Id: <20100307123645.GB6469@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Liam Girdwood <lrg@slimlogic.co.uk>
Cc: Mark Brown <broonie@opensource.wolfsonmicro.com>, Julia Lawall <julia@diku.dk>, Dmitry Torokhov <dtor@mail.ru>, Wolfram Sang <w.sang@pengutronix.de>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Return -ENOMEM if kcalloc() fails

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/regulator/lp3971.c b/drivers/regulator/lp3971.c
index f5532ed..55fab4a 100644
--- a/drivers/regulator/lp3971.c
+++ b/drivers/regulator/lp3971.c
@@ -439,6 +439,10 @@ static int __devinit setup_regulators(struct lp3971 *lp3971,
 	lp3971->num_regulators = pdata->num_regulators;
 	lp3971->rdev = kcalloc(pdata->num_regulators,
 				sizeof(struct regulator_dev *), GFP_KERNEL);
+	if (!lp3971->rdev) {
+		err = -ENOMEM;
+		goto err_nomem;
+	}
 
 	/* Instantiate the regulators */
 	for (i = 0; i < pdata->num_regulators; i++) {
@@ -461,6 +465,7 @@ error:
 		regulator_unregister(lp3971->rdev[i]);
 	kfree(lp3971->rdev);
 	lp3971->rdev = NULL;
+err_nomem:
 	return err;
 }
 
