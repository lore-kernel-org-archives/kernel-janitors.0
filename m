From: Navin P <zicrim@gmail.com>
Date: Sun, 25 Sep 2011 11:21:22 +0000
Subject: [PATCH] Remove redundant const in tc3589x.c
Message-Id: <4E7F0BE2.5070707@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, sameo@linux.intel.com, rabin.vincent@stericsson.com, hanumath.prasad@stericsson.com

 Remove the redundant const as SIMPLE_DEV_PM_OPS defines const
 struct.
 Signed-off-by: Navin P <zicrim@gmail.com>

---
 drivers/mfd/tc3589x.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mfd/tc3589x.c b/drivers/mfd/tc3589x.c
index c27e515..e87020f 100644
--- a/drivers/mfd/tc3589x.c
+++ b/drivers/mfd/tc3589x.c
@@ -385,7 +385,7 @@ static int tc3589x_resume(struct device *dev)
 	return ret;
 }
 
-static const SIMPLE_DEV_PM_OPS(tc3589x_dev_pm_ops, tc3589x_suspend,
+static SIMPLE_DEV_PM_OPS(tc3589x_dev_pm_ops, tc3589x_suspend,
 						tc3589x_resume);
 
 static const struct i2c_device_id tc3589x_id[] = {
-- 
1.7.0.4


