From: Colin King <colin.king@canonical.com>
Date: Thu, 19 Oct 2017 13:09:47 +0000
Subject: [PATCH] esp6: remove redundant initialization of esph
Message-Id: <20171019130947.30950-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steffen Klassert <steffen.klassert@secunet.com>, Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller" <davem@davemloft.net>, Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>, Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The pointer esph is being initialized with a value that is never
read and then being updated.  Remove the redundant initialization
and move the declaration and initializtion of esph to the local
code block.

Cleans up clang warning:
net/ipv6/esp6.c:562:21: warning: Value stored to 'esph' during its
initialization is never read

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 net/ipv6/esp6.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/ipv6/esp6.c b/net/ipv6/esp6.c
index 89910e2c10f4..1696401fed6c 100644
--- a/net/ipv6/esp6.c
+++ b/net/ipv6/esp6.c
@@ -559,14 +559,14 @@ static void esp_input_restore_header(struct sk_buff *skb)
 static void esp_input_set_header(struct sk_buff *skb, __be32 *seqhi)
 {
 	struct xfrm_state *x = xfrm_input_state(skb);
-	struct ip_esp_hdr *esph = (struct ip_esp_hdr *)skb->data;
 
 	/* For ESN we move the header forward by 4 bytes to
 	 * accomodate the high bits.  We will move it back after
 	 * decryption.
 	 */
 	if ((x->props.flags & XFRM_STATE_ESN)) {
-		esph = skb_push(skb, 4);
+		struct ip_esp_hdr *esph = skb_push(skb, 4);
+
 		*seqhi = esph->spi;
 		esph->spi = esph->seq_no;
 		esph->seq_no = XFRM_SKB_CB(skb)->seq.input.hi;
-- 
2.14.1

