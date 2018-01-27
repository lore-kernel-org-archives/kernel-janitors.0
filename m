From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 27 Jan 2018 09:55:28 +0000
Subject: [PATCH 2/2] Input: nspire-keypad: Improve a size determination in nspire_keypad_probe()
Message-Id: <ec6d39ee-d1ce-f632-f80f-21de1ed402ee@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <bb959d5e-5600-df03-303e-1f96d2890717@users.sourceforge.net>
In-Reply-To: <bb959d5e-5600-df03-303e-1f96d2890717@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-input@vger.kernel.org, Daniel Tang <dt.tangr@gmail.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 27 Jan 2018 10:36:20 +0100

Replace the specification of a data structure by a pointer dereference
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/input/keyboard/nspire-keypad.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/input/keyboard/nspire-keypad.c b/drivers/input/keyboard/nspire-keypad.c
index f13b50213f94..caadc99741c0 100644
--- a/drivers/input/keyboard/nspire-keypad.c
+++ b/drivers/input/keyboard/nspire-keypad.c
@@ -173,8 +173,7 @@ static int nspire_keypad_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	keypad = devm_kzalloc(&pdev->dev, sizeof(struct nspire_keypad),
-			      GFP_KERNEL);
+	keypad = devm_kzalloc(&pdev->dev, sizeof(*keypad), GFP_KERNEL);
 	if (!keypad)
 		return -ENOMEM;
 
-- 
2.16.1

