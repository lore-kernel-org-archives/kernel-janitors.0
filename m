From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 18 Jun 2016 08:49:45 +0000
Subject: [patch 2/3] liquidio: remove an unused variable
Message-Id: <20160618084945.GE21713@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Derek Chickles <derek.chickles@caviumnetworks.com>
Cc: Satanand Burla <satananda.burla@caviumnetworks.com>, Felix Manlunas <felix.manlunas@caviumnetworks.com>, Raghu Vatsavayi <raghu.vatsavayi@caviumnetworks.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

We don't use "i" in this function.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/ethernet/cavium/liquidio/lio_main.c b/drivers/net/ethernet/cavium/liquidio/lio_main.c
index 715ddfa..1126422 100644
--- a/drivers/net/ethernet/cavium/liquidio/lio_main.c
+++ b/drivers/net/ethernet/cavium/liquidio/lio_main.c
@@ -2354,7 +2354,7 @@ static void liquidio_set_mcast_list(struct net_device *netdev)
 	struct octnic_ctrl_pkt nctrl;
 	struct netdev_hw_addr *ha;
 	u64 *mc;
-	int ret, i;
+	int ret;
 	int mc_count = min(netdev_mc_count(netdev), MAX_OCTEON_MULTICAST_ADDR);
 
 	memset(&nctrl, 0, sizeof(struct octnic_ctrl_pkt));
@@ -2370,7 +2370,6 @@ static void liquidio_set_mcast_list(struct net_device *netdev)
 	nctrl.cb_fn = liquidio_link_ctrl_cmd_completion;
 
 	/* copy all the addresses into the udd */
-	i = 0;
 	mc = &nctrl.udd[0];
 	netdev_for_each_mc_addr(ha, netdev) {
 		*mc = 0;
