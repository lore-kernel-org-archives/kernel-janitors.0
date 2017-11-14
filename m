From: Colin King <colin.king@canonical.com>
Date: Tue, 14 Nov 2017 18:41:44 +0000
Subject: [PATCH][net-next] tcp: remove the now redundant non-null check on tskb
Message-Id: <20171114184144.11239-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S . Miller" <davem@davemloft.net>, Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>, Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The non-null check on tskb is redundant as it is in an else
section of a check on tskb where tskb is always null. Remove
the redundant if statement and the label coalesce.

Detected by CoverityScan, CID#1457751 ("Logically dead code")

Fixes: 75c119afe14f ("tcp: implement rb-tree based retransmit queue")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 net/ipv4/tcp_output.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/net/ipv4/tcp_output.c b/net/ipv4/tcp_output.c
index 071bdd34f8eb..b58c986b2b27 100644
--- a/net/ipv4/tcp_output.c
+++ b/net/ipv4/tcp_output.c
@@ -3053,7 +3053,6 @@ void tcp_send_fin(struct sock *sk)
 		tskb = skb_rb_last(&sk->tcp_rtx_queue);
 
 	if (tskb) {
-coalesce:
 		TCP_SKB_CB(tskb)->tcp_flags |= TCPHDR_FIN;
 		TCP_SKB_CB(tskb)->end_seq++;
 		tp->write_seq++;
@@ -3069,11 +3068,8 @@ void tcp_send_fin(struct sock *sk)
 		}
 	} else {
 		skb = alloc_skb_fclone(MAX_TCP_HEADER, sk->sk_allocation);
-		if (unlikely(!skb)) {
-			if (tskb)
-				goto coalesce;
+		if (unlikely(!skb))
 			return;
-		}
 		INIT_LIST_HEAD(&skb->tcp_tsorted_anchor);
 		skb_reserve(skb, MAX_TCP_HEADER);
 		sk_forced_mem_schedule(sk, skb->truesize);
-- 
2.14.1

