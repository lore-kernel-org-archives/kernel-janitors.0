From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 03 Dec 2019 14:12:39 +0000
Subject: [PATCH v2] net: fix a leak in register_netdevice()
Message-Id: <20191203141239.hztnqxtsa67ramsh@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <5DE6663F.40803@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S. Miller" <davem@davemloft.net>, Jiri Pirko <jiri@mellanox.com>, walter harms <wharms@bfs.de>
Cc: Ido Schimmel <idosch@mellanox.com>, Petr Machata <petrm@mellanox.com>, Paolo Abeni <pabeni@redhat.com>, Eric Dumazet <edumazet@google.com>, Taehee Yoo <ap420073@gmail.com>, Stephen Hemminger <stephen@networkplumber.org>, Alexander Lobakin <alobakin@dlink.ru>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

We have to free "dev->name_node" on this error path.

Fixes: ff92741270bf ("net: introduce name_node struct to be used in hashlist")
Reported-by: syzbot+6e13e65ffbaa33757bcb@syzkaller.appspotmail.com
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: dev->name_node can't be NULL so we can remove the check for that
    in the cleanup code.

 net/core/dev.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/net/core/dev.c b/net/core/dev.c
index d75fd04d4e2c..c4ef4d7638ca 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -9246,7 +9246,7 @@ int register_netdevice(struct net_device *dev)
 		if (ret) {
 			if (ret > 0)
 				ret = -EIO;
-			goto out;
+			goto err_free_name;
 		}
 	}
 
@@ -9361,12 +9361,12 @@ int register_netdevice(struct net_device *dev)
 	return ret;
 
 err_uninit:
-	if (dev->name_node)
-		netdev_name_node_free(dev->name_node);
 	if (dev->netdev_ops->ndo_uninit)
 		dev->netdev_ops->ndo_uninit(dev);
 	if (dev->priv_destructor)
 		dev->priv_destructor(dev);
+err_free_name:
+	netdev_name_node_free(dev->name_node);
 	goto out;
 }
 EXPORT_SYMBOL(register_netdevice);
-- 
2.11.0
