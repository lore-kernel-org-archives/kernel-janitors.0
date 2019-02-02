From: Colin King <colin.king@canonical.com>
Date: Sat, 02 Feb 2019 11:45:26 +0000
Subject: [PATCH] atheros: atl2: fix an indentaion issue on a return statement
Message-Id: <20190202114526.18510-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jay Cliburn <jcliburn@gmail.com>, Chris Snook <chris.snook@gmail.com>, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

A return statment is not indented correctly, fix this by adding an
extra tab.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/atheros/atlx/atl2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/atheros/atlx/atl2.c b/drivers/net/ethernet/atheros/atlx/atl2.c
index c44e95255aa1..a7337a6d507d 100644
--- a/drivers/net/ethernet/atheros/atlx/atl2.c
+++ b/drivers/net/ethernet/atheros/atlx/atl2.c
@@ -2946,7 +2946,7 @@ static int atl2_validate_option(int *value, struct atl2_option *opt)
 			if (*value = ent->i) {
 				if (ent->str[0] != '\0')
 					printk(KERN_INFO "%s\n", ent->str);
-			return 0;
+				return 0;
 			}
 		}
 		break;
-- 
2.20.1
