From: Colin King <colin.king@canonical.com>
Date: Wed, 11 Jul 2018 08:01:03 +0000
Subject: [PATCH] PCI: pcie-candence-ep: remove redundant variable mmc
Message-Id: <20180711080103.4581-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alan Douglas <adouglas@cadence.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Variable mmc is being assigned but is never used hence it is redundant
and can be removed.

Cleans up clang warning:
warning: variable 'mmc' set but not used [-Wunused-but-set-variable]

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/pci/controller/pcie-cadence-ep.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/pci/controller/pcie-cadence-ep.c b/drivers/pci/controller/pcie-cadence-ep.c
index e3fe4124e3af..63549e03eae8 100644
--- a/drivers/pci/controller/pcie-cadence-ep.c
+++ b/drivers/pci/controller/pcie-cadence-ep.c
@@ -238,7 +238,7 @@ static int cdns_pcie_ep_get_msi(struct pci_epc *epc, u8 fn)
 	struct cdns_pcie_ep *ep = epc_get_drvdata(epc);
 	struct cdns_pcie *pcie = &ep->pcie;
 	u32 cap = CDNS_PCIE_EP_FUNC_MSI_CAP_OFFSET;
-	u16 flags, mmc, mme;
+	u16 flags, mme;
 
 	/* Validate that the MSI feature is actually enabled. */
 	flags = cdns_pcie_ep_fn_readw(pcie, fn, cap + PCI_MSI_FLAGS);
@@ -249,7 +249,6 @@ static int cdns_pcie_ep_get_msi(struct pci_epc *epc, u8 fn)
 	 * Get the Multiple Message Enable bitfield from the Message Control
 	 * register.
 	 */
-	mmc = (flags & PCI_MSI_FLAGS_QMASK) >> 1;
 	mme = (flags & PCI_MSI_FLAGS_QSIZE) >> 4;
 
 	return mme;
-- 
2.17.1

