From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 15 Dec 2011 11:05:10 +0000
Subject: [patch -next] tcp_memcontrol: fix reversed if condition
Message-Id: <20111215110510.GA2674@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Glauber Costa <glommer@parallels.com>
Cc: "David S. Miller" <davem@davemloft.net>, Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>, James Morris <jmorris@namei.org>, Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, Patrick McHardy <kaber@trash.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

We should only dereference the pointer if it's valid, not the other way
round.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/net/ipv4/tcp_memcontrol.c b/net/ipv4/tcp_memcontrol.c
index 171d7b6..7fed04f 100644
--- a/net/ipv4/tcp_memcontrol.c
+++ b/net/ipv4/tcp_memcontrol.c
@@ -44,7 +44,7 @@ static inline struct tcp_memcontrol *tcp_from_cgproto(struct cg_proto *cg_proto)
 
 static void memcg_tcp_enter_memory_pressure(struct sock *sk)
 {
-	if (!sk->sk_cgrp->memory_pressure)
+	if (sk->sk_cgrp->memory_pressure)
 		*sk->sk_cgrp->memory_pressure = 1;
 }
 EXPORT_SYMBOL(memcg_tcp_enter_memory_pressure);
