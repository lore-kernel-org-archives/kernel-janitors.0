From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sun, 02 Oct 2011 20:22:55 +0000
Subject: [patch] pinctrl: double free on error path in pinctrl_register()
Message-Id: <20111002202255.GA6991@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

This is duplicated in the error handling after we go to out_err.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index f9263b2..8416a59 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -559,8 +559,6 @@ struct pinctrl_dev *pinctrl_register(struct pinctrl_desc *pctldesc,
 	ret = device_register(&pctldev->dev);
 	if (ret != 0) {
 		pr_err("error in device registration\n");
-		put_device(&pctldev->dev);
-		kfree(pctldev);
 		goto out_err;
 	}
 	dev_set_drvdata(&pctldev->dev, pctldev);
