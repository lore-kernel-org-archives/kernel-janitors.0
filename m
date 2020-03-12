From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 12 Mar 2020 11:30:48 +0000
Subject: [PATCH] octeontx2-pf: unlock on error path in otx2_config_pause_frm()
Message-Id: <20200312113048.GB20562@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sunil Goutham <sgoutham@marvell.com>, Geetha sowjanya <gakula@marvell.com>
Cc: Subbaraya Sundeep <sbhatta@marvell.com>, hariprasad <hkelam@marvell.com>, "David S. Miller" <davem@davemloft.net>, Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

We need to unlock before returning if this allocation fails.

Fixes: 75f36270990c ("octeontx2-pf: Support to enable/disable pause frames via ethtool")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/net/ethernet/marvell/octeontx2/nic/otx2_common.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/marvell/octeontx2/nic/otx2_common.c b/drivers/net/ethernet/marvell/octeontx2/nic/otx2_common.c
index af4437d4dfcb..157735443473 100644
--- a/drivers/net/ethernet/marvell/octeontx2/nic/otx2_common.c
+++ b/drivers/net/ethernet/marvell/octeontx2/nic/otx2_common.c
@@ -227,14 +227,17 @@ int otx2_config_pause_frm(struct otx2_nic *pfvf)
 
 	otx2_mbox_lock(&pfvf->mbox);
 	req = otx2_mbox_alloc_msg_cgx_cfg_pause_frm(&pfvf->mbox);
-	if (!req)
-		return -ENOMEM;
+	if (!req) {
+		err = -ENOMEM;
+		goto unlock;
+	}
 
 	req->rx_pause = !!(pfvf->flags & OTX2_FLAG_RX_PAUSE_ENABLED);
 	req->tx_pause = !!(pfvf->flags & OTX2_FLAG_TX_PAUSE_ENABLED);
 	req->set = 1;
 
 	err = otx2_sync_mbox_msg(&pfvf->mbox);
+unlock:
 	otx2_mbox_unlock(&pfvf->mbox);
 	return err;
 }
-- 
2.20.1
