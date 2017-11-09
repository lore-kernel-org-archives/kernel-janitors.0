From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 09 Nov 2017 08:49:07 +0000
Subject: [PATCH] extcon: max77693: Delete an unnecessary variable initialisation in max77693_muic_set_path()
Message-Id: <4fbe6f7c-3ff4-6dbd-2980-8010dcc9548e@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, MyungJoo Ham <myungjoo.ham@samsung.com>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 9 Nov 2017 09:40:59 +0100

The variable "ret" will be set to an appropriate value a bit later.
Thus omit the explicit initialisation at the beginning.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/extcon/extcon-max77693.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/extcon/extcon-max77693.c b/drivers/extcon/extcon-max77693.c
index 643411066ad9..227651ff9666 100644
--- a/drivers/extcon/extcon-max77693.c
+++ b/drivers/extcon/extcon-max77693.c
@@ -266,7 +266,7 @@ static int max77693_muic_set_debounce_time(struct max77693_muic_info *info,
 static int max77693_muic_set_path(struct max77693_muic_info *info,
 		u8 val, bool attached)
 {
-	int ret = 0;
+	int ret;
 	unsigned int ctrl1, ctrl2 = 0;
 
 	if (attached)
-- 
2.15.0

