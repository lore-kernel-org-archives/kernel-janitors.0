From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 09 Sep 2014 12:11:50 +0000
Subject: [patch] PCI: xilinx: testing wrong variable in setup irq function
Message-Id: <20140909121150.GD19760@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bjorn Helgaas <bhelgaas@google.com>, Srikanth Thokala <sthokal@xilinx.com>
Cc: Michal Simek <michal.simek@xilinx.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, linux-pci@vger.kernel.org, kernel-janitors@vger.kernel.org

We should be testing "hwirq" instead of "irq".  "irq" is unsigned so
it's never less than zero.  Also it's uninitialized.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/pci/host/pcie-xilinx.c b/drivers/pci/host/pcie-xilinx.c
index 44f8944..ccc496b 100644
--- a/drivers/pci/host/pcie-xilinx.c
+++ b/drivers/pci/host/pcie-xilinx.c
@@ -359,8 +359,8 @@ static int xilinx_pcie_msi_setup_irq(struct msi_chip *chip,
 	phys_addr_t msg_addr;
 
 	hwirq = xilinx_pcie_assign_msi(port);
-	if (irq < 0)
-		return irq;
+	if (hwirq < 0)
+		return hwirq;
 
 	irq = irq_create_mapping(port->irq_domain, hwirq);
 	if (!irq)
