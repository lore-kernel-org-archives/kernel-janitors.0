From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 27 Jan 2018 09:54:10 +0000
Subject: [PATCH 1/2] Input: nspire-keypad: Delete an error message for a failed memory allocation in nspire_k
Message-Id: <17d03396-2abe-4e09-1a86-14773b51073b@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <bb959d5e-5600-df03-303e-1f96d2890717@users.sourceforge.net>
In-Reply-To: <bb959d5e-5600-df03-303e-1f96d2890717@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-input@vger.kernel.org, Daniel Tang <dt.tangr@gmail.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 27 Jan 2018 10:33:37 +0100

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/input/keyboard/nspire-keypad.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/input/keyboard/nspire-keypad.c b/drivers/input/keyboard/nspire-keypad.c
index c7f26fa3034c..f13b50213f94 100644
--- a/drivers/input/keyboard/nspire-keypad.c
+++ b/drivers/input/keyboard/nspire-keypad.c
@@ -175,10 +175,8 @@ static int nspire_keypad_probe(struct platform_device *pdev)
 
 	keypad = devm_kzalloc(&pdev->dev, sizeof(struct nspire_keypad),
 			      GFP_KERNEL);
-	if (!keypad) {
-		dev_err(&pdev->dev, "failed to allocate keypad memory\n");
+	if (!keypad)
 		return -ENOMEM;
-	}
 
 	keypad->row_shift = get_count_order(KEYPAD_BITMASK_COLS);
 
-- 
2.16.1

