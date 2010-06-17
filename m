From: Christoph Fritz <chf.fritz@googlemail.com>
Date: Thu, 17 Jun 2010 13:28:25 +0000
Subject: [PATCH] x86: fix section mismatch in pcibios_scan_specific_bus
Message-Id: <1276781305.2999.1.camel@lovely.krouter>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Fix following section mismatch in legacy function
pcibios_scan_specific_bus:

arch/x86/pci/built-in.o(.text+0x1637): Section mismatch in
reference from the function pcibios_scan_specific_bus() to
the function .devinit.text:pci_scan_bus_on_node()

The function pcibios_scan_specific_bus() references the
function __devinit pci_scan_bus_on_node().

This is often because pcibios_scan_specific_bus lacks a
__devinit annotation or the annotation of
pci_scan_bus_on_nodeis wrong.

Signed-off-by: Christoph Fritz <chf.fritz@googlemail.com>
---
 arch/x86/pci/legacy.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/x86/pci/legacy.c b/arch/x86/pci/legacy.c
index 8d460ea..c89266b 100644
--- a/arch/x86/pci/legacy.c
+++ b/arch/x86/pci/legacy.c
@@ -36,7 +36,7 @@ int __init pci_legacy_init(void)
 	return 0;
 }
 
-void pcibios_scan_specific_bus(int busn)
+void __devinit pcibios_scan_specific_bus(int busn)
 {
 	int devfn;
 	long node;
-- 
1.7.1

