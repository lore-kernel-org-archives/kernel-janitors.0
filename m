From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 31 Jan 2020 05:02:41 +0000
Subject: [PATCH net] octeontx2-pf: Fix an IS_ERR() vs NULL bug
Message-Id: <20200131050241.aoqatlxubobkmi4y@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sunil Goutham <sgoutham@marvell.com>
Cc: Geetha sowjanya <gakula@marvell.com>, Subbaraya Sundeep <sbhatta@marvell.com>, hariprasad <hkelam@marvell.com>, "David S. Miller" <davem@davemloft.net>, Tomasz Duszynski <tduszynski@marvell.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

The otx2_mbox_get_rsp() function never returns NULL, it returns error
pointers on error.

Fixes: 34bfe0ebedb7 ("octeontx2-pf: MTU, MAC and RX mode config support")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/net/ethernet/marvell/octeontx2/nic/otx2_common.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/marvell/octeontx2/nic/otx2_common.c b/drivers/net/ethernet/marvell/octeontx2/nic/otx2_common.c
index 8247d21d0432..b945bd3d5d88 100644
--- a/drivers/net/ethernet/marvell/octeontx2/nic/otx2_common.c
+++ b/drivers/net/ethernet/marvell/octeontx2/nic/otx2_common.c
@@ -171,9 +171,9 @@ static int otx2_hw_get_mac_addr(struct otx2_nic *pfvf,
 	}
 
 	msghdr = otx2_mbox_get_rsp(&pfvf->mbox.mbox, 0, &req->hdr);
-	if (!msghdr) {
+	if (IS_ERR(msghdr)) {
 		otx2_mbox_unlock(&pfvf->mbox);
-		return -ENOMEM;
+		return PTR_ERR(msghdr);
 	}
 	rsp = (struct nix_get_mac_addr_rsp *)msghdr;
 	ether_addr_copy(netdev->dev_addr, rsp->mac_addr);
-- 
2.11.0
