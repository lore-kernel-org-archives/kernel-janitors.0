From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Wed, 07 Aug 2019 15:40:14 +0000
Subject: [PATCH] crypto: chtls - use 'skb_put_zero()' instead of re-implementing it
Message-Id: <20190807154014.22548-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: atul.gupta@chelsio.com, herbert@gondor.apana.org.au, zhongjiang@huawei.com, ganeshgr@chelsio.com, davem@davemloft.net, tglx@linutronix.de, bigeasy@linutronix.de
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

'skb_put()+memset()' is equivalent to 'skb_put_zero()'
Use the latter because it is less verbose and it hides the internals of the
sk_buff structure.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/crypto/chelsio/chtls/chtls_main.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/crypto/chelsio/chtls/chtls_main.c b/drivers/crypto/chelsio/chtls/chtls_main.c
index 635bb4b447fb..830b238da77e 100644
--- a/drivers/crypto/chelsio/chtls/chtls_main.c
+++ b/drivers/crypto/chelsio/chtls/chtls_main.c
@@ -218,9 +218,8 @@ static int chtls_get_skb(struct chtls_dev *cdev)
 	if (!cdev->askb)
 		return -ENOMEM;
 
-	skb_put(cdev->askb, sizeof(struct tcphdr));
+	skb_put_zero(cdev->askb, sizeof(struct tcphdr));
 	skb_reset_transport_header(cdev->askb);
-	memset(cdev->askb->data, 0, cdev->askb->len);
 	return 0;
 }
 
-- 
2.20.1
