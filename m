From: Colin King <colin.king@canonical.com>
Date: Thu, 30 Nov 2017 14:11:44 +0000
Subject: [PATCH] chcr: remove unused variables net_device, pi, adap and cntrl
Message-Id: <20171130141144.20845-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Harsh Jain <harsh@chelsio.com>, Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Variables adap, pi and cntrl are assigned but are never read, hence
they are redundant and can be removed.

Cleans up various clang build warnings.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/crypto/chelsio/chcr_ipsec.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/crypto/chelsio/chcr_ipsec.c b/drivers/crypto/chelsio/chcr_ipsec.c
index f90f991c133f..a0f003ffd1f4 100644
--- a/drivers/crypto/chelsio/chcr_ipsec.c
+++ b/drivers/crypto/chelsio/chcr_ipsec.c
@@ -199,14 +199,9 @@ static inline int chcr_ipsec_setkey(struct xfrm_state *x,
  */
 static int chcr_xfrm_add_state(struct xfrm_state *x)
 {
-	struct net_device *netdev = x->xso.dev;
-	struct port_info *pi  = netdev_priv(netdev);
 	struct ipsec_sa_entry *sa_entry;
-	struct adapter *adap;
 	int res = 0;
 
-	adap = pi->adapter;
-
 	if (x->props.aalgo != SADB_AALG_NONE) {
 		pr_debug("CHCR: Cannot offload authenticated xfrm states\n");
 		return -EINVAL;
@@ -570,7 +565,7 @@ int chcr_ipsec_xmit(struct sk_buff *skb, struct net_device *dev)
 {
 	struct xfrm_state *x = xfrm_input_state(skb);
 	struct ipsec_sa_entry *sa_entry;
-	u64 *pos, *end, *before, cntrl, *sgl;
+	u64 *pos, *end, *before, *sgl;
 	int qidx, left, credits;
 	unsigned int flits = 0, ndesc, kctx_len;
 	struct adapter *adap;
@@ -596,7 +591,6 @@ out_free:       dev_kfree_skb_any(skb);
 	q = &adap->sge.ethtxq[qidx + pi->first_qset];
 
 	cxgb4_reclaim_completed_tx(adap, &q->q, true);
-	cntrl = TXPKT_L4CSUM_DIS_F | TXPKT_IPCSUM_DIS_F;
 
 	flits = calc_tx_sec_flits(skb, sa_entry->kctx_len);
 	ndesc = flits_to_desc(flits);
-- 
2.14.1

