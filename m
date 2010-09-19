From: Vasiliy Kulikov <segooon@gmail.com>
Date: Sun, 19 Sep 2010 12:55:01 +0000
Subject: [PATCH 08/14] regulator: fix device_register() error handling
Message-Id: <1284900901-24537-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Liam Girdwood <lrg@slimlogic.co.uk>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Jani Nikula <ext-jani.1.nikula@nokia.com>, Linus Walleij <linus.walleij@stericsson.com>, Tejun Heo <tj@kernel.org>, linux-kernel@vger.kernel.org

If device_register() fails then call put_device().
See comment to device_register.

Signed-off-by: Vasiliy Kulikov <segooon@gmail.com>
---
 compile tested.

 drivers/regulator/core.c |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index 422a709..a43eedb 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -2302,8 +2302,10 @@ struct regulator_dev *regulator_register(struct regulator_desc *regulator_desc,
 	dev_set_name(&rdev->dev, "regulator.%d",
 		     atomic_inc_return(&regulator_no) - 1);
 	ret = device_register(&rdev->dev);
-	if (ret != 0)
+	if (ret != 0) {
+		put_device(&rdev->dev);
 		goto clean;
+	}
 
 	dev_set_drvdata(&rdev->dev, rdev);
 
-- 
1.7.0.4

