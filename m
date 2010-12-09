From: Tobias Klauser <tklauser@distanz.ch>
Date: Thu, 09 Dec 2010 14:37:48 +0000
Subject: [PATCH] inet6: Remove redundant unlikely()
Message-Id: <1291905468-32174-1-git-send-email-tklauser@distanz.ch>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S. Miller" <davem@davemloft.net>, Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>, "Pekka Savola (ipv6)" <pekkas@netcore.fi>, James Morris <jmorris@namei.org>, Hideaki YOSHIFUJI <yosh>
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

IS_ERR() already implies unlikely(), so it can be omitted here.

Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
---
 net/ipv6/af_inet6.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/net/ipv6/af_inet6.c b/net/ipv6/af_inet6.c
index 54e8e42..059a3de 100644
--- a/net/ipv6/af_inet6.c
+++ b/net/ipv6/af_inet6.c
@@ -810,7 +810,7 @@ static struct sk_buff *ipv6_gso_segment(struct sk_buff *skb, int features)
 	}
 	rcu_read_unlock();
 
-	if (unlikely(IS_ERR(segs)))
+	if (IS_ERR(segs))
 		goto out;
 
 	for (skb = segs; skb; skb = skb->next) {
-- 
1.7.0.4

