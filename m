From: Zic Rim <zicrim@gmail.com>
Date: Sat, 24 Sep 2011 09:56:45 +0000
Subject: [patch ] remove redundant const in tc3589x.c
Message-Id: <CAMvewQJ5yLibiYi3bLXK255b28C6H2o6BMX655K8zdG6uV879w@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

SIMPLE_DEV_PM_OPS defins a const struct , no need to prefix with  const.

Signed-off-by: Navin P <zicrim@gmail.com>


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
