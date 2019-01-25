From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Fri, 25 Jan 2019 01:45:54 +0000
Subject: [PATCH -next] extcon: ptn5150: Fix return value check in ptn5150_i2c_probe()
Message-Id: <1548380754-67031-1-git-send-email-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

In case of error, the function devm_gpiod_get() returns ERR_PTR() and
never returns NULL. The NULL test in the return value check should be
replaced with IS_ERR().

Fixes: 58963276749e ("extcon: Add support for ptn5150 extcon driver")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/extcon/extcon-ptn5150.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/extcon/extcon-ptn5150.c b/drivers/extcon/extcon-ptn5150.c
index 155620b..8217fdc 100644
--- a/drivers/extcon/extcon-ptn5150.c
+++ b/drivers/extcon/extcon-ptn5150.c
@@ -240,14 +240,14 @@ static int ptn5150_i2c_probe(struct i2c_client *i2c,
 	info->dev = &i2c->dev;
 	info->i2c = i2c;
 	info->int_gpiod = devm_gpiod_get(&i2c->dev, "int", GPIOD_IN);
-	if (!info->int_gpiod) {
+	if (IS_ERR(info->int_gpiod)) {
 		dev_err(dev, "failed to get INT GPIO\n");
-		return -EINVAL;
+		return PTR_ERR(info->int_gpiod);
 	}
 	info->vbus_gpiod = devm_gpiod_get(&i2c->dev, "vbus", GPIOD_IN);
-	if (!info->vbus_gpiod) {
+	if (IS_ERR(info->vbus_gpiod)) {
 		dev_err(dev, "failed to get VBUS GPIO\n");
-		return -EINVAL;
+		return PTR_ERR(info->vbus_gpiod);
 	}
 	ret = gpiod_direction_output(info->vbus_gpiod, 0);
 	if (ret) {
