From: Colin King <colin.king@canonical.com>
Date: Mon, 21 Sep 2020 21:15:55 +0000
Subject: [PATCH][V2][next] PCI: brcmstb: fix a missing if statement on a return error check
Message-Id: <20200921211555.383458-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Florian Fainelli <f.fainelli@gmail.com>, bcm-kernel-feedback-list@broadcom.com, Jim Quinlan <jquinlan@broadcom.com>, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The error return ret is not being check with an if statement and
currently the code always returns leaving the following code as
dead code. Fix this by adding in the missing if statement and
clean up with the clk_disable_unprepare call.

Kudos to Florian Fainelli for noting that the clock needed disabling.

Addresses-Coverity: ("Structurally dead code")
Fixes: ad3d29c77e1e ("PCI: brcmstb: Add control of rescal reset")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---

V2: disable clock as noted by Florian Fainelli and suggested by
    Jim Quinlan.
---
 drivers/pci/controller/pcie-brcmstb.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/controller/pcie-brcmstb.c
index 7a3ff4632e7c..25f46f87b36f 100644
--- a/drivers/pci/controller/pcie-brcmstb.c
+++ b/drivers/pci/controller/pcie-brcmstb.c
@@ -1154,7 +1154,10 @@ static int brcm_pcie_resume(struct device *dev)
 	clk_prepare_enable(pcie->clk);
 
 	ret = brcm_phy_start(pcie);
+	if (ret) {
+		clk_disable_unprepare(pcie->clk);
 		return ret;
+	}
 
 	/* Take bridge out of reset so we can access the SERDES reg */
 	pcie->bridge_sw_init_set(pcie, 0);
-- 
2.27.0
