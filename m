From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 09 Nov 2017 09:05:49 +0000
Subject: [PATCH] extcon: max8997: Delete an unnecessary variable initialisation in max8997_muic_set_path()
Message-Id: <e24dddc4-6be6-0ffd-ca58-979fa91b77c6@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, MyungJoo Ham <myungjoo.ham@samsung.com>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 9 Nov 2017 10:00:08 +0100

The variable "ret" will be set to an appropriate value a bit later.
Thus omit the explicit initialisation at the beginning.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/extcon/extcon-max8997.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/extcon/extcon-max8997.c b/drivers/extcon/extcon-max8997.c
index 8152790d72e1..9f30f4929b72 100644
--- a/drivers/extcon/extcon-max8997.c
+++ b/drivers/extcon/extcon-max8997.c
@@ -204,7 +204,7 @@ static int max8997_muic_set_debounce_time(struct max8997_muic_info *info,
 static int max8997_muic_set_path(struct max8997_muic_info *info,
 		u8 val, bool attached)
 {
-	int ret = 0;
+	int ret;
 	u8 ctrl1, ctrl2 = 0;
 
 	if (attached)
-- 
2.15.0

