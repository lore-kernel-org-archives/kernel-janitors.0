From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 12 Jul 2012 14:46:38 +0000
Subject: [patch -next] tcp: update a call to tcp_metric_set()
Message-Id: <20120712144637.GA24202@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S. Miller" <davem@davemloft.net>
Cc: Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>, James Morris <jmorris@namei.org>, Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, Patrick McHardy <kaber@trash.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

We changed how the metrics were stored so RTAX_CWND needs to be changed
to TCP_METRIC_CWND or it leads to write past the end of the
->tcpm_vals[] array.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/net/ipv4/tcp_metrics.c b/net/ipv4/tcp_metrics.c
index 1fd83d3..c6b0f20 100644
--- a/net/ipv4/tcp_metrics.c
+++ b/net/ipv4/tcp_metrics.c
@@ -412,7 +412,8 @@ void tcp_update_metrics(struct sock *sk)
 				       max(tp->snd_cwnd >> 1, tp->snd_ssthresh));
 		if (!tcp_metric_locked(tm, TCP_METRIC_CWND)) {
 			val = tcp_metric_get(tm, TCP_METRIC_CWND);
-			tcp_metric_set(tm, RTAX_CWND, (val + tp->snd_cwnd) >> 1);
+			tcp_metric_set(tm, TCP_METRIC_CWND,
+				       (val + tp->snd_cwnd) >> 1);
 		}
 	} else {
 		/* Else slow start did not finish, cwnd is non-sense,
