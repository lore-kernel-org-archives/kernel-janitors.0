From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 01 Jun 2018 07:59:25 +0000
Subject: [PATCH] crypto: chtls - use after free in chtls_pt_recvmsg()
Message-Id: <20180601075852.fn5hongkasesi2ep@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Harsh Jain <harsh@chelsio.com>, Atul Gupta <atul.gupta@chelsio.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, Michael Werner <werner@chelsio.com>, linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

We call chtls_free_skb() but then we dereference it on the next lines.
Also "skb" can't be NULL, we just dereferenced it on the line before.

I have moved the free down a couple lines to fix this issue.

Fixes: 17a7d24aa89d ("crypto: chtls - generic handling of data and hdr")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/crypto/chelsio/chtls/chtls_io.c b/drivers/crypto/chelsio/chtls/chtls_io.c
index 51fc6821cbbf..708e232e3cdf 100644
--- a/drivers/crypto/chelsio/chtls/chtls_io.c
+++ b/drivers/crypto/chelsio/chtls/chtls_io.c
@@ -1548,15 +1548,14 @@ static int chtls_pt_recvmsg(struct sock *sk, struct msghdr *msg, size_t len,
 			tp->urg_data = 0;
 
 		if ((avail + offset) >= skb->len) {
-			if (likely(skb))
-				chtls_free_skb(sk, skb);
-			buffers_freed++;
 			if (ULP_SKB_CB(skb)->flags & ULPCB_FLAG_TLS_HDR) {
 				tp->copied_seq += skb->len;
 				hws->rcvpld = skb->hdr_len;
 			} else {
 				tp->copied_seq += hws->rcvpld;
 			}
+			chtls_free_skb(sk, skb);
+			buffers_freed++;
 			hws->copied_seq = 0;
 			if (copied >= target &&
 			    !skb_peek(&sk->sk_receive_queue))
