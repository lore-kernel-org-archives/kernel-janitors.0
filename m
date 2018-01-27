From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 27 Jan 2018 12:53:20 +0000
Subject: [PATCH 1/2] Input: matrix_keypad: Delete two error messages for a failed memory allocation in matrix
Message-Id: <de16c2fb-8daf-bc81-8af7-ebf23db52d4e@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <106bffd0-28ed-7c33-1f32-ae84b40f52c7@users.sourceforge.net>
In-Reply-To: <106bffd0-28ed-7c33-1f32-ae84b40f52c7@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-input@vger.kernel.org, David Rivshin <DRivshin@allworx.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 27 Jan 2018 13:35:02 +0100

Omit extra messages for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/input/keyboard/matrix_keypad.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/input/keyboard/matrix_keypad.c b/drivers/input/keyboard/matrix_keypad.c
index 1f316d66e6f7..90238201a9cc 100644
--- a/drivers/input/keyboard/matrix_keypad.c
+++ b/drivers/input/keyboard/matrix_keypad.c
@@ -413,10 +413,8 @@ matrix_keypad_parse_dt(struct device *dev)
 	}
 
 	pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
-	if (!pdata) {
-		dev_err(dev, "could not allocate memory for platform data\n");
+	if (!pdata)
 		return ERR_PTR(-ENOMEM);
-	}
 
 	pdata->num_row_gpios = nrow = of_gpio_named_count(np, "row-gpios");
 	pdata->num_col_gpios = ncol = of_gpio_named_count(np, "col-gpios");
@@ -445,10 +443,8 @@ matrix_keypad_parse_dt(struct device *dev)
 			     sizeof(unsigned int) *
 				(pdata->num_row_gpios + pdata->num_col_gpios),
 			     GFP_KERNEL);
-	if (!gpios) {
-		dev_err(dev, "could not allocate memory for gpios\n");
+	if (!gpios)
 		return ERR_PTR(-ENOMEM);
-	}
 
 	for (i = 0; i < pdata->num_row_gpios; i++)
 		gpios[i] = of_get_named_gpio(np, "row-gpios", i);
-- 
2.16.1

