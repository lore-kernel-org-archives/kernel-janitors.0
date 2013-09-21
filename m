From: Peter Senna Tschudin <peter.senna@gmail.com>
Date: Sat, 21 Sep 2013 22:27:41 +0000
Subject: [PATCH 09/19] net: Change variable type to bool
Message-Id: <1379802471-30252-9-git-send-email-peter.senna@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1379802471-30252-1-git-send-email-peter.senna@gmail.com>
In-Reply-To: <1379802471-30252-1-git-send-email-peter.senna@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: eilong@broadcom.com
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Peter Senna Tschudin <peter.senna@gmail.com>

The variable rc is only assigned the values true and false.
The function bnx2x_prev_is_path_marked already returns bool.
Change rc type to bool.

The simplified semantic patch that find this problem is as
follows (http://coccinelle.lip6.fr/):

@exists@
type T;
identifier b;
@@
- T
+ bool
  b = ...;
  ... when any
  b = \(true\|false\)

Signed-off-by: Peter Senna Tschudin <peter.senna@gmail.com>
---
 drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c b/drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c
index fccfc1d..105cc80 100644
--- a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c
+++ b/drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c
@@ -9874,7 +9874,7 @@ static int bnx2x_prev_path_mark_eeh(struct bnx2x *bp)
 static bool bnx2x_prev_is_path_marked(struct bnx2x *bp)
 {
 	struct bnx2x_prev_path_list *tmp_list;
-	int rc = false;
+	bool rc = false;
 
 	if (down_trylock(&bnx2x_prev_sem))
 		return false;
-- 
1.8.3.1

