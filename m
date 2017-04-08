From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sat, 08 Apr 2017 17:18:58 +0000
Subject: [PATCH] Input: omap-keypad - fix error handling code
Message-Id: <20170408171858.7266-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dmitry.torokhov@gmail.com, linux@roeck-us.net
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

According to the previous error handling code, it is likely that
'goto err_free_keymap' is expected here in order to avoid a memory leak
in error handling path.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/input/keyboard/omap4-keypad.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/keyboard/omap4-keypad.c b/drivers/input/keyboard/omap4-keypad.c
index ebc67ba41fe2..940d38b08e6b 100644
--- a/drivers/input/keyboard/omap4-keypad.c
+++ b/drivers/input/keyboard/omap4-keypad.c
@@ -358,7 +358,7 @@ static int omap4_keypad_probe(struct platform_device *pdev)
 				     "omap4-keypad", keypad_data);
 	if (error) {
 		dev_err(&pdev->dev, "failed to register interrupt\n");
-		goto err_free_input;
+		goto err_free_keymap;
 	}
 
 	device_init_wakeup(&pdev->dev, true);
-- 
2.11.0

