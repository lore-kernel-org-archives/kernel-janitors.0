From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Mon, 19 Aug 2013 08:51:56 +0000
Subject: [PATCH 6/6] MIPS: ath79: simplify platform_get_resource_byname/devm_ioremap_resource
Message-Id: <1376902316-18520-7-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1376902316-18520-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1376902316-18520-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ralf Baechle <ralf@linux-mips.org>
Cc: kernel-janitors@vger.kernel.org, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

Remove unneeded error handling on the result of a call to
platform_get_resource_byname when the value is passed to devm_ioremap_resource.

A simplified version of the semantic patch that makes this change is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@@
expression pdev,res,e,e1;
expression ret != 0;
identifier l;
@@

  res = platform_get_resource_byname(...);
- if (res = NULL) { ... \(goto l;\|return ret;\) }
  e = devm_ioremap_resource(e1, res);
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 arch/mips/pci/pci-ar71xx.c |    3 ---
 arch/mips/pci/pci-ar724x.c |    9 ---------
 2 files changed, 12 deletions(-)

diff --git a/arch/mips/pci/pci-ar71xx.c b/arch/mips/pci/pci-ar71xx.c
index 18517dd..d471a26 100644
--- a/arch/mips/pci/pci-ar71xx.c
+++ b/arch/mips/pci/pci-ar71xx.c
@@ -363,9 +363,6 @@ static int ar71xx_pci_probe(struct platform_device *pdev)
 	spin_lock_init(&apc->lock);
 
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "cfg_base");
-	if (!res)
-		return -EINVAL;
-
 	apc->cfg_base = devm_ioremap_resource(&pdev->dev, res);
 	if (IS_ERR(apc->cfg_base))
 		return PTR_ERR(apc->cfg_base);
diff --git a/arch/mips/pci/pci-ar724x.c b/arch/mips/pci/pci-ar724x.c
index 65ec032..785b265 100644
--- a/arch/mips/pci/pci-ar724x.c
+++ b/arch/mips/pci/pci-ar724x.c
@@ -362,25 +362,16 @@ static int ar724x_pci_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "ctrl_base");
-	if (!res)
-		return -EINVAL;
-
 	apc->ctrl_base = devm_ioremap_resource(&pdev->dev, res);
 	if (IS_ERR(apc->ctrl_base))
 		return PTR_ERR(apc->ctrl_base);
 
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "cfg_base");
-	if (!res)
-		return -EINVAL;
-
 	apc->devcfg_base = devm_ioremap_resource(&pdev->dev, res);
 	if (IS_ERR(apc->devcfg_base))
 		return PTR_ERR(apc->devcfg_base);
 
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "crp_base");
-	if (!res)
-		return -EINVAL;
-
 	apc->crp_base = devm_ioremap_resource(&pdev->dev, res);
 	if (IS_ERR(apc->crp_base))
 		return PTR_ERR(apc->crp_base);

