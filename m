From: Markus Elfring <Markus.Elfring@web.de>
Date: Thu, 22 Aug 2019 16:32:14 +0000
Subject: =?UTF-8?Q?=5bPATCH=5d_net/ipv4/tcp=5fbpf=3a_Delete_an_unnecessary_c?= =?UTF-8?Q?heck_before_the_func
Message-Id: <25ca9c48-1ac9-daa1-8472-0a53e4beed6a@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org, bpf@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>, Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>, Daniel Borkmann <daniel@iogearbox.net>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Hideaki Yoshifuji <yoshfuji@linux-ipv6.org>, John Fastabend <john.fastabend@gmail.com>, Martin KaFai Lau <kafai@fb.com>, Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 22 Aug 2019 18:20:42 +0200

The consume_skb() function performs also input parameter validation.
Thus the test around the call is not needed.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 net/ipv4/tcp_bpf.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/net/ipv4/tcp_bpf.c b/net/ipv4/tcp_bpf.c
index 8a56e09cfb0e..4ae18bd431a0 100644
--- a/net/ipv4/tcp_bpf.c
+++ b/net/ipv4/tcp_bpf.c
@@ -103,8 +103,7 @@ int __tcp_bpf_recvmsg(struct sock *sk, struct sk_psock *psock,
 		msg_rx->sg.start = i;
 		if (!sge->length && msg_rx->sg.start == msg_rx->sg.end) {
 			list_del(&msg_rx->list);
-			if (msg_rx->skb)
-				consume_skb(msg_rx->skb);
+			consume_skb(msg_rx->skb);
 			kfree(msg_rx);
 		}
 		msg_rx = list_first_entry_or_null(&psock->ingress_msg,
--
2.23.0
