From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Wed, 25 Jul 2018 05:58:10 +0000
Subject: [PATCH net-next] tcp: make function tcp_retransmit_stamp() static
Message-Id: <1532498767-188296-1-git-send-email-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Eric Dumazet <edumazet@google.com>, Jon Maxwell <jmaxwell37@gmail.com>, Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>, Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes the following sparse warnings:

net/ipv4/tcp_timer.c:25:5: warning:
 symbol 'tcp_retransmit_stamp' was not declared. Should it be static?

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 net/ipv4/tcp_timer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/ipv4/tcp_timer.c b/net/ipv4/tcp_timer.c
index a242f88..7fdf222 100644
--- a/net/ipv4/tcp_timer.c
+++ b/net/ipv4/tcp_timer.c
@@ -22,7 +22,7 @@
 #include <linux/gfp.h>
 #include <net/tcp.h>
 
-u32 tcp_retransmit_stamp(const struct sock *sk)
+static u32 tcp_retransmit_stamp(const struct sock *sk)
 {
 	u32 start_ts = tcp_sk(sk)->retrans_stamp;

