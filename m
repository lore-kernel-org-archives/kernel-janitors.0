From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 03 Dec 2020 08:44:31 +0000
Subject: [PATCH net] chelsio/chtls: fix a double free in chtls_setkey()
Message-Id: <X8ilb6PtBRLWiSHp@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ayush Sawal <ayush.sawal@chelsio.com>, Atul Gupta <atul.gupta@chelsio.com>
Cc: Vinay Kumar Yadav <vinay.yadav@chelsio.com>, Rohit Maheshwari <rohitm@chelsio.com>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

The "skb" is freed by the transmit code in cxgb4_ofld_send() and we
shouldn't use it again.  But in the current code, if we hit an error
later on in the function then the clean up code will call kfree_skb(skb)
and so it causes a double free.

Set the "skb" to NULL and that makes the kfree_skb() a no-op.

Fixes: d25f2f71f653 ("crypto: chtls - Program the TLS session Key")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/net/ethernet/chelsio/inline_crypto/chtls/chtls_hw.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/chelsio/inline_crypto/chtls/chtls_hw.c b/drivers/net/ethernet/chelsio/inline_crypto/chtls/chtls_hw.c
index 62c829023da5..a4fb463af22a 100644
--- a/drivers/net/ethernet/chelsio/inline_crypto/chtls/chtls_hw.c
+++ b/drivers/net/ethernet/chelsio/inline_crypto/chtls/chtls_hw.c
@@ -391,6 +391,7 @@ int chtls_setkey(struct chtls_sock *csk, u32 keylen,
 	csk->wr_unacked += DIV_ROUND_UP(len, 16);
 	enqueue_wr(csk, skb);
 	cxgb4_ofld_send(csk->egress_dev, skb);
+	skb = NULL;
 
 	chtls_set_scmd(csk);
 	/* Clear quiesce for Rx key */
-- 
2.29.2
