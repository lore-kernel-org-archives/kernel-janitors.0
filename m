From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 25 Oct 2015 21:24:25 +0000
Subject: [PATCH 1/1] MIPS: pci-rt3883: drop unneeded of_node_get
Message-Id: <1445808265-10394-2-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1445808265-10394-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1445808265-10394-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ralf Baechle <ralf@linux-mips.org>
Cc: kernel-janitors@vger.kernel.org, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, Russell King - ARM Linux <linux@arm.linux.org.uk>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Andrew Lunn <andrew@lunn.ch>, Bjorn Helgaas <bhelgaas@google.com>, Jason Cooper <jason@lakedaemon.net>

for_each_child_of_node performs an of_node_get on each iteration, so no
of_node_get is needed on breaking out of the loop when the device_node
structure is saved in another variable.

A simplified semantic match that finds this problem is as follows
(http://coccinelle.lip6.fr):

// <smpl>
@@
expression root;
local idexpression child;
@@

 for_each_child_of_node(root, child) {
   ...
*  of_node_get(child)
   ...
   break;
 }
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 arch/mips/pci/pci-rt3883.c |    6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/mips/pci/pci-rt3883.c b/arch/mips/pci/pci-rt3883.c
index ed6732f..53a42b0 100644
--- a/arch/mips/pci/pci-rt3883.c
+++ b/arch/mips/pci/pci-rt3883.c
@@ -432,8 +432,7 @@ static int rt3883_pci_probe(struct platform_device *pdev)
 
 	/* find the interrupt controller child node */
 	for_each_child_of_node(np, child) {
-		if (of_get_property(child, "interrupt-controller", NULL) &&
-		    of_node_get(child)) {
+		if (of_get_property(child, "interrupt-controller", NULL)) {
 			rpc->intc_of_node = child;
 			break;
 		}
@@ -449,8 +448,7 @@ static int rt3883_pci_probe(struct platform_device *pdev)
 	/* find the PCI host bridge child node */
 	for_each_child_of_node(np, child) {
 		if (child->type &&
-		    of_node_cmp(child->type, "pci") = 0 &&
-		    of_node_get(child)) {
+		    of_node_cmp(child->type, "pci") = 0) {
 			rpc->pci_controller.of_node = child;
 			break;
 		}

