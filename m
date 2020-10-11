From: Julia Lawall <Julia.Lawall@inria.fr>
Date: Sun, 11 Oct 2020 10:34:56 +0000
Subject: [PATCH 3/5] tcp: use semicolons rather than commas to separate statements
Message-Id: <1602412498-32025-4-git-send-email-Julia.Lawall@inria.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1602412498-32025-1-git-send-email-Julia.Lawall@inria.fr>
In-Reply-To: <1602412498-32025-1-git-send-email-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Eric Dumazet <edumazet@google.com>
Cc: =?UTF-8?q?Valdis=20Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>, Joe Perches <joe@perches.com>, Thomas Gleixner <tglx@linutronix.de>, kernel-janitors@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>, Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

Replace commas with semicolons.  Commas introduce unnecessary
variability in the code structure and are hard to see.  What is done
is essentially described by the following Coccinelle semantic patch
(http://coccinelle.lip6.fr/):

// <smpl>
@@ expression e1,e2; @@
e1
-,
+;
e2
... when any
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 net/ipv4/tcp_input.c |    3 ++-
 net/ipv4/tcp_vegas.c |    8 ++++----
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
index 02d0e2fb77c0..7ff9be52c061 100644
--- a/net/ipv4/tcp_input.c
+++ b/net/ipv4/tcp_input.c
@@ -4418,7 +4418,8 @@ static void tcp_sack_maybe_coalesce(struct tcp_sock *tp)
 				sp[i] = sp[i + 1];
 			continue;
 		}
-		this_sack++, swalk++;
+		this_sack++;
+		swalk++;
 	}
 }
 
diff --git a/net/ipv4/tcp_vegas.c b/net/ipv4/tcp_vegas.c
index 3f51e781562a..c8003c8aad2c 100644
--- a/net/ipv4/tcp_vegas.c
+++ b/net/ipv4/tcp_vegas.c
@@ -293,10 +293,10 @@ size_t tcp_vegas_get_info(struct sock *sk, u32 ext, int *attr,
 	const struct vegas *ca = inet_csk_ca(sk);
 
 	if (ext & (1 << (INET_DIAG_VEGASINFO - 1))) {
-		info->vegas.tcpv_enabled = ca->doing_vegas_now,
-		info->vegas.tcpv_rttcnt = ca->cntRTT,
-		info->vegas.tcpv_rtt = ca->baseRTT,
-		info->vegas.tcpv_minrtt = ca->minRTT,
+		info->vegas.tcpv_enabled = ca->doing_vegas_now;
+		info->vegas.tcpv_rttcnt = ca->cntRTT;
+		info->vegas.tcpv_rtt = ca->baseRTT;
+		info->vegas.tcpv_minrtt = ca->minRTT;
 
 		*attr = INET_DIAG_VEGASINFO;
 		return sizeof(struct tcpvegas_info);
