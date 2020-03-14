From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Sat, 14 Mar 2020 14:25:59 +0000
Subject: [PATCH] MAINTAINERS: correct typo in new NXP LAYERSCAPE GEN4
Message-Id: <20200314142559.13505-1-lukas.bulwahn@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Rob Herring <robh@kernel.org>
Cc: linux-pci@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Joe Perches <joe@perches.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, linux-arm-kernel@lists.infradead.org

Commit 3edeb49525bb ("dt-bindings: PCI: Add NXP Layerscape SoCs PCIe Gen4
controller") includes a new entry in MAINTAINERS, but slipped in a typo in
one of the file entries.

Hence, since then, ./scripts/get_maintainer.pl --self-test complains:

  warning: no file matches F: \
    drivers/pci/controller/mobibeil/pcie-layerscape-gen4.c

Correct the typo in PCI DRIVER FOR NXP LAYERSCAPE GEN4 CONTROLLER.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
applies cleanly on next-20200313

Hou, please ack.
Rob, please pick this patch (it is not urgent, though).

 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 32a95d162f06..77eede976d0f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12858,7 +12858,7 @@ L:	linux-pci@vger.kernel.org
 L:	linux-arm-kernel@lists.infradead.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/pci/layerscape-pcie-gen4.txt
-F:	drivers/pci/controller/mobibeil/pcie-layerscape-gen4.c
+F:	drivers/pci/controller/mobiveil/pcie-layerscape-gen4.c
 
 PCI DRIVER FOR GENERIC OF HOSTS
 M:	Will Deacon <will@kernel.org>

base-commit: 2e602db729948ce577bf07e2b113f2aa806b62c7
-- 
2.17.1
