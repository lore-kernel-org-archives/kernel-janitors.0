From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 15 Dec 2015 11:06:08 +0000
Subject: [patch -mainline] sfc: fix a timeout loop
Message-Id: <20151215110608.GA10007@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Solarflare linux maintainers <linux-net-drivers@solarflare.com>
Cc: Shradha Shah <sshah@solarflare.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

We test for if "tries" is zero at the end but "tries--" is a post-op so
it will end with "tries" set to -1.  I have changed it to a pre-op
instead.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/ethernet/sfc/txc43128_phy.c b/drivers/net/ethernet/sfc/txc43128_phy.c
index 3d5ee32..194f67d 100644
--- a/drivers/net/ethernet/sfc/txc43128_phy.c
+++ b/drivers/net/ethernet/sfc/txc43128_phy.c
@@ -418,7 +418,7 @@ static void txc_reset_logic_mmd(struct efx_nic *efx, int mmd)
 
 	val |= (1 << TXC_GLCMD_LMTSWRST_LBN);
 	efx_mdio_write(efx, mmd, TXC_GLRGS_GLCMD, val);
-	while (tries--) {
+	while (--tries) {
 		val = efx_mdio_read(efx, mmd, TXC_GLRGS_GLCMD);
 		if (!(val & (1 << TXC_GLCMD_LMTSWRST_LBN)))
 			break;
