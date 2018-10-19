From: YueHaibing <yuehaibing@huawei.com>
Date: Fri, 19 Oct 2018 12:51:28 +0000
Subject: [PATCH net-next] octeontx2-af: Remove set but not used variable 'block'
Message-Id: <1539953488-191102-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1539243427-25309-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1539243427-25309-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sunil Goutham <sgoutham@marvell.com>, Linu Cherian <lcherian@marvell.com>, Geetha sowjanya <gakula@marvell.com>, Jerin Jacob <jerinj@marvell.com>, "David S. Miller" <davem@davemloft.net>
Cc: YueHaibing <yuehaibing@huawei.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/net/ethernet/marvell/octeontx2/af/rvu_npa.c: In function 'rvu_npa_init':
drivers/net/ethernet/marvell/octeontx2/af/rvu_npa.c:446:20: warning:
 variable 'block' set but not used [-Wunused-but-set-variable]

It never used since introduction in
commit 7a37245ef23f ("octeontx2-af: NPA block admin queue init")

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/net/ethernet/marvell/octeontx2/af/rvu_npa.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/net/ethernet/marvell/octeontx2/af/rvu_npa.c b/drivers/net/ethernet/marvell/octeontx2/af/rvu_npa.c
index 0e43a69..7531fdc 100644
--- a/drivers/net/ethernet/marvell/octeontx2/af/rvu_npa.c
+++ b/drivers/net/ethernet/marvell/octeontx2/af/rvu_npa.c
@@ -443,15 +443,12 @@ static int npa_aq_init(struct rvu *rvu, struct rvu_block *block)
 int rvu_npa_init(struct rvu *rvu)
 {
 	struct rvu_hwinfo *hw = rvu->hw;
-	struct rvu_block *block;
 	int blkaddr, err;
 
 	blkaddr = rvu_get_blkaddr(rvu, BLKTYPE_NPA, 0);
 	if (blkaddr < 0)
 		return 0;
 
-	block = &hw->block[blkaddr];
-
 	/* Initialize admin queue */
 	err = npa_aq_init(rvu, &hw->block[blkaddr]);
 	if (err)
