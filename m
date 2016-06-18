From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 18 Jun 2016 08:49:20 +0000
Subject: [patch 1/3 -next] liquidio: a couple indenting tweaks
Message-Id: <20160618084920.GD21713@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Derek Chickles <derek.chickles@caviumnetworks.com>
Cc: Satanand Burla <satananda.burla@caviumnetworks.com>, Felix Manlunas <felix.manlunas@caviumnetworks.com>, Raghu Vatsavayi <raghu.vatsavayi@caviumnetworks.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Remove a stray space character and fix an if statement that wasn't
indented.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Speaking of style issues, this whole file follows return 1 on error
and 0 on success.  It was confusing for me.  It's not too late to change
it to use correct error codes.  ;)

diff --git a/drivers/net/ethernet/cavium/liquidio/lio_main.c b/drivers/net/ethernet/cavium/liquidio/lio_main.c
index d0ab97c..715ddfa 100644
--- a/drivers/net/ethernet/cavium/liquidio/lio_main.c
+++ b/drivers/net/ethernet/cavium/liquidio/lio_main.c
@@ -365,7 +365,7 @@ static int wait_for_pending_requests(struct octeon_device *oct)
 				[OCTEON_ORDERED_SC_LIST].pending_req_count);
 		if (pcount)
 			schedule_timeout_uninterruptible(HZ / 10);
-		 else
+		else
 			break;
 	}
 
@@ -3351,8 +3351,8 @@ static int setup_nic_devices(struct octeon_device *octeon_dev)
 		liquidio_set_ethtool_ops(netdev);
 
 		if (netdev->features & NETIF_F_LRO)
-		liquidio_set_feature(netdev, OCTNET_CMD_LRO_ENABLE,
-				     OCTNIC_LROIPV4 | OCTNIC_LROIPV6);
+			liquidio_set_feature(netdev, OCTNET_CMD_LRO_ENABLE,
+					     OCTNIC_LROIPV4 | OCTNIC_LROIPV6);
 
 		if ((debug != -1) && (debug & NETIF_MSG_HW))
 			liquidio_set_feature(netdev, OCTNET_CMD_VERBOSE_ENABLE,
