From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Wed, 30 Oct 2019 06:36:40 +0000
Subject: [PATCH] net: qrtr: Simplify 'qrtr_tun_release()'
Message-Id: <20191030063640.25794-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: davem@davemloft.net, navid.emamdoost@gmail.com
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Use 'skb_queue_purge()' instead of re-implementing it.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 net/qrtr/tun.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/net/qrtr/tun.c b/net/qrtr/tun.c
index e35869e81766..15ce9b642b25 100644
--- a/net/qrtr/tun.c
+++ b/net/qrtr/tun.c
@@ -111,15 +111,11 @@ static __poll_t qrtr_tun_poll(struct file *filp, poll_table *wait)
 static int qrtr_tun_release(struct inode *inode, struct file *filp)
 {
 	struct qrtr_tun *tun = filp->private_data;
-	struct sk_buff *skb;
 
 	qrtr_endpoint_unregister(&tun->ep);
 
 	/* Discard all SKBs */
-	while (!skb_queue_empty(&tun->queue)) {
-		skb = skb_dequeue(&tun->queue);
-		kfree_skb(skb);
-	}
+	skb_queue_purge(&tun->queue);
 
 	kfree(tun);
 
-- 
2.20.1
