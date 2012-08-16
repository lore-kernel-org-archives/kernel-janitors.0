From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 16 Aug 2012 13:15:02 +0000
Subject: [patch] ipv6: move dereference after check in fl_free()
Message-Id: <20120816131502.GB23188@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Eric W. Biederman" <ebiederm@xmission.com>
Cc: "David S. Miller" <davem@davemloft.net>, Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>, James Morris <jmorris@namei.org>, Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, Patrick McHardy <kaber@trash.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

There is a dereference before checking for NULL bug here.  Generally
free() functions should accept NULL pointers.  For example, fl_create()
can pass a NULL pointer to fl_free() on the error path.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Only needed on linux-next.

diff --git a/net/ipv6/ip6_flowlabel.c b/net/ipv6/ip6_flowlabel.c
index c836a6a..90bbefb 100644
--- a/net/ipv6/ip6_flowlabel.c
+++ b/net/ipv6/ip6_flowlabel.c
@@ -91,12 +91,9 @@ static struct ip6_flowlabel *fl_lookup(struct net *net, __be32 label)
 
 static void fl_free(struct ip6_flowlabel *fl)
 {
-	switch (fl->share) {
-	case IPV6_FL_S_PROCESS:
-		put_pid(fl->owner.pid);
-		break;
-	}
 	if (fl) {
+		if (fl->share = IPV6_FL_S_PROCESS)
+			put_pid(fl->owner.pid);
 		release_net(fl->fl_net);
 		kfree(fl->opt);
 	}
