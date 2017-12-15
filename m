From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 15 Dec 2017 17:33:49 +0000
Subject: [PATCH] pwm-puv3: Delete an error message for a failed memory allocation in pwm_probe()
Message-Id: <93e81e95-01e0-1493-5b4a-92f36f998dac@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-pwm@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 15 Dec 2017 18:29:49 +0100

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/pwm/pwm-puv3.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/pwm/pwm-puv3.c b/drivers/pwm/pwm-puv3.c
index ed6007b27585..754fd9a98f6b 100644
--- a/drivers/pwm/pwm-puv3.c
+++ b/drivers/pwm/pwm-puv3.c
@@ -107,10 +107,8 @@ static int pwm_probe(struct platform_device *pdev)
 	int ret;
 
 	puv3 = devm_kzalloc(&pdev->dev, sizeof(*puv3), GFP_KERNEL);
-	if (puv3 = NULL) {
-		dev_err(&pdev->dev, "failed to allocate memory\n");
+	if (!puv3)
 		return -ENOMEM;
-	}
 
 	puv3->clk = devm_clk_get(&pdev->dev, "OST_CLK");
 	if (IS_ERR(puv3->clk))
-- 
2.15.1

