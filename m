From: Julia Lawall <julia@diku.dk>
Date: Tue, 03 Aug 2010 21:35:17 +0000
Subject: [PATCH 8/9] arch/powerpc/kernel: Drop unnecessary null test
Message-Id: <Pine.LNX.4.64.1008032334420.20393@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Grant Likely <grant.likely@secretlab.ca>, linuxppc-dev@ozlabs.org, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

list_for_each_entry binds its first argument to a non-null value, and thus
any null test on the value of that argument is superfluous.

The semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
iterator I;
expression x,E,E1,E2;
statement S,S1,S2;
@@

I(x,...) { <...
- if (x != NULL || ...)
  S
  ...> }
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 arch/powerpc/kernel/pci_of_scan.c |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/pci_of_scan.c b/arch/powerpc/kernel/pci_of_scan.c
index 6ddb795..62dd363 100644
--- a/arch/powerpc/kernel/pci_of_scan.c
+++ b/arch/powerpc/kernel/pci_of_scan.c
@@ -336,8 +336,7 @@ static void __devinit __of_scan_bus(struct device_node *node,
 		if (dev->hdr_type = PCI_HEADER_TYPE_BRIDGE ||
 		    dev->hdr_type = PCI_HEADER_TYPE_CARDBUS) {
 			struct device_node *child = pci_device_to_OF_node(dev);
-			if (dev)
-				of_scan_pci_bridge(child, dev);
+			of_scan_pci_bridge(child, dev);
 		}
 	}
 }
