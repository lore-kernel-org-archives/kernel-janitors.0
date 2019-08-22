From: Markus Elfring <Markus.Elfring@web.de>
Date: Thu, 22 Aug 2019 16:08:48 +0000
Subject: =?UTF-8?Q?=5bPATCH=5d_net/core/skmsg=3a_Delete_an_unnecessary_check?= =?UTF-8?Q?_before_the_function
Message-Id: <2755f638-7846-91f2-74f4-61031f3e34c8@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org, bpf@vger.kernel.org, Daniel Borkmann <daniel@iogearbox.net>, "David S. Miller" <davem@davemloft.net>, John Fastabend <john.fastabend@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 22 Aug 2019 18:00:40 +0200

The consume_skb() function performs also input parameter validation.
Thus the test around the call is not needed.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 net/core/skmsg.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/net/core/skmsg.c b/net/core/skmsg.c
index 6832eeb4b785..cf390e0aa73d 100644
--- a/net/core/skmsg.c
+++ b/net/core/skmsg.c
@@ -190,8 +190,7 @@ static int __sk_msg_free(struct sock *sk, struct sk_msg *msg, u32 i,
 		sk_msg_check_to_free(msg, i, msg->sg.size);
 		sge = sk_msg_elem(msg, i);
 	}
-	if (msg->skb)
-		consume_skb(msg->skb);
+	consume_skb(msg->skb);
 	sk_msg_init(msg);
 	return freed;
 }
--
2.23.0
