From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 25 Jan 2018 20:12:04 +0000
Subject: [PATCH] Input: matrix-keymap: Delete an error message for a failed memory allocation in matrix_keypa
Message-Id: <78153741-c125-3aa9-59c1-807d842a98e1@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-input@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 25 Jan 2018 21:07:00 +0100

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/input/matrix-keymap.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/input/matrix-keymap.c b/drivers/input/matrix-keymap.c
index 8ccefc15c7a4..298bd56b02bd 100644
--- a/drivers/input/matrix-keymap.c
+++ b/drivers/input/matrix-keymap.c
@@ -173,11 +173,8 @@ int matrix_keypad_build_keymap(const struct matrix_keymap_data *keymap_data,
 		keymap = devm_kzalloc(input_dev->dev.parent,
 				      max_keys * sizeof(*keymap),
 				      GFP_KERNEL);
-		if (!keymap) {
-			dev_err(input_dev->dev.parent,
-				"Unable to allocate memory for keymap");
+		if (!keymap)
 			return -ENOMEM;
-		}
 	}
 
 	input_dev->keycode = keymap;
-- 
2.16.1

