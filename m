From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Mon, 19 May 2014 04:31:12 +0000
Subject: [PATCH 10/13] staging: rtl8192e: make return of 0 explicit
Message-Id: <1400473875-22228-11-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1400473875-22228-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1400473875-22228-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel-janitors@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

Delete unnecessary use of a local variable to immediately return 0.

A simplified version of the semantic patch that fixes this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@r exists@
local idexpression ret;
expression e;
position p;
@@

-ret = 0;
... when != ret = e
return 
- ret
+ 0
  ;
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index 356d521..2920e40 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -1915,8 +1915,7 @@ int rtl8192_hard_start_xmit(struct sk_buff *skb, struct net_device *dev)
 	memcpy((unsigned char *)(skb->cb), &dev, sizeof(dev));
 	if (queue_index = TXCMD_QUEUE) {
 		rtl8192_tx_cmd(dev, skb);
-		ret = 0;
-		return ret;
+		return 0;
 	} else {
 		tcb_desc->RATRIndex = 7;
 		tcb_desc->bTxDisableRateFallBack = 1;

