From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 27 Jan 2018 12:54:23 +0000
Subject: [PATCH 2/2] Input: matrix_keypad: Improve a size determination in matrix_keypad_probe()
Message-Id: <8098317f-46bb-fefb-936c-eb82605c565c@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <106bffd0-28ed-7c33-1f32-ae84b40f52c7@users.sourceforge.net>
In-Reply-To: <106bffd0-28ed-7c33-1f32-ae84b40f52c7@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-input@vger.kernel.org, David Rivshin <DRivshin@allworx.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 27 Jan 2018 13:43:16 +0100

Replace the specification of a data structure by a pointer dereference
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/input/keyboard/matrix_keypad.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/keyboard/matrix_keypad.c b/drivers/input/keyboard/matrix_keypad.c
index 90238201a9cc..16206a8a5f07 100644
--- a/drivers/input/keyboard/matrix_keypad.c
+++ b/drivers/input/keyboard/matrix_keypad.c
@@ -487,7 +487,7 @@ static int matrix_keypad_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	keypad = kzalloc(sizeof(struct matrix_keypad), GFP_KERNEL);
+	keypad = kzalloc(sizeof(*keypad), GFP_KERNEL);
 	input_dev = input_allocate_device();
 	if (!keypad || !input_dev) {
 		err = -ENOMEM;
-- 
2.16.1

