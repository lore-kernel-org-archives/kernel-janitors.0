From: Colin King <colin.king@canonical.com>
Date: Fri, 23 Aug 2019 10:18:23 +0000
Subject: [PATCH][rtc-next] rtc: fsl: fix spelling mistake: "memery" -> "memory"
Message-Id: <20190823101823.18402-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Biwen Li <biwen.li@nxp.com>, Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-rtc@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a dev_err error message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/rtc/rtc-fsl-ftm-alarm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-fsl-ftm-alarm.c b/drivers/rtc/rtc-fsl-ftm-alarm.c
index 4f7259c2d6a3..4bb98310cc3f 100644
--- a/drivers/rtc/rtc-fsl-ftm-alarm.c
+++ b/drivers/rtc/rtc-fsl-ftm-alarm.c
@@ -255,7 +255,7 @@ static int ftm_rtc_probe(struct platform_device *pdev)
 
 	rtc = devm_kzalloc(&pdev->dev, sizeof(*rtc), GFP_KERNEL);
 	if (unlikely(!rtc)) {
-		dev_err(&pdev->dev, "cannot alloc memery for rtc\n");
+		dev_err(&pdev->dev, "cannot alloc memory for rtc\n");
 		return -ENOMEM;
 	}
 
-- 
2.20.1
