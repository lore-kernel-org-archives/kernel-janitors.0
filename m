From: YueHaibing <yuehaibing@huawei.com>
Date: Wed, 03 Jul 2019 02:42:13 +0000
Subject: [PATCH net-next] net: socionext: remove set but not used variable 'pkts'
Message-Id: <20190703024213.191191-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jassi Brar <jaswinder.singh@linaro.org>, Alexei Starovoitov <ast@kernel.org>, "David S . Miller" <davem@davemloft.net>, Ilias Apalodimas <ilias.apalodimas@linaro.org>, Daniel Borkmann <daniel@iogearbox.net>, Jakub Kicinski <jakub.kicinski@netronome.com>, Jesper Dangaard Brouer <hawk@kernel.org>
Cc: YueHaibing <yuehaibing@huawei.com>, netdev@vger.kernel.org, xdp-newbies@vger.kernel.org, bpf@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/net/ethernet/socionext/netsec.c: In function 'netsec_clean_tx_dring':
drivers/net/ethernet/socionext/netsec.c:637:15: warning:
 variable 'pkts' set but not used [-Wunused-but-set-variable]

It is not used since commit ba2b232108d3 ("net: netsec: add XDP support")

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/net/ethernet/socionext/netsec.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/socionext/netsec.c b/drivers/net/ethernet/socionext/netsec.c
index 5544a722543f..015d1ec5436a 100644
--- a/drivers/net/ethernet/socionext/netsec.c
+++ b/drivers/net/ethernet/socionext/netsec.c
@@ -634,7 +634,7 @@ static void netsec_set_rx_de(struct netsec_priv *priv,
 static bool netsec_clean_tx_dring(struct netsec_priv *priv)
 {
 	struct netsec_desc_ring *dring = &priv->desc_ring[NETSEC_RING_TX];
-	unsigned int pkts, bytes;
+	unsigned int bytes;
 	struct netsec_de *entry;
 	int tail = dring->tail;
 	int cnt = 0;
@@ -642,7 +642,6 @@ static bool netsec_clean_tx_dring(struct netsec_priv *priv)
 	if (dring->is_xdp)
 		spin_lock(&dring->lock);
 
-	pkts = 0;
 	bytes = 0;
 	entry = dring->vaddr + DESC_SZ * tail;
