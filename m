From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sat, 10 Jun 2017 09:19:20 +0000
Subject: [PATCH] cxgb4: Remove some dead code
Message-Id: <20170610091920.24746-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: swise@chelsio.com, dledford@redhat.com, sean.hefty@intel.com, hal.rosenstock@gmail.com
Cc: linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

This 'BUG_ON(!ep)' can never trigger because we have:
   if (!ep)
      return 0;
just a few lines above. So it can be removed safely.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/infiniband/hw/cxgb4/cm.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/infiniband/hw/cxgb4/cm.c b/drivers/infiniband/hw/cxgb4/cm.c
index 2f1136bf7b1f..815d7dfbdfb1 100644
--- a/drivers/infiniband/hw/cxgb4/cm.c
+++ b/drivers/infiniband/hw/cxgb4/cm.c
@@ -2879,7 +2879,6 @@ static int close_con_rpl(struct c4iw_dev *dev, struct sk_buff *skb)
 		return 0;
 
 	pr_debug("%s ep %p tid %u\n", __func__, ep, ep->hwtid);
-	BUG_ON(!ep);
 
 	/* The cm_id may be null if we failed to connect */
 	mutex_lock(&ep->com.mutex);
-- 
2.11.0

