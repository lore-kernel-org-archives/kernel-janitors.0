From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 19 Feb 2017 09:19:57 +0000
Subject: [PATCH] net: mvpp2: Fix a memory leak in error handling path
Message-Id: <20170219091957.8035-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: davem@davemloft.net, jszhang@marvell.com, tremyfr@gmail.com, f.fainelli@gmail.com, edumazet@google.com, thomas.petazzoni@free-electrons.com, arnd@arndb.de, jarod@redhat.com
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

if 'devm_kzalloc()' fails, we should release resources allocated so far,
just as done a few lines below.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/net/ethernet/marvell/mvpp2.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/marvell/mvpp2.c b/drivers/net/ethernet/marvell/mvpp2.c
index c2fd7c36f927..c48632048f71 100644
--- a/drivers/net/ethernet/marvell/mvpp2.c
+++ b/drivers/net/ethernet/marvell/mvpp2.c
@@ -5971,8 +5971,10 @@ static int mvpp2_port_init(struct mvpp2_port *port)
 		struct mvpp2_tx_queue *txq;
 
 		txq = devm_kzalloc(dev, sizeof(*txq), GFP_KERNEL);
-		if (!txq)
-			return -ENOMEM;
+		if (!txq) {
+			err = -ENOMEM;
+			goto err_free_percpu;
+		}
 
 		txq->pcpu = alloc_percpu(struct mvpp2_txq_pcpu);
 		if (!txq->pcpu) {
-- 
2.9.3

