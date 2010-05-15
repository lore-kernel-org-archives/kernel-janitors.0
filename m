From: Julia Lawall <julia@diku.dk>
Date: Sat, 15 May 2010 21:18:16 +0000
Subject: [PATCH 17/37] drivers/pci/hotplug: Use kmemdup
Message-Id: <Pine.LNX.4.64.1005152318000.21345@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jesse Barnes <jbarnes@virtuousgeek.org>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Use kmemdup when some other buffer is immediately copied into the
allocated region.

A simplified version of the semantic patch that makes this change is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@@
expression from,to,size,flag;
statement S;
@@

-  to = \(kmalloc\|kzalloc\)(size,flag);
+  to = kmemdup(from,size,flag);
   if (to=NULL || ...) S
-  memcpy(to, from, size);
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/pci/hotplug/cpqphp_core.c |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff -u -p a/drivers/pci/hotplug/cpqphp_core.c b/drivers/pci/hotplug/cpqphp_core.c
--- a/drivers/pci/hotplug/cpqphp_core.c
+++ b/drivers/pci/hotplug/cpqphp_core.c
@@ -1075,13 +1075,12 @@ static int cpqhpc_probe(struct pci_dev *
 
 	/* make our own copy of the pci bus structure,
 	 * as we like tweaking it a lot */
-	ctrl->pci_bus = kmalloc(sizeof(*ctrl->pci_bus), GFP_KERNEL);
+	ctrl->pci_bus = kmemdup(pdev->bus, sizeof(*ctrl->pci_bus), GFP_KERNEL);
 	if (!ctrl->pci_bus) {
 		err("out of memory\n");
 		rc = -ENOMEM;
 		goto err_free_ctrl;
 	}
-	memcpy(ctrl->pci_bus, pdev->bus, sizeof(*ctrl->pci_bus));
 
 	ctrl->bus = pdev->bus->number;
 	ctrl->rev = pdev->revision;
