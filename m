From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 18 Jun 2016 08:50:39 +0000
Subject: [patch 3/3 -mainline] liquidio: off by one in liquidio_set_mcast_list()
Message-Id: <20160618085038.GF21713@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Derek Chickles <derek.chickles@caviumnetworks.com>
Cc: Satanand Burla <satananda.burla@caviumnetworks.com>, Felix Manlunas <felix.manlunas@caviumnetworks.com>, Raghu Vatsavayi <raghu.vatsavayi@caviumnetworks.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

The nctrl.udd[] array has 32 elements of size u64.

Imagine that netdev_mc_count() returns more than 32.  That means
"mc_count" is 32.  On the last iteration through the loop we have
mc = &nctrl.udd[32] so we're writing one element beyond the end
of the array.

Fixes: f21fb3ed364b ('Add support of Cavium Liquidio ethernet adapters')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/ethernet/cavium/liquidio/lio_main.c b/drivers/net/ethernet/cavium/liquidio/lio_main.c
index 1126422..41ee8bd 100644
--- a/drivers/net/ethernet/cavium/liquidio/lio_main.c
+++ b/drivers/net/ethernet/cavium/liquidio/lio_main.c
@@ -2376,7 +2376,7 @@ static void liquidio_set_mcast_list(struct net_device *netdev)
 		memcpy(((u8 *)mc) + 2, ha->addr, ETH_ALEN);
 		/* no need to swap bytes */
 
-		if (++mc > &nctrl.udd[mc_count])
+		if (++mc >= &nctrl.udd[mc_count])
 			break;
 	}
 
