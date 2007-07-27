From: Yoann Padioleau <padator@wanadoo.fr>
Date: Fri, 27 Jul 2007 09:44:53 +0000
Subject: [PATCH 09/68] 0 -> NULL, for arch/m68knommu
Message-Id: <200707270944.LAA17230@ifs.emn.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: gerg@uclinux.org, akpm@linux-foundation.org, linux-kernel@vger.kernel.org


When comparing a pointer, it's clearer to compare it to NULL than to 0.

Here is an excerpt of the semantic patch: 

@@
expression *E;
@@

  E =
- 0
+ NULL

@@
expression *E;
@@

  E !- 0
+ NULL

Signed-off-by: Yoann Padioleau <padator@wanadoo.fr>
Cc: gerg@uclinux.org
Cc: akpm@linux-foundation.org
---

 comempci.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/m68knommu/kernel/comempci.c b/arch/m68knommu/kernel/comempci.c
index 6ee00ef..528517e 100644
--- a/arch/m68knommu/kernel/comempci.c
+++ b/arch/m68knommu/kernel/comempci.c
@@ -736,7 +736,7 @@ #endif
 
 	/* Find a free spot to put this handler */
 	for (i = 0; (i < COMEM_MAXPCI); i++) {
-		if (pci_irqlist[i].handler = 0) {
+		if (pci_irqlist[i].handler = NULL) {
 			pci_irqlist[i].handler = handler;
 			pci_irqlist[i].device = device;
 			pci_irqlist[i].dev_id = dev_id;

