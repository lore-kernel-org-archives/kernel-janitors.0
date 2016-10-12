From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 12 Oct 2016 10:54:09 +0000
Subject: [patch] PCI: rockchip: Indent an if statement
Message-Id: <20161012105409.GA19070@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: Wenrui Li <wenrui.li@rock-chips.com>, Bjorn Helgaas <bhelgaas@google.com>, Heiko Stuebner <heiko@sntech.de>, linux-pci@vger.kernel.org, linux-rockchip@lists.infradead.org, kernel-janitors@vger.kernel.org

The if statement wasn't intended.  Add a tab.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/pci/host/pcie-rockchip.c b/drivers/pci/host/pcie-rockchip.c
index b8c82fc..f54ef1e 100644
--- a/drivers/pci/host/pcie-rockchip.c
+++ b/drivers/pci/host/pcie-rockchip.c
@@ -972,7 +972,7 @@ static int rockchip_pcie_prog_ob_atu(struct rockchip_pcie *rockchip,
 		return -EINVAL;
 	if (region_no = 0) {
 		if (AXI_REGION_0_SIZE < (2ULL << num_pass_bits))
-		return -EINVAL;
+			return -EINVAL;
 	}
 	if (region_no != 0) {
 		if (AXI_REGION_SIZE < (2ULL << num_pass_bits))
