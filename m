From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 03 Nov 2012 10:58:27 +0000
Subject: [PATCH 6/16] drivers/infiniband/hw/cxgb4/cm.c: use WARN
Message-Id: <1351940317-14812-7-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1351940317-14812-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1351940317-14812-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steve Wise <swise@chelsio.com>
Cc: kernel-janitors@vger.kernel.org, Roland Dreier <roland@kernel.org>, Sean Hefty <sean.hefty@intel.com>, Hal Rosenstock <hal.rosenstock@gmail.com>, linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

Use WARN rather than printk followed by WARN_ON(1), for conciseness.

A simplified version of the semantic patch that makes this transformation
is as follows: (http://coccinelle.lip6.fr/)

// <smpl>
@@
expression list es;
@@

-printk(
+WARN(1,
  es);
-WARN_ON(1);
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/infiniband/hw/cxgb4/cm.c |    6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/infiniband/hw/cxgb4/cm.c b/drivers/infiniband/hw/cxgb4/cm.c
index 6cfd4d8..ed048b9 100644
--- a/drivers/infiniband/hw/cxgb4/cm.c
+++ b/drivers/infiniband/hw/cxgb4/cm.c
@@ -151,9 +151,8 @@ static void stop_ep_timer(struct c4iw_ep *ep)
 {
 	PDBG("%s ep %p\n", __func__, ep);
 	if (!timer_pending(&ep->timer)) {
-		printk(KERN_ERR "%s timer stopped when its not running! "
+		WARN(1, KERN_ERR "%s timer stopped when its not running! "
 		       "ep %p state %u\n", __func__, ep, ep->com.state);
-		WARN_ON(1);
 		return;
 	}
 	del_timer_sync(&ep->timer);
@@ -2551,9 +2550,8 @@ static void process_timeout(struct c4iw_ep *ep)
 		__state_set(&ep->com, ABORTING);
 		break;
 	default:
-		printk(KERN_ERR "%s unexpected state ep %p tid %u state %u\n",
+		WARN(1, KERN_ERR "%s unexpected state ep %p tid %u state %u\n",
 			__func__, ep, ep->hwtid, ep->com.state);
-		WARN_ON(1);
 		abort = 0;
 	}
 	mutex_unlock(&ep->com.mutex);

