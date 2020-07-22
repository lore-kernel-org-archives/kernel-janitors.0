From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Wed, 22 Jul 2020 10:17:01 +0000
Subject: [PATCH 1/2] ipw2100: Use GFP_KERNEL instead of GFP_ATOMIC in some memory allocation
Message-Id: <20200722101701.26126-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: stas.yakovlev@gmail.com, kvalo@codeaurora.org, davem@davemloft.net, kuba@kernel.org
Cc: linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

The call chain is:
   ipw2100_pci_init_one            (the probe function)
     --> ipw2100_queues_allocate
       --> ipw2100_tx_allocate

No lock is taken in the between.
So it is safe to use GFP_KERNEL in 'ipw2100_tx_allocate()'.

BTW, 'ipw2100_queues_allocate()' also calls 'ipw2100_msg_allocate()' which
already allocates some memory using GFP_KERNEL.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/net/wireless/intel/ipw2x00/ipw2100.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/intel/ipw2x00/ipw2100.c b/drivers/net/wireless/intel/ipw2x00/ipw2100.c
index 83d2f2acc0de..699deca745a2 100644
--- a/drivers/net/wireless/intel/ipw2x00/ipw2100.c
+++ b/drivers/net/wireless/intel/ipw2x00/ipw2100.c
@@ -4430,7 +4430,7 @@ static int ipw2100_tx_allocate(struct ipw2100_priv *priv)
 
 	priv->tx_buffers = kmalloc_array(TX_PENDED_QUEUE_LENGTH,
 					 sizeof(struct ipw2100_tx_packet),
-					 GFP_ATOMIC);
+					 GFP_KERNEL);
 	if (!priv->tx_buffers) {
 		bd_queue_free(priv, &priv->tx_queue);
 		return -ENOMEM;
-- 
2.25.1
