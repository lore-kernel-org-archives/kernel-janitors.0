From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Fri, 01 Mar 2019 06:58:09 +0000
Subject: [PATCH -next] PCI: aardvark: Make symbol 'advk_pci_bridge_emul_ops' static
Message-Id: <20190301065809.66046-1-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Bjorn Helgaas <bhelgaas@google.com>, Zachary
 Zhang <zhangzg@marvell.com>
Cc: linux-pci@vger.kernel.org, kernel-janitors@vger.kernel.org, Wei Yongjun <weiyongjun1@huawei.com>, linux-arm-kernel@lists.infradead.org

Fixes the following sparse warning:

drivers/pci/controller/pci-aardvark.c:469:28: warning:
 symbol 'advk_pci_bridge_emul_ops' was not declared. Should it be static?

Fixes: 8a3ebd8de328 ("PCI: aardvark: Implement emulated root PCI bridge config space")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/pci/controller/pci-aardvark.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/controller/pci-aardvark.c b/drivers/pci/controller/pci-aardvark.c
index 6eecae447af3..eb58dfdaba1b 100644
--- a/drivers/pci/controller/pci-aardvark.c
+++ b/drivers/pci/controller/pci-aardvark.c
@@ -466,7 +466,7 @@ advk_pci_bridge_emul_pcie_conf_write(struct pci_bridge_emul *bridge,
 	}
 }
 
-struct pci_bridge_emul_ops advk_pci_bridge_emul_ops = {
+static struct pci_bridge_emul_ops advk_pci_bridge_emul_ops = {
 	.read_pcie = advk_pci_bridge_emul_pcie_conf_read,
 	.write_pcie = advk_pci_bridge_emul_pcie_conf_write,
 };
