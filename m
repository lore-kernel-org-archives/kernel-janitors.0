From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 19 Apr 2018 10:08:28 +0000
Subject: [PATCH] regulator: ab8500: tidy ab8500_regulator_get_mode()
Message-Id: <20180419100828.GA10724@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Liam Girdwood <lgirdwood@gmail.com>, Lee Jones <lee.jones@linaro.org>
Cc: Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The indenting here is confusing.

Also we don't check "ret".  That isn't likely to cause a runtime issue
because if it fails here fails then we'd probably return -EINVAL at the
end anyway.  But it does introduce a static checker warning since "val"
is only inititialized on the success path.

    drivers/regulator/ab8500.c:429 ab8500_regulator_get_mode()
    error: uninitialized symbol 'val'.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/regulator/ab8500.c b/drivers/regulator/ab8500.c
index 83dba3fbfe0c..4fab417f1803 100644
--- a/drivers/regulator/ab8500.c
+++ b/drivers/regulator/ab8500.c
@@ -425,7 +425,10 @@ static unsigned int ab8500_regulator_get_mode(struct regulator_dev *rdev)
 	if (info->mode_mask) {
 		/* Dedicated register for handling mode */
 		ret = abx500_get_register_interruptible(info->dev,
-		info->mode_bank, info->mode_reg, &val);
+							info->mode_bank,
+							info->mode_reg, &val);
+		if (ret)
+			return ret;
 		val = val & info->mode_mask;
 
 		val_normal = info->mode_val_normal;
