From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 13 Jan 2016 12:21:52 +0000
Subject: [patch] drm/nouveau/pci: reversed condition in nvkm_pcie_set_link()
Message-Id: <20160113122152.GC19993@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>, Karol Herbst <nouveau@karolherbst.de>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org

The condition is reversed so this function is a no-op.

Fixes: bcc19d9bf5cd ('drm/nouveau/pci: implement generic code for pcie speed change')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/pci/pcie.c b/drivers/gpu/drm/nouveau/nvkm/subdev/pci/pcie.c
index b32954f..d71e5db 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/pci/pcie.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/pci/pcie.c
@@ -119,7 +119,7 @@ nvkm_pcie_set_link(struct nvkm_pci *pci, enum nvkm_pcie_speed speed, u8 width)
 	struct pci_bus *pbus;
 	int ret;
 
-	if (pci || !pci_is_pcie(pci->pdev))
+	if (!pci || !pci_is_pcie(pci->pdev))
 		return 0;
 	pbus = pci->pdev->bus;
 
