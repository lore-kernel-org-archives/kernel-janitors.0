From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 09 Oct 2012 07:20:48 +0000
Subject: [patch] farsync: fix support for over 30 cards
Message-Id: <20121009072047.GB19159@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kevin Curtis <kevin.curtis@farsite.co.uk>
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, "David S. Miller" <davem@davemloft.net>

We're trying to fill a 64 bit bitmap but only the lower 30 shifts work
because the shift wraps around.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Static checker stuff.  No one actually has over 30 of these cards...  :P

diff --git a/drivers/net/wan/farsync.c b/drivers/net/wan/farsync.c
index 1a62318..b627132 100644
--- a/drivers/net/wan/farsync.c
+++ b/drivers/net/wan/farsync.c
@@ -597,7 +597,7 @@ fst_q_work_item(u64 * queue, int card_index)
 	 * bottom half for the card.  Note the limitation of 64 cards.
 	 * That ought to be enough
 	 */
-	mask = 1 << card_index;
+	mask = (u64)1 << card_index;
 	*queue |= mask;
 	spin_unlock_irqrestore(&fst_work_q_lock, flags);
 }
