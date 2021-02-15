From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 15 Feb 2021 15:56:46 +0000
Subject: [PATCH net-next] octeontx2-pf: fix an off by one bug in otx2_get_fecparam()
Message-Id: <YCqZvjAzSmJk5Ftb@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sunil Goutham <sgoutham@marvell.com>, Christina Jacob <cjacob@marvell.com>
Cc: Geetha sowjanya <gakula@marvell.com>, Subbaraya Sundeep <sbhatta@marvell.com>, hariprasad <hkelam@marvell.com>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Jesse Brandeburg <jesse.brandeburg@intel.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The "<= FEC_MAX_INDEX" comparison should be "< FEC_MAX_INDEX".

I did some cleanup in this function to hopefully make the code a bit
clearer.  There was no blank line after the declaration block.  The
closing curly brace on the fec[] declaration normally goes on a line
by itself.  And I removed the FEC_MAX_INDEX define and used
ARRAY_SIZE(fec) instead.

Fixes: d0cf9503e908 ("octeontx2-pf: ethtool fec mode support")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 .../net/ethernet/marvell/octeontx2/nic/otx2_ethtool.c    | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/marvell/octeontx2/nic/otx2_ethtool.c b/drivers/net/ethernet/marvell/octeontx2/nic/otx2_ethtool.c
index 237e5d3321d4..0eaf11107cb7 100644
--- a/drivers/net/ethernet/marvell/octeontx2/nic/otx2_ethtool.c
+++ b/drivers/net/ethernet/marvell/octeontx2/nic/otx2_ethtool.c
@@ -955,16 +955,17 @@ static int otx2_get_fecparam(struct net_device *netdev,
 		ETHTOOL_FEC_OFF,
 		ETHTOOL_FEC_BASER,
 		ETHTOOL_FEC_RS,
-		ETHTOOL_FEC_BASER | ETHTOOL_FEC_RS};
-#define FEC_MAX_INDEX 4
-	if (pfvf->linfo.fec < FEC_MAX_INDEX)
+		ETHTOOL_FEC_BASER | ETHTOOL_FEC_RS,
+	};
+
+	if (pfvf->linfo.fec < ARRAY_SIZE(fec))
 		fecparam->active_fec = fec[pfvf->linfo.fec];
 
 	rsp = otx2_get_fwdata(pfvf);
 	if (IS_ERR(rsp))
 		return PTR_ERR(rsp);
 
-	if (rsp->fwdata.supported_fec <= FEC_MAX_INDEX) {
+	if (rsp->fwdata.supported_fec < ARRAY_SIZE(fec)) {
 		if (!rsp->fwdata.supported_fec)
 			fecparam->fec = ETHTOOL_FEC_NONE;
 		else
-- 
2.30.0
