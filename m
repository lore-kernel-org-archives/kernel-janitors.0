From: Colin King <colin.king@canonical.com>
Date: Tue, 07 May 2019 08:21:35 +0000
Subject: [PATCH][next] Input: qt1050: fix less than zero comparison on an unsigned int
Message-Id: <20190507082135.21538-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, Marco Felsch <m.felsch@pengutronix.de>, linux-input@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently the less than zero comparison of val is always false because
val is an unsigned int. Fix this by making val a signed int.

Addresses-Coverity: ("Unsigned compared against zero")
Fixes: a33ff45923c8 ("Input: qt1050 - add Microchip AT42QT1050 support")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/input/keyboard/qt1050.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/keyboard/qt1050.c b/drivers/input/keyboard/qt1050.c
index 6b1603cb7515..4debddb13972 100644
--- a/drivers/input/keyboard/qt1050.c
+++ b/drivers/input/keyboard/qt1050.c
@@ -222,7 +222,7 @@ static struct regmap_config qt1050_regmap_config = {
 
 static bool qt1050_identify(struct qt1050_priv *ts)
 {
-	unsigned int val;
+	int val;
 
 	/* Read Chip ID */
 	regmap_read(ts->regmap, QT1050_CHIP_ID, &val);
-- 
2.20.1
