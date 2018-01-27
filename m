From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 27 Jan 2018 12:15:06 +0000
Subject: [PATCH 2/2] Input: max7359_keypad: Improve a size determination in max7359_probe()
Message-Id: <c75b2086-5b58-638a-781d-fe6c4545619a@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <95f7f53b-fa1e-8270-ae4c-5b3d721a4831@users.sourceforge.net>
In-Reply-To: <95f7f53b-fa1e-8270-ae4c-5b3d721a4831@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-input@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 27 Jan 2018 13:00:10 +0100

Replace the specification of a data structure by a pointer dereference
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/input/keyboard/max7359_keypad.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/input/keyboard/max7359_keypad.c b/drivers/input/keyboard/max7359_keypad.c
index ba6a670a769e..7791250b4667 100644
--- a/drivers/input/keyboard/max7359_keypad.c
+++ b/drivers/input/keyboard/max7359_keypad.c
@@ -181,9 +181,7 @@ static int max7359_probe(struct i2c_client *client,
 	}
 
 	dev_dbg(&client->dev, "keys FIFO is 0x%02x\n", ret);
-
-	keypad = devm_kzalloc(&client->dev, sizeof(struct max7359_keypad),
-			      GFP_KERNEL);
+	keypad = devm_kzalloc(&client->dev, sizeof(*keypad), GFP_KERNEL);
 	if (!keypad)
 		return -ENOMEM;
 
-- 
2.16.1

