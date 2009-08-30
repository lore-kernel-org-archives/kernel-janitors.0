From: Julia Lawall <julia@diku.dk>
Date: Sun, 30 Aug 2009 09:18:13 +0000
Subject: [PATCH] drivers/input/keyboard: Move a dereference below a NULL test
Message-Id: <Pine.LNX.4.64.0908301117010.17060@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dmitry Torokhov <dtor@mail.ru>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

If the NULL test is necessary, then the dereference should be moved below
the NULL test.

The semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/).

// <smpl>
@@
type T;
expression E;
identifier i,fld;
statement S;
@@

- T i = E->fld;
+ T i;
  ... when != E
      when != i
  if (E = NULL) S
+ i = E->fld;
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/input/keyboard/w90p910_keypad.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff -u -p a/drivers/input/keyboard/w90p910_keypad.c b/drivers/input/keyboard/w90p910_keypad.c
--- a/drivers/input/keyboard/w90p910_keypad.c
+++ b/drivers/input/keyboard/w90p910_keypad.c
@@ -120,7 +120,7 @@ static int __devinit w90p910_keypad_prob
 {
 	const struct w90p910_keypad_platform_data *pdata  						pdev->dev.platform_data;
-	const struct matrix_keymap_data *keymap_data = pdata->keymap_data;
+	const struct matrix_keymap_data *keymap_data;
 	struct w90p910_keypad *keypad;
 	struct input_dev *input_dev;
 	struct resource *res;
@@ -132,6 +132,7 @@ static int __devinit w90p910_keypad_prob
 		dev_err(&pdev->dev, "no platform data defined\n");
 		return -EINVAL;
 	}
+	keymap_data = pdata->keymap_data;
 
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0) {
