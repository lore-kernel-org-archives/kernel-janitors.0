From: Dan Carpenter <error27@gmail.com>
Date: Thu, 22 Apr 2010 09:53:27 +0000
Subject: [patch] rtnetlink: potential ERR_PTR dereference
Message-Id: <20100422095327.GP29647@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org
Cc: Eric Dumazet <eric.dumazet@gmail.com>, Patrick McHardy <kaber@trash.net>, "Eric W. Biederman" <ebiederm@aristanetworks.com>, Mitch Williams <mitch.a.williams@intel.com>, "David S. Miller" <davem@davemloft.net>, kernel-janitors@vger.kernel.org

In the original code, if rtnl_create_link() returned an ERR_PTR then that
would get passed to rtnl_configure_link() which dereferences it.

Signed-off-by: Dan Carpenter <error27@gmail.com>
---
Found by a static checker, and compile tested only.  :/

diff --git a/net/core/rtnetlink.c b/net/core/rtnetlink.c
index 4568120..fe776c9 100644
--- a/net/core/rtnetlink.c
+++ b/net/core/rtnetlink.c
@@ -1270,10 +1270,11 @@ replay:
 			err = ops->newlink(net, dev, tb, data);
 		else
 			err = register_netdevice(dev);
-		if (err < 0 && !IS_ERR(dev)) {
+
+		if (err < 0 && !IS_ERR(dev))
 			free_netdev(dev);
+		if (err < 0)
 			goto out;
-		}
 
 		err = rtnl_configure_link(dev, ifm);
 		if (err < 0)
