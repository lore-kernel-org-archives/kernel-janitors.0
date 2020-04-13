From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Mon, 13 Apr 2020 15:23:29 +0000
Subject: [PATCH] Input: tca6416-keypad - Fix a typo in MODULE_DESCRIPTION
Message-Id: <20200413152329.4435-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dmitry.torokhov@gmail.com, tglx@linutronix.de, info@metux.net, gregkh@linuxfoundation.org, gustavo@embeddedor.com
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

This should be 'tca6416', not 'tca6146'

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/input/keyboard/tca6416-keypad.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/keyboard/tca6416-keypad.c b/drivers/input/keyboard/tca6416-keypad.c
index 21758767ccf0..9b0f9665dcb0 100644
--- a/drivers/input/keyboard/tca6416-keypad.c
+++ b/drivers/input/keyboard/tca6416-keypad.c
@@ -374,5 +374,5 @@ static void __exit tca6416_keypad_exit(void)
 module_exit(tca6416_keypad_exit);
 
 MODULE_AUTHOR("Sriramakrishnan <srk@ti.com>");
-MODULE_DESCRIPTION("Keypad driver over tca6146 IO expander");
+MODULE_DESCRIPTION("Keypad driver over tca6416 IO expander");
 MODULE_LICENSE("GPL");
-- 
2.20.1
