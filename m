From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 07 Apr 2020 09:28:52 +0000
Subject: [PATCH] rtc: rc5t619: Fix an ERR_PTR vs NULL check
Message-Id: <20200407092852.GI68494@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alessandro Zummo <a.zummo@towertech.it>, Andreas Kemnade <andreas@kemnade.info>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Lee Jones <lee.jones@linaro.org>, linux-rtc@vger.kernel.org, kernel-janitors@vger.kernel.org

The devm_kzalloc() function returns NULL on error, it doesn't return
error pointers so this check doesn't work.

Fixes: 540d1e15393d ("rtc: rc5t619: Add Ricoh RC5T619 RTC driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/rtc/rtc-rc5t619.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-rc5t619.c b/drivers/rtc/rtc-rc5t619.c
index 24e386ecbc7e..dd1a20977478 100644
--- a/drivers/rtc/rtc-rc5t619.c
+++ b/drivers/rtc/rtc-rc5t619.c
@@ -356,10 +356,8 @@ static int rc5t619_rtc_probe(struct platform_device *pdev)
 	int err;
 
 	rtc = devm_kzalloc(dev, sizeof(*rtc), GFP_KERNEL);
-	if (IS_ERR(rtc)) {
-		err = PTR_ERR(rtc);
+	if (!rtc)
 		return -ENOMEM;
-	}
 
 	rtc->rn5t618 = rn5t618;
 
-- 
2.25.1
