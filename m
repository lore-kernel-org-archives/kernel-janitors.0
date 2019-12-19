From: Mao Wenan <maowenan@huawei.com>
Date: Thu, 19 Dec 2019 01:33:44 +0000
Subject: [PATCH net] af_packet: refactoring code for prb_calc_retire_blk_tmo
Message-Id: <20191219013344.34603-1-maowenan@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: davem@davemloft.net, maowenan@huawei.com, edumazet@google.com, willemb@google.com, maximmi@mellanox.com, pabeni@redhat.com, yuehaibing@huawei.com, nhorman@tuxdriver.com
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

If __ethtool_get_link_ksettings() is failed and with
non-zero value, prb_calc_retire_blk_tmo() should return
DEFAULT_PRB_RETIRE_TOV firstly. Refactoring code and make
it more readable.

Fixes: b43d1f9f7067 ("af_packet: set defaule value for tmo")
Signed-off-by: Mao Wenan <maowenan@huawei.com>
---
 net/packet/af_packet.c | 26 +++++++++++---------------
 1 file changed, 11 insertions(+), 15 deletions(-)

diff --git a/net/packet/af_packet.c b/net/packet/af_packet.c
index 118cd66..843ebf8 100644
--- a/net/packet/af_packet.c
+++ b/net/packet/af_packet.c
@@ -520,7 +520,7 @@ static int prb_calc_retire_blk_tmo(struct packet_sock *po,
 				int blk_size_in_bytes)
 {
 	struct net_device *dev;
-	unsigned int mbits = 0, msec = 0, div = 0, tmo = 0;
+	unsigned int mbits = 0, msec = 1, div = 0, tmo = 0;
 	struct ethtool_link_ksettings ecmd;
 	int err;
 
@@ -532,21 +532,17 @@ static int prb_calc_retire_blk_tmo(struct packet_sock *po,
 	}
 	err = __ethtool_get_link_ksettings(dev, &ecmd);
 	rtnl_unlock();
-	if (!err) {
-		/*
-		 * If the link speed is so slow you don't really
-		 * need to worry about perf anyways
-		 */
-		if (ecmd.base.speed < SPEED_1000 ||
-		    ecmd.base.speed = SPEED_UNKNOWN) {
-			return DEFAULT_PRB_RETIRE_TOV;
-		} else {
-			msec = 1;
-			div = ecmd.base.speed / 1000;
-		}
-	} else
+	if (err)
+		return DEFAULT_PRB_RETIRE_TOV;
+
+	/* If the link speed is so slow you don't really
+	 * need to worry about perf anyways
+	 */
+	if (ecmd.base.speed < SPEED_1000 ||
+	    ecmd.base.speed = SPEED_UNKNOWN)
 		return DEFAULT_PRB_RETIRE_TOV;
 
+	div = ecmd.base.speed / 1000;
 	mbits = (blk_size_in_bytes * 8) / (1024 * 1024);
 
 	if (div)
@@ -555,7 +551,7 @@ static int prb_calc_retire_blk_tmo(struct packet_sock *po,
 	tmo = mbits * msec;
 
 	if (div)
-		return tmo+1;
+		return tmo + 1;
 	return tmo;
 }
 
-- 
2.7.4
