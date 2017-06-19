From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 19 Jun 2017 10:56:05 +0000
Subject: [PATCH] phy: brcm-sata: fix a timeout test in init
Message-Id: <20170619105251.GA23911@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: Vivek Gautam <vivek.gautam@codeaurora.org>, Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>, Heiko Stuebner <heiko@sntech.de>, Florian Fainelli <f.fainelli@gmail.com>, Axel Lin <axel.lin@ingics.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

We want to timeout with try set to zero so this should be a pre-op
instead of post-op.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/phy/broadcom/phy-brcm-sata.c b/drivers/phy/broadcom/phy-brcm-sata.c
index ccbc3d994998..48fb016ce689 100644
--- a/drivers/phy/broadcom/phy-brcm-sata.c
+++ b/drivers/phy/broadcom/phy-brcm-sata.c
@@ -329,7 +329,7 @@ static int brcm_nsp_sata_init(struct brcm_sata_port *port)
 
 	/* Wait for pll_seq_done bit */
 	try = 50;
-	while (try--) {
+	while (--try) {
 		val = brcm_sata_phy_rd(base, BLOCK0_REG_BANK,
 					BLOCK0_XGXSSTATUS);
 		if (val & BLOCK0_XGXSSTATUS_PLL_LOCK)
