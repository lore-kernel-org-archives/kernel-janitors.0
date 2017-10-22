From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 22 Oct 2017 17:52:18 +0000
Subject: [PATCH 2/2] extcon: max14577: Delete an unnecessary variable initialisation in max14577_muic_set_pat
Message-Id: <431ea2b6-5b03-3752-a9c1-a39b1a7e4921@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 22 Oct 2017 19:39:12 +0200

The variable "ret" is immediately reassigned by a following statement.
Thus omit the explicit initialisation at the beginning.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/extcon/extcon-max14577.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/extcon/extcon-max14577.c b/drivers/extcon/extcon-max14577.c
index 3d4bf5d23236..a2b60742a228 100644
--- a/drivers/extcon/extcon-max14577.c
+++ b/drivers/extcon/extcon-max14577.c
@@ -204,8 +204,8 @@ static int max14577_muic_set_debounce_time(struct max14577_muic_info *info,
 static int max14577_muic_set_path(struct max14577_muic_info *info,
 		u8 val, bool attached)
 {
-	int ret = 0;
 	u8 ctrl1, ctrl2 = 0;
+	int ret;
 
 	/* Set open state to path before changing hw path */
 	ret = max14577_update_reg(info->max14577->regmap,
-- 
2.14.2

