From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 18 May 2017 07:42:59 +0000
Subject: [PATCH] phy: phy-brcm-sata: Fix a loop timeout
Message-Id: <20170518074258.ywzdmtuxjxykabs2@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kishon Vijay Abraham I <kishon@ti.com>, Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>
Cc: Vivek Gautam <vivek.gautam@codeaurora.org>, Krzysztof Kozlowski <krzk@kernel.org>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Florian Fainelli <f.fainelli@gmail.com>, Axel Lin <axel.lin@ingics.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

We expect to timeout with "try" set to zero but it's a post-op so
actually it ends with it set to -1.  I've fixed this by changing it to a
pre-op.

Fixes: 024812889ad1 ("phy: Add SATA3 PHY support for Broadcom NSP SoC")
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
