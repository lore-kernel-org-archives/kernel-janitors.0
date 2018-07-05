From: Colin King <colin.king@canonical.com>
Date: Thu, 05 Jul 2018 09:37:32 +0000
Subject: [PATCH] net: ethernet: sun: remove redundant variables adv and lpa
Message-Id: <20180705093732.21650-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Variables adv and lpa are being assigned but are never used hence they
are redundant and can be removed.

Cleans up clang warnings:
warning: variable 'lpa' set but not used [-Wunused-but-set-variable]
warning: variable 'adv' set but not used [-Wunused-but-set-variable]

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/sun/niu.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/net/ethernet/sun/niu.c b/drivers/net/ethernet/sun/niu.c
index 88c12474a0c3..2d6b62c6d9ab 100644
--- a/drivers/net/ethernet/sun/niu.c
+++ b/drivers/net/ethernet/sun/niu.c
@@ -1225,17 +1225,13 @@ static int link_status_1g_rgmii(struct niu *np, int *link_up_p)
 
 	bmsr = err;
 	if (bmsr & BMSR_LSTATUS) {
-		u16 adv, lpa;
-
 		err = mii_read(np, np->phy_addr, MII_ADVERTISE);
 		if (err < 0)
 			goto out;
-		adv = err;
 
 		err = mii_read(np, np->phy_addr, MII_LPA);
 		if (err < 0)
 			goto out;
-		lpa = err;
 
 		err = mii_read(np, np->phy_addr, MII_ESTATUS);
 		if (err < 0)
-- 
2.17.1

