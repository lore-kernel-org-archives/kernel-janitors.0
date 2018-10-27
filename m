From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 27 Oct 2018 18:31:19 +0000
Subject: [PATCH] PCI: histb: constify dw_pcie_host_ops structure
Message-Id: <1540665079-27788-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jianguo Sun <sunjianguo1@huawei.com>
Cc: kernel-janitors@vger.kernel.org, Shawn Guo <shawn.guo@linaro.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org

The dw_pcie_host_ops structure is only stored in the ops field
of a pcie_port structure, and this field is const, so make the
dw_pcie_host_ops structure const as well.

Done with the help of Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/pci/controller/dwc/pcie-histb.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff -u -p a/drivers/pci/controller/dwc/pcie-histb.c b/drivers/pci/controller/dwc/pcie-histb.c
--- a/drivers/pci/controller/dwc/pcie-histb.c
+++ b/drivers/pci/controller/dwc/pcie-histb.c
@@ -202,7 +202,7 @@ static int histb_pcie_host_init(struct p
 	return 0;
 }
 
-static struct dw_pcie_host_ops histb_pcie_host_ops = {
+static const struct dw_pcie_host_ops histb_pcie_host_ops = {
 	.rd_own_conf = histb_pcie_rd_own_conf,
 	.wr_own_conf = histb_pcie_wr_own_conf,
 	.host_init = histb_pcie_host_init,
