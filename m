From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Mon, 18 Feb 2019 06:51:11 +0000
Subject: [PATCH -next] iw_cxgb4: make function read_tcb() static
Message-Id: <20190218070432.167400-1-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Fixes the following sparse warning:

drivers/infiniband/hw/cxgb4/cm.c:658:6: warning:
 symbol 'read_tcb' was not declared. Should it be static?

Fixes: 11a27e2121a5 ("iw_cxgb4: complete the cached SRQ buffers")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/infiniband/hw/cxgb4/cm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/infiniband/hw/cxgb4/cm.c b/drivers/infiniband/hw/cxgb4/cm.c
index ae90b2932bd2..4d232bdf9e97 100644
--- a/drivers/infiniband/hw/cxgb4/cm.c
+++ b/drivers/infiniband/hw/cxgb4/cm.c
@@ -655,7 +655,7 @@ static int send_halfclose(struct c4iw_ep *ep)
 	return c4iw_l2t_send(&ep->com.dev->rdev, skb, ep->l2t);
 }
 
-void read_tcb(struct c4iw_ep *ep)
+static void read_tcb(struct c4iw_ep *ep)
 {
 	struct sk_buff *skb;
 	struct cpl_get_tcb *req;
