From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Sat, 09 May 2020 08:05:48 +0000
Subject: [PATCH -next] cxgb4/chcr: Fix error return code in chcr_ktls_dev_add()
Message-Id: <20200509080548.118667-1-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ayush Sawal <ayush.sawal@chelsio.com>, Vinay Kumar Yadav <vinay.yadav@chelsio.com>, Rohit Maheshwari <rohitm@chelsio.com>, Herbert Xu <herbert@gondor.apana.org.au>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, linux-crypto@vger.kernel.org, kernel-janitors@vger.kernel.org, Hulk Robot <hulkci@huawei.com>

Fix to return a negative error code from the error handling
case instead of 0, as done elsewhere in this function.

Fixes: 34aba2c45024 ("cxgb4/chcr : Register to tls add and del callback")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/crypto/chelsio/chcr_ktls.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/crypto/chelsio/chcr_ktls.c b/drivers/crypto/chelsio/chcr_ktls.c
index 43d9e2420110..baaea8ce4080 100644
--- a/drivers/crypto/chelsio/chcr_ktls.c
+++ b/drivers/crypto/chelsio/chcr_ktls.c
@@ -501,12 +501,14 @@ static int chcr_ktls_dev_add(struct net_device *netdev, struct sock *sk,
 	dst = sk_dst_get(sk);
 	if (!dst) {
 		pr_err("DST entry not found\n");
+		ret = -ENOENT;
 		goto out2;
 	}
 	n = dst_neigh_lookup(dst, daaddr);
 	if (!n || !n->dev) {
 		pr_err("neighbour not found\n");
 		dst_release(dst);
+		ret = -ENOENT;
 		goto out2;
 	}
 	tx_info->l2te  = cxgb4_l2t_get(adap->l2t, n, n->dev, 0);
@@ -516,6 +518,7 @@ static int chcr_ktls_dev_add(struct net_device *netdev, struct sock *sk,
 
 	if (!tx_info->l2te) {
 		pr_err("l2t entry not found\n");
+		ret = -ENOENT;
 		goto out2;
 	}
