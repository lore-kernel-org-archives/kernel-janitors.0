From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Thu, 19 Sep 2019 20:04:28 +0000
Subject: [PATCH] crypto: chtls - simplify a bit 'create_flowc_wr_skb()'
Message-Id: <20190919200428.2664-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: atul.gupta@chelsio.com, herbert@gondor.apana.org.au, davem@davemloft.net, akpm@linux-foundation.org, willy@infradead.org, kirill.shutemov@linux.intel.com, kstewart@linuxfoundation.org, yuehaibing@huawei.com, tglx@linutronix.de
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Use '__skb_put_data()' instead of rewritting it.
This improves readability.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/crypto/chelsio/chtls/chtls_io.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/crypto/chelsio/chtls/chtls_io.c b/drivers/crypto/chelsio/chtls/chtls_io.c
index 0891ab829b1b..2512bfb24d71 100644
--- a/drivers/crypto/chelsio/chtls/chtls_io.c
+++ b/drivers/crypto/chelsio/chtls/chtls_io.c
@@ -97,7 +97,7 @@ static struct sk_buff *create_flowc_wr_skb(struct sock *sk,
 	if (!skb)
 		return NULL;
 
-	memcpy(__skb_put(skb, flowclen), flowc, flowclen);
+	__skb_put_data(skb, flowc, flowclen);
 	skb_set_queue_mapping(skb, (csk->txq_idx << 1) | CPL_PRIORITY_DATA);
 
 	return skb;
-- 
2.20.1
