From: Colin King <colin.king@canonical.com>
Date: Fri, 22 Dec 2017 01:01:35 +0000
Subject: [PATCH] tcp: make function tcp_recv_timestamp static
Message-Id: <20171222010135.12204-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S . Miller" <davem@davemloft.net>, Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>, Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The function tcp_recv_timestamp is local to the source and does not
need to be in global scope, so make it static.

Cleans up sparse warning:
symbol 'tcp_recv_timestamp' was not declared. Should it be static?

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 net/ipv4/tcp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/ipv4/tcp.c b/net/ipv4/tcp.c
index ca042cdf8496..3d93ae649bbd 100644
--- a/net/ipv4/tcp.c
+++ b/net/ipv4/tcp.c
@@ -1729,7 +1729,7 @@ static void tcp_update_recv_tstamps(struct sk_buff *skb,
 }
 
 /* Similar to __sock_recv_timestamp, but does not require an skb */
-void tcp_recv_timestamp(struct msghdr *msg, const struct sock *sk,
+static void tcp_recv_timestamp(struct msghdr *msg, const struct sock *sk,
 			       struct scm_timestamping *tss)
 {
 	struct timeval tv;
-- 
2.14.1

