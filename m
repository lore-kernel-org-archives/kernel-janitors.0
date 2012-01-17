From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 17 Jan 2012 20:48:43 +0000
Subject: [patch] inetpeer: initialize ->redirect_genid in inet_getpeer()
Message-Id: <20120117204843.GA20999@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Eric Dumazet <eric.dumazet@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>, James Morris <jmorris@namei.org>, Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, Patrick McHardy <kaber@trash.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

kmemcheck complains that ->redirect_genid doesn't get initialized.
Presumably it should be set to zero.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/net/ipv4/inetpeer.c b/net/ipv4/inetpeer.c
index 86f13c67..49ce5f4 100644
--- a/net/ipv4/inetpeer.c
+++ b/net/ipv4/inetpeer.c
@@ -447,6 +447,7 @@ relookup:
 		p->rate_last = 0;
 		p->pmtu_expires = 0;
 		p->pmtu_orig = 0;
+		p->redirect_genid = 0;
 		memset(&p->redirect_learned, 0, sizeof(p->redirect_learned));
 
 
