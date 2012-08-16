From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 16 Aug 2012 13:14:04 +0000
Subject: [patch] gre: information leak in ip6_tnl_ioctl()
Message-Id: <20120816131404.GA23188@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: xeb@mail.ru
Cc: "David S. Miller" <davem@davemloft.net>, Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>, James Morris <jmorris@namei.org>, Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, Patrick McHardy <kaber@trash.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

There is a one byte hole between p->hop_limit and p->flowinfo where
stack memory is leaked to the user.  This was introduced in c12b395a46
"gre: Support GRE over IPv6".

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
This is only needed in linux-next.

diff --git a/net/ipv6/ip6_tunnel.c b/net/ipv6/ip6_tunnel.c
index 33d2a0e..cb7e2de 100644
--- a/net/ipv6/ip6_tunnel.c
+++ b/net/ipv6/ip6_tunnel.c
@@ -1312,6 +1312,8 @@ ip6_tnl_ioctl(struct net_device *dev, struct ifreq *ifr, int cmd)
 			}
 			ip6_tnl_parm_from_user(&p1, &p);
 			t = ip6_tnl_locate(net, &p1, 0);
+		} else {
+			memset(&p, 0, sizeof(p));
 		}
 		if (t = NULL)
 			t = netdev_priv(dev);
