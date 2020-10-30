From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 30 Oct 2020 11:51:02 +0000
Subject: [PATCH] ide: Prevent some negative shifts in ide_set_ignore_cable()
Message-Id: <20201030115102.GE3251003@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S. Miller" <davem@davemloft.net>, Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
Cc: linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Shifting by a negative number is undefined.  These values come from the
module parameter, so it's not a big deal from a practical perspective.

Fixes: 9fd91d959f1a ("ide: add "ignore_cable" parameter (take 2)")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/ide/ide.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/ide/ide.c b/drivers/ide/ide.c
index 9a9c64fd1032..dcfb8a187c46 100644
--- a/drivers/ide/ide.c
+++ b/drivers/ide/ide.c
@@ -338,7 +338,7 @@ static int ide_set_ignore_cable(const char *s, const struct kernel_param *kp)
 	if (sscanf(s, "%d:%d", &i, &j) != 2 && sscanf(s, "%d", &i) != 1)
 		return -EINVAL;
 
-	if (i >= MAX_HWIFS || j < 0 || j > 1)
+	if (i < 0 || i >= MAX_HWIFS || j < 0 || j > 1)
 		return -EINVAL;
 
 	if (j)
-- 
2.28.0
