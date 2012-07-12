From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 12 Jul 2012 14:47:03 +0000
Subject: [patch] qlge: fix an "&&" vs "||" bug
Message-Id: <20120712144702.GB24202@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Anirban Chakraborty <anirban.chakraborty@qlogic.com>
Cc: Jitendra Kalsaria <jitendra.kalsaria@qlogic.com>, Ron Mercer <ron.mercer@qlogic.com>, linux-driver@qlogic.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

The condition is always true so WOL will never work.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/ethernet/qlogic/qlge/qlge_ethtool.c b/drivers/net/ethernet/qlogic/qlge/qlge_ethtool.c
index 3d4462b..6f316ab 100644
--- a/drivers/net/ethernet/qlogic/qlge/qlge_ethtool.c
+++ b/drivers/net/ethernet/qlogic/qlge/qlge_ethtool.c
@@ -440,7 +440,7 @@ static int ql_set_wol(struct net_device *ndev, struct ethtool_wolinfo *wol)
 	unsigned short ssys_dev = qdev->pdev->subsystem_device;
 
 	/* WOL is only supported for mezz card. */
-	if (ssys_dev != QLGE_MEZZ_SSYS_ID_068 ||
+	if (ssys_dev != QLGE_MEZZ_SSYS_ID_068 &&
 			ssys_dev != QLGE_MEZZ_SSYS_ID_180) {
 		netif_info(qdev, drv, qdev->ndev,
 				"WOL is only supported for mezz card\n");
