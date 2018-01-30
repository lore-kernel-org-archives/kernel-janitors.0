From: Colin King <colin.king@canonical.com>
Date: Tue, 30 Jan 2018 14:53:48 +0000
Subject: [PATCH] esp4: remove redundant initialization of pointer esph
Message-Id: <20180130145348.32202-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steffen Klassert <steffen.klassert@secunet.com>, Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller" <davem@davemloft.net>, Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>, Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Pointer esph is being assigned a value that is never read, esph is
re-assigned and only read inside an if statement, hence the
initialization is redundant and can be removed.

Cleans up clang warning:
net/ipv4/esp4.c:657:21: warning: Value stored to 'esph' during
its initialization is never read

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 net/ipv4/esp4.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/ipv4/esp4.c b/net/ipv4/esp4.c
index 296d0b956bfe..97689012b357 100644
--- a/net/ipv4/esp4.c
+++ b/net/ipv4/esp4.c
@@ -654,7 +654,7 @@ static void esp_input_restore_header(struct sk_buff *skb)
 static void esp_input_set_header(struct sk_buff *skb, __be32 *seqhi)
 {
 	struct xfrm_state *x = xfrm_input_state(skb);
-	struct ip_esp_hdr *esph = (struct ip_esp_hdr *)skb->data;
+	struct ip_esp_hdr *esph;
 
 	/* For ESN we move the header forward by 4 bytes to
 	 * accomodate the high bits.  We will move it back after
-- 
2.15.1

