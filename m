From: Mao Wenan <maowenan@huawei.com>
Date: Thu, 02 Jan 2020 14:02:27 +0000
Subject: [PATCH net-next] tcp: use REXMIT_NEW instead of magic number
Message-Id: <20200102140227.77780-1-maowenan@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: edumazet@google.com, davem@davemloft.net, kuznet@ms2.inr.ac.ru, yoshfuji@linux-ipv6.org
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

REXMIT_NEW is a macro for "FRTO-style
transmit of unsent/new packets", this patch
makes it more readable.

Signed-off-by: Mao Wenan <maowenan@huawei.com>
---
 net/ipv4/tcp_input.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
index 88b987ca9ebb..1d1e3493965f 100644
--- a/net/ipv4/tcp_input.c
+++ b/net/ipv4/tcp_input.c
@@ -3550,7 +3550,7 @@ static void tcp_xmit_recovery(struct sock *sk, int rexmit)
 	if (rexmit = REXMIT_NONE || sk->sk_state = TCP_SYN_SENT)
 		return;
 
-	if (unlikely(rexmit = 2)) {
+	if (unlikely(rexmit = REXMIT_NEW)) {
 		__tcp_push_pending_frames(sk, tcp_current_mss(sk),
 					  TCP_NAGLE_OFF);
 		if (after(tp->snd_nxt, tp->high_seq))
-- 
2.20.1
