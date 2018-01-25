From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 25 Jan 2018 21:20:07 +0000
Subject: [PATCH] Input: pxa27x_keypad: Delete an error message for a failed memory allocation
Message-Id: <6162ffdd-7375-a7c7-fafd-0b167f874a0e@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-input@vger.kernel.org, Arvind Yadav <arvind.yadav.cs@gmail.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 25 Jan 2018 22:15:27 +0100

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/input/keyboard/pxa27x_keypad.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/input/keyboard/pxa27x_keypad.c b/drivers/input/keyboard/pxa27x_keypad.c
index d0bdaeadf86d..bafd075344e2 100644
--- a/drivers/input/keyboard/pxa27x_keypad.c
+++ b/drivers/input/keyboard/pxa27x_keypad.c
@@ -290,10 +290,8 @@ static int pxa27x_keypad_build_keycode_from_dt(struct pxa27x_keypad *keypad)
 	int error;
 
 	pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
-	if (!pdata) {
-		dev_err(dev, "failed to allocate memory for pdata\n");
+	if (!pdata)
 		return -ENOMEM;
-	}
 
 	error = pxa27x_keypad_matrix_key_parse_dt(keypad, pdata);
 	if (error) {
-- 
2.16.1

