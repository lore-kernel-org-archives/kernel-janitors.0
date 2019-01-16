From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Wed, 16 Jan 2019 02:55:54 +0000
Subject: [PATCH -next] rtc: sd3078: make symbol 'sd3078_driver' static
Message-Id: <1547607681-5873-1-git-send-email-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dianlong Li <long17.cool@163.com>, Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, linux-rtc@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes the following sparse warning:

drivers/rtc/rtc-sd3078.c:218:19: warning:
 symbol 'sd3078_driver' was not declared. Should it be static?

Fixes: 1d67a232105b ("rtc: sd3078: new driver.")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/rtc/rtc-sd3078.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-sd3078.c b/drivers/rtc/rtc-sd3078.c
index a70d7311..704844f 100644
--- a/drivers/rtc/rtc-sd3078.c
+++ b/drivers/rtc/rtc-sd3078.c
@@ -215,7 +215,7 @@ static int sd3078_probe(struct i2c_client *client,
 };
 MODULE_DEVICE_TABLE(of, rtc_dt_match);
 
-struct i2c_driver sd3078_driver = {
+static struct i2c_driver sd3078_driver = {
 	.driver     = {
 		.name   = "sd3078",
 		.owner  = THIS_MODULE,
