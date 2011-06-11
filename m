From: Dan Carpenter <error27@gmail.com>
Date: Sat, 11 Jun 2011 15:50:47 +0000
Subject: [patch] netpoll: call dev_put() on error in netpoll_setup()
Message-Id: <20110611155047.GA3583@shale.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: WANG Cong <amwang@redhat.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, Neil Horman <nhorman@tuxdriver.com>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <eric.dumazet@gmail.com>, "open list:NETWORKING [GENERAL]" <netdev@vger.kernel.org>, kernel-janitors@vger.kernel.org

There is a dev_put(ndev) missing on an error path.  This was
introduced in 0c1ad04aecb "netpoll: prevent netpoll setup on slave
devices".

Signed-off-by: Dan Carpenter <error27@gmail.com>
---
This is a static checker bug, and it's possible I've misunderstood
something.

diff --git a/net/core/netpoll.c b/net/core/netpoll.c
index 42ea4b0..18d9cbd 100644
--- a/net/core/netpoll.c
+++ b/net/core/netpoll.c
@@ -795,7 +795,8 @@ int netpoll_setup(struct netpoll *np)
 	if (ndev->master) {
 		printk(KERN_ERR "%s: %s is a slave device, aborting.\n",
 		       np->name, np->dev_name);
-		return -EBUSY;
+		err = -EBUSY;
+		goto put;
 	}
 
 	if (!netif_running(ndev)) {
