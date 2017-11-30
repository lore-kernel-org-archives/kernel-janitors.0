From: Colin King <colin.king@canonical.com>
Date: Thu, 30 Nov 2017 14:23:54 +0000
Subject: [PATCH] chcr: ensure cntrl is initialized to fix bit-wise or'ing of garabage data
Message-Id: <20171130142354.21225-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Harsh Jain <harsh@chelsio.com>, Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

In the case where skb->ip_summed != CHECKSUM_PARTIAL then cntrl contains
garbage value and this is possibly being bit-wise or'd and stored into
cpl->ctrl1.  Fix this by initializing cntrl to zero.

Cleans up clang warning:
drivers/crypto/chelsio/chcr_ipsec.c:374:9: warning: The left expression
of the compound assignment is an uninitialized value. The computed value
will also be garbage

Fixes: 6dad4e8ab3ec ("chcr: Add support for Inline IPSec")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/crypto/chelsio/chcr_ipsec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/crypto/chelsio/chcr_ipsec.c b/drivers/crypto/chelsio/chcr_ipsec.c
index a0f003ffd1f4..64a030f8fb21 100644
--- a/drivers/crypto/chelsio/chcr_ipsec.c
+++ b/drivers/crypto/chelsio/chcr_ipsec.c
@@ -350,7 +350,7 @@ inline void *copy_cpltx_pktxt(struct sk_buff *skb,
 	struct port_info *pi;
 	struct sge_eth_txq *q;
 	struct cpl_tx_pkt_core *cpl;
-	u64 cntrl;
+	u64 cntrl = 0;
 	u32 ctrl0, qidx;
 
 	pi = netdev_priv(dev);
-- 
2.14.1

