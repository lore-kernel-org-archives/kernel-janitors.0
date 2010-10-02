From: Julia Lawall <julia@diku.dk>
Date: Sat, 02 Oct 2010 14:37:07 +0000
Subject: Re: [PATCH 4/4] drivers/atm/idt77252.c: Remove unnecessary error
Message-Id: <Pine.LNX.4.64.1010021636330.21879@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1286027958-7333-4-git-send-email-julia@diku.dk> <4CA73D26.7090109@bfs.de>
In-Reply-To: <4CA73D26.7090109@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: walter harms <wharms@bfs.de>
Cc: Chas Williams <chas@cmf.nrl.navy.mil>, kernel-janitors@vger.kernel.org, linux-atm-general@lists.sourceforge.net, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

This code does not call deinit_card(card); in an error case, as done in
other error-handling code in the same function.  But actually, the called
function init_sram can only return 0, so there is no need for the error
check at all.

init_sram is also given a void return type, and its single return statement
at the end of the function is dropped.

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
 drivers/atm/idt77252.c              |    6 ++----
 1 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/atm/idt77252.c b/drivers/atm/idt77252.c
index 1679cbf..bce5732 100644
--- a/drivers/atm/idt77252.c
+++ b/drivers/atm/idt77252.c
@@ -3152,7 +3152,7 @@ deinit_card(struct idt77252_dev *card)
 }
 
 
-static int __devinit
+static void __devinit
 init_sram(struct idt77252_dev *card)
 {
 	int i;
@@ -3298,7 +3298,6 @@ init_sram(struct idt77252_dev *card)
 	       SAR_REG_RXFD);
 
 	IPRINTK("%s: SRAM initialization complete.\n", card->name);
-	return 0;
 }
 
 static int __devinit
@@ -3410,8 +3409,7 @@ init_card(struct atm_dev *dev)
 
 	writel(readl(SAR_REG_CFG) | conf, SAR_REG_CFG);
 
-	if (init_sram(card) < 0)
-		return -1;
+	init_sram(card);
 
 /********************************************************************/
 /*  A L L O C   R A M   A N D   S E T   V A R I O U S   T H I N G S */
