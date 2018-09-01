From: YueHaibing <yuehaibing@huawei.com>
Date: Sat, 01 Sep 2018 02:56:22 +0000
Subject: [PATCH net-next] failover: Add missing check to validate 'slave_dev' in net_failover_slave_unregiste
Message-Id: <1535771205-156540-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1535687218-23169-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1535687218-23169-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S. Miller" <davem@davemloft.net>, Sridhar Samudrala <sridhar.samudrala@intel.com>, Stephen Hemminger <stephen@networkplumber.org>, Dan Carpenter <dan.carpenter@oracle.com>, Alexander Duyck <alexander.h.duyck@intel.com>, Jeff Kirsher <jeffrey.t.kirsher@intel.com>, Liran Alon <liran.alon@oracle.com>, Joao Martins <joao.m.martins@oracle.com>
Cc: YueHaibing <yuehaibing@huawei.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/net/net_failover.c: In function 'net_failover_slave_unregister':
drivers/net/net_failover.c:598:35: warning:
 variable 'primary_dev' set but not used [-Wunused-but-set-variable]

There should check the validity of 'slave_dev'.

Fixes: cfc80d9a1163 ("net: Introduce net_failover driver")
Suggested-by: Samudrala, Sridhar <sridhar.samudrala@intel.com>
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/net/net_failover.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/net_failover.c b/drivers/net/net_failover.c
index 7ae1856..af1ece8 100644
--- a/drivers/net/net_failover.c
+++ b/drivers/net/net_failover.c
@@ -602,6 +602,9 @@ static int net_failover_slave_unregister(struct net_device *slave_dev,
 	nfo_info = netdev_priv(failover_dev);
 	primary_dev = rtnl_dereference(nfo_info->primary_dev);
 	standby_dev = rtnl_dereference(nfo_info->standby_dev);
+
+	if (slave_dev != primary_dev && slave_dev != standby_dev)
+		return -ENODEV;
 
 	vlan_vids_del_by_dev(slave_dev, failover_dev);
 	dev_uc_unsync(slave_dev, failover_dev);
