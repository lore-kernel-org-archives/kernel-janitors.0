From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Sun, 23 Feb 2020 09:09:50 +0000
Subject: [PATCH] MAINTAINERS: clean up PCIE DRIVER FOR CAVIUM THUNDERX
Message-Id: <20200223090950.5259-1-lukas.bulwahn@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Daney <david.daney@cavium.com>, Robert Richter <rrichter@marvell.com>, Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, linux-pci@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Joe Perches <joe@perches.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, Andrew Murray <andrew.murray@arm.com>, Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org

Commit e1ac611f57c9 ("dt-bindings: PCI: Convert generic host binding to
DT schema") combines all information from pci-thunder-{pem,ecam}.txt
into host-generic-pci.yaml, and deleted the two files in
Documentation/devicetree/bindings/pci/.

Since then, ./scripts/get_maintainer.pl --self-test complains:

  no file matches F: Documentation/devicetree/bindings/pci/pci-thunder-*

As the PCIE DRIVER FOR CAVIUM THUNDERX-relevant information is only a
small part of the host-generic-pci.yaml, do not add this file to the
PCIE DRIVER FOR CAVIUM THUNDERX entry, and only drop the reference to
the removed files.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
Robert, are you still the maintainer of this driver?
Rob Herring, please pick this patch.
applies cleanly on current master and next-20200221

 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2af5fa73155e..d43a8f9769db 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12953,7 +12953,6 @@ M:	Robert Richter <rrichter@marvell.com>
 L:	linux-pci@vger.kernel.org
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Supported
-F:	Documentation/devicetree/bindings/pci/pci-thunder-*
 F:	drivers/pci/controller/pci-thunder-*
 
 PCIE DRIVER FOR HISILICON
-- 
2.17.1
