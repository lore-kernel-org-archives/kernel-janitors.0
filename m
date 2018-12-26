From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Wed, 26 Dec 2018 07:54:36 +0000
Subject: [PATCH 1/2] um: vector: Fix a potential NULL pointer dereference in 'vector_net_open()'
Message-Id: <20181226075436.11018-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jdike@addtoit.com, richard@nod.at, anton.ivanov@cambridgegreys.com, rppt@linux.vnet.ibm.com, akpm@linux-foundation.org, yuehaibing@huawei.com, keescook@chromium.org
Cc: linux-um@lists.infradead.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

'create_queue()' returns NULL in case of memory allocation failure. So we
must check if it succeeds in order to avoid potential NULL pointer
dereference.

For 'vp->rx_queue', the dereference would occur just one line after the
failed allocation. For 'vp->tx_queue', it would occur later during normal
processing.

Fixes: 49da7e64f33e ("High Performance UML Vector Network Driver")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 arch/um/drivers/vector_kern.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/um/drivers/vector_kern.c b/arch/um/drivers/vector_kern.c
index 046fa9ea0ccc..5b917716289d 100644
--- a/arch/um/drivers/vector_kern.c
+++ b/arch/um/drivers/vector_kern.c
@@ -1182,6 +1182,8 @@ static int vector_net_open(struct net_device *dev)
 			vp->rx_header_size,
 			MAX_IOV_SIZE
 		);
+		if (!vp->rx_queue)
+			goto out_close;
 		vp->rx_queue->queue_depth = get_depth(vp->parsed);
 	} else {
 		vp->header_rxbuffer = kmalloc(
@@ -1198,6 +1200,8 @@ static int vector_net_open(struct net_device *dev)
 			vp->header_size,
 			MAX_IOV_SIZE
 		);
+		if (!vp->tx_queue)
+			goto out_close;
 	} else {
 		vp->header_txbuffer = kmalloc(vp->header_size, GFP_KERNEL);
 		if (vp->header_txbuffer = NULL)
-- 
2.19.1
