From: Andrey Utkin <andrey.krieger.utkin@gmail.com>
Date: Sat, 05 Jul 2014 04:28:14 +0000
Subject: [PATCH] appletalk: Set skb with destructor
Message-Id: <1404534494-6253-1-git-send-email-andrey.krieger.utkin@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, acme@ghostprotocols.net
Cc: Andrey Utkin <andrey.krieger.utkin@gmail.com>

See https://bugzilla.kernel.org/show_bug.cgi?idy441
---8<---
Made changes similar to 0ae89beb283a0db5980d1d4781c7d7be2f2810d6

Reported-by: Ed Martin <edman007@edman007.com>
Signed-off-by: Andrey Utkin <andrey.krieger.utkin@gmail.com>
---
 net/appletalk/ddp.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/net/appletalk/ddp.c b/net/appletalk/ddp.c
index 01a1082..3d8ab34 100644
--- a/net/appletalk/ddp.c
+++ b/net/appletalk/ddp.c
@@ -1399,6 +1399,11 @@ drop:
 	return NET_RX_DROP;
 }
 
+static inline void atalk_skb_destructor(struct sk_buff *skb)
+{
+	sock_put(skb->sk);
+}
+
 /**
  *	atalk_rcv - Receive a packet (in skb) from device dev
  *	@skb - packet received
@@ -1489,6 +1494,8 @@ static int atalk_rcv(struct sk_buff *skb, struct net_device *dev,
 		goto drop;
 
 	/* Queue packet (standard) */
+	sock_hold(sock);
+	skb->destructor = atalk_skb_destructor;
 	skb->sk = sock;
 
 	if (sock_queue_rcv_skb(sock, skb) < 0)
@@ -1644,6 +1651,8 @@ static int atalk_sendmsg(struct kiocb *iocb, struct socket *sock, struct msghdr
 	if (!skb)
 		goto out;
 
+	sock_hold(sk);
+	skb->destructor = atalk_skb_destructor;
 	skb->sk = sk;
 	skb_reserve(skb, ddp_dl->header_length);
 	skb_reserve(skb, dev->hard_header_len);
-- 
1.8.3.2

