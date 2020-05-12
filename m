From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 12 May 2020 08:04:36 +0000
Subject: [PATCH] cxgb4/chcr: Fix a leak in chcr_ktls_dev_add()
Message-Id: <20200512080436.GA247819@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20200509080548.118667-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>, Rohit Maheshwari <rohitm@chelsio.com>
Cc: Ayush Sawal <ayush.sawal@chelsio.com>, Vinay Kumar Yadav <vinay.yadav@chelsio.com>, Herbert Xu <herbert@gondor.apana.org.au>, linux-crypto@vger.kernel.org, kernel-janitors@vger.kernel.org, Hulk Robot <hulkci@huawei.com>

We need to free "tx_info->l2te" if chcr_setup_connection() fails.  My
other concern was that if we free "tx_info" then "tx_ctx->chcr_info"
points to a freed variable.  I don't think this causes a problem but
it's cleaner to reset it back to NULL.  Also I renamed the labels to
say what the gotos do instead of using numbered labels.

Fixes: 34aba2c45024 ("cxgb4/chcr : Register to tls add and del callback")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Applies on top of Wei Yongjun's patch.

 drivers/crypto/chelsio/chcr_ktls.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/crypto/chelsio/chcr_ktls.c b/drivers/crypto/chelsio/chcr_ktls.c
index baaea8ce40806..3173ac3099bc6 100644
--- a/drivers/crypto/chelsio/chcr_ktls.c
+++ b/drivers/crypto/chelsio/chcr_ktls.c
@@ -478,7 +478,7 @@ static int chcr_ktls_dev_add(struct net_device *netdev, struct sock *sk,
 
 	tx_info->rx_qid = chcr_get_first_rx_qid(adap);
 	if (unlikely(tx_info->rx_qid < 0))
-		goto out2;
+		goto free_tx_info;
 
 	tx_info->prev_seq = start_offload_tcp_sn;
 	tx_info->tcp_start_seq_number = start_offload_tcp_sn;
@@ -486,7 +486,7 @@ static int chcr_ktls_dev_add(struct net_device *netdev, struct sock *sk,
 	/* save crypto keys */
 	ret = chcr_ktls_save_keys(tx_info, crypto_info, direction);
 	if (ret < 0)
-		goto out2;
+		goto free_tx_info;
 
 	/* get peer ip */
 	if (sk->sk_family = AF_INET ||
@@ -502,14 +502,14 @@ static int chcr_ktls_dev_add(struct net_device *netdev, struct sock *sk,
 	if (!dst) {
 		pr_err("DST entry not found\n");
 		ret = -ENOENT;
-		goto out2;
+		goto free_tx_info;
 	}
 	n = dst_neigh_lookup(dst, daaddr);
 	if (!n || !n->dev) {
 		pr_err("neighbour not found\n");
 		dst_release(dst);
 		ret = -ENOENT;
-		goto out2;
+		goto free_tx_info;
 	}
 	tx_info->l2te  = cxgb4_l2t_get(adap->l2t, n, n->dev, 0);
 
@@ -519,7 +519,7 @@ static int chcr_ktls_dev_add(struct net_device *netdev, struct sock *sk,
 	if (!tx_info->l2te) {
 		pr_err("l2t entry not found\n");
 		ret = -ENOENT;
-		goto out2;
+		goto free_tx_info;
 	}
 
 	tx_ctx->chcr_info = tx_info;
@@ -529,12 +529,16 @@ static int chcr_ktls_dev_add(struct net_device *netdev, struct sock *sk,
 	 */
 	ret = chcr_setup_connection(sk, tx_info);
 	if (ret)
-		goto out2;
+		goto free_l2te;
 
 	atomic64_inc(&adap->chcr_stats.ktls_tx_connection_open);
 	return 0;
-out2:
+
+free_l2te:
+	cxgb4_l2t_release(tx_info->l2te);
+free_tx_info:
 	kvfree(tx_info);
+	tx_ctx->chcr_info = NULL;
 out:
 	atomic64_inc(&adap->chcr_stats.ktls_tx_connection_fail);
 	return ret;
-- 
2.26.2
