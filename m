From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 16 May 2017 13:01:40 +0000
Subject: [PATCH] rtc-88pm80x: Delete an error message for a failed memory allocation in pm80x_rtc_probe()
Message-Id: <79e5d766-2e58-4cea-7812-ea45995873ac@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: rtc-linux@googlegroups.com, Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Chao Xie <chao.xie@marvell.com>, Vaibhav Hiremath <vaibhav.hiremath@linaro.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 16 May 2017 14:54:13 +0200

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Link: http://events.linuxfoundation.org/sites/events/files/slides/LCJ16-Refactor_Strings-WSang_0.pdf
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/rtc/rtc-88pm80x.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-88pm80x.c b/drivers/rtc/rtc-88pm80x.c
index 466bf7f9a285..ae0e2561ecfa 100644
--- a/drivers/rtc/rtc-88pm80x.c
+++ b/drivers/rtc/rtc-88pm80x.c
@@ -266,10 +266,8 @@ static int pm80x_rtc_probe(struct platform_device *pdev)
 
 	if (!pdata) {
 		pdata = devm_kzalloc(&pdev->dev, sizeof(*pdata), GFP_KERNEL);
-		if (!pdata) {
-			dev_err(&pdev->dev, "failed to allocate memory\n");
+		if (!pdata)
 			return -ENOMEM;
-		}
 	}
 
 	info -- 
2.13.0

