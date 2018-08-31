From: YueHaibing <yuehaibing@huawei.com>
Date: Fri, 31 Aug 2018 03:44:27 +0000
Subject: [PATCH net-next] net: remove duplicated include from net_failover.c
Message-Id: <1535687067-23044-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S. Miller" <davem@davemloft.net>, Sridhar Samudrala <sridhar.samudrala@intel.com>, Stephen Hemminger <stephen@networkplumber.org>, Dan Carpenter <dan.carpenter@oracle.com>, Alexander Duyck <alexander.h.duyck@intel.com>, Jeff Kirsher <jeffrey.t.kirsher@intel.com>, Liran Alon <liran.alon@oracle.com>, Joao Martins <joao.m.martins@oracle.com>
Cc: YueHaibing <yuehaibing@huawei.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Remove duplicated include.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/net/net_failover.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/net_failover.c b/drivers/net/net_failover.c
index 7ae1856..192ae1c 100644
--- a/drivers/net/net_failover.c
+++ b/drivers/net/net_failover.c
@@ -19,7 +19,6 @@
 #include <linux/ethtool.h>
 #include <linux/module.h>
 #include <linux/slab.h>
-#include <linux/netdevice.h>
 #include <linux/netpoll.h>
 #include <linux/rtnetlink.h>
 #include <linux/if_vlan.h>
