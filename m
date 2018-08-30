From: Colin King <colin.king@canonical.com>
Date: Thu, 30 Aug 2018 12:39:58 +0000
Subject: [PATCH] Input: tca8418: remove redundant variable max_keys
Message-Id: <20180830123958.25368-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Damien Riegel <damien.riegel@savoirfairelinux.com>, linux-input@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Variable max_keys is being assigned but is never used hence it is
redundant and can be removed.

Cleans up clang warning:
variable 'max_keys' set but not used [-Wunused-but-set-variable]

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/input/keyboard/tca8418_keypad.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/input/keyboard/tca8418_keypad.c b/drivers/input/keyboard/tca8418_keypad.c
index 6da607d3b811..3bbd7e652533 100644
--- a/drivers/input/keyboard/tca8418_keypad.c
+++ b/drivers/input/keyboard/tca8418_keypad.c
@@ -266,7 +266,7 @@ static int tca8418_keypad_probe(struct i2c_client *client,
 	struct tca8418_keypad *keypad_data;
 	struct input_dev *input;
 	u32 rows = 0, cols = 0;
-	int error, row_shift, max_keys;
+	int error, row_shift;
 	u8 reg;
 
 	/* Check i2c driver capabilities */
@@ -291,7 +291,6 @@ static int tca8418_keypad_probe(struct i2c_client *client,
 	}
 
 	row_shift = get_count_order(cols);
-	max_keys = rows << row_shift;
 
 	/* Allocate memory for keypad_data and input device */
 	keypad_data = devm_kzalloc(dev, sizeof(*keypad_data), GFP_KERNEL);
-- 
2.17.1
