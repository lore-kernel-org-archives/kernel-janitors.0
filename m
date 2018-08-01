From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Wed, 01 Aug 2018 01:59:56 +0000
Subject: [PATCH net-next] tcp: remove set but not used variable 'skb_size'
Message-Id: <1533088796-149451-1-git-send-email-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1533048144-39731-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1533048144-39731-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Eric Dumazet <edumazet@google.com>, Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>, Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

net/ipv4/tcp_output.c: In function 'tcp_collapse_retrans':
net/ipv4/tcp_output.c:2700:6: warning:
 variable 'skb_size' set but not used [-Wunused-but-set-variable]
  int skb_size, next_skb_size;
      ^

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 net/ipv4/tcp_output.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/net/ipv4/tcp_output.c b/net/ipv4/tcp_output.c
index 490df62..731e6d4 100644
--- a/net/ipv4/tcp_output.c
+++ b/net/ipv4/tcp_output.c
@@ -2697,9 +2697,8 @@ static bool tcp_collapse_retrans(struct sock *sk, struct sk_buff *skb)
 {
 	struct tcp_sock *tp = tcp_sk(sk);
 	struct sk_buff *next_skb = skb_rb_next(skb);
-	int skb_size, next_skb_size;
+	int next_skb_size;
 
-	skb_size = skb->len;
 	next_skb_size = next_skb->len;
 
 	BUG_ON(tcp_skb_pcount(skb) != 1 || tcp_skb_pcount(next_skb) != 1);

