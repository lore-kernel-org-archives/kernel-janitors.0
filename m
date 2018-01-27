From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 27 Jan 2018 13:23:49 +0000
Subject: [PATCH] Input: imx_keypad: Delete an error message for a failed memory allocation in imx_keypad_prob
Message-Id: <41ac3033-4588-20de-c5e6-c4fd463e6c3a@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-input@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Kees Cook <keescook@chromium.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 27 Jan 2018 14:14:04 +0100

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/input/keyboard/imx_keypad.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/input/keyboard/imx_keypad.c b/drivers/input/keyboard/imx_keypad.c
index 25d61d8d4fc4..859f9c9f3aae 100644
--- a/drivers/input/keyboard/imx_keypad.c
+++ b/drivers/input/keyboard/imx_keypad.c
@@ -447,10 +447,8 @@ static int imx_keypad_probe(struct platform_device *pdev)
 	}
 
 	keypad = devm_kzalloc(&pdev->dev, sizeof(*keypad), GFP_KERNEL);
-	if (!keypad) {
-		dev_err(&pdev->dev, "not enough memory for driver data\n");
+	if (!keypad)
 		return -ENOMEM;
-	}
 
 	keypad->input_dev = input_dev;
 	keypad->irq = irq;
-- 
2.16.1

