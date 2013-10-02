From: Peter Senna Tschudin <peter.senna@gmail.com>
Date: Wed, 02 Oct 2013 12:19:51 +0000
Subject: [PATCH 19/19 v2] net: ipv4: Change variable type to bool
Message-Id: <1380716391-20214-4-git-send-email-peter.senna@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1380716391-20214-1-git-send-email-peter.senna@gmail.com>
In-Reply-To: <1380716391-20214-1-git-send-email-peter.senna@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: davem@davemloft.net
Cc: kuznet@ms2.inr.ac.ru, jmorris@namei.org, kaber@trash.net, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Peter Senna Tschudin <peter.senna@gmail.com>

The variable fully_acked is only assigned the values true and false.
Change its type to bool.

The simplified semantic patch that find this problem is as
follows (http://coccinelle.lip6.fr/):

@exists@
type T;
identifier b;
@@
- T
+ bool
  b = ...;
  ... when any
  b = \(true\|false\)

Signed-off-by: Peter Senna Tschudin <peter.senna@gmail.com>
---
Changes from v1:
 - Added subsystem prefix to shortlog

 net/ipv4/tcp_input.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
index 25a89ea..fa17dce 100644
--- a/net/ipv4/tcp_input.c
+++ b/net/ipv4/tcp_input.c
@@ -2970,7 +2970,7 @@ static int tcp_clean_rtx_queue(struct sock *sk, int prior_fackets,
 	const struct inet_connection_sock *icsk = inet_csk(sk);
 	struct sk_buff *skb;
 	u32 now = tcp_time_stamp;
-	int fully_acked = true;
+	bool fully_acked = true;
 	int flag = 0;
 	u32 pkts_acked = 0;
 	u32 reord = tp->packets_out;
-- 
1.8.3.1

