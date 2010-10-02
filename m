From: Julia Lawall <julia@diku.dk>
Date: Sat, 02 Oct 2010 13:59:18 +0000
Subject: [PATCH 4/4] drivers/atm/idt77252.c: Remove unnecessary error check
Message-Id: <1286027958-7333-4-git-send-email-julia@diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chas Williams <chas@cmf.nrl.navy.mil>
Cc: kernel-janitors@vger.kernel.org, linux-atm-general@lists.sourceforge.net, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

This code does not call deinit_card(card); in an error case, as done in
other error-handling code in the same function.  But actually, the called
function init_sram can only return 0, so there is no need for the error
check at all.

A simplified version of the sematic match that finds this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@r exists@
@r@
statement S1,S2,S3;
constant C1,C2,C3;
@@

*if (...)
 {... S1 return -C1;}
...
*if (...)
 {... when != S1
    return -C2;}
...
*if (...)
 {... S1 return -C3;}
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/atm/idt77252.c |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/atm/idt77252.c b/drivers/atm/idt77252.c
index 1679cbf..08ccde6 100644
--- a/drivers/atm/idt77252.c
+++ b/drivers/atm/idt77252.c
@@ -3410,8 +3410,7 @@ init_card(struct atm_dev *dev)
 
 	writel(readl(SAR_REG_CFG) | conf, SAR_REG_CFG);
 
-	if (init_sram(card) < 0)
-		return -1;
+	init_sram(card);
 
 /********************************************************************/
 /*  A L L O C   R A M   A N D   S E T   V A R I O U S   T H I N G S */

