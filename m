From: Kulikov Vasiliy <segooon@gmail.com>
Date: Sat, 03 Jul 2010 16:04:35 +0000
Subject: [PATCH 16/19] drivers/pci: use for_each_pci_dev()
Message-Id: <1278173076-11949-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kernel Janitors <kernel-janitors@vger.kernel.org>
Cc: Jesse Barnes <jbarnes@virtuousgeek.org>, Kenji Kaneshige <kaneshige.kenji@jp.fujitsu.com>, Huang Ying <ying.huang@intel.com>, Stefan Assmann <sassmann@redhat.com>, Andrew Patterson <andrew.patterson@hp.com>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org

Use for_each_pci_dev() to simplify the code.

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
---
 drivers/pci/search.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/pci/search.c b/drivers/pci/search.c
index 20d03f7..9d75dc8 100644
--- a/drivers/pci/search.c
+++ b/drivers/pci/search.c
@@ -169,7 +169,7 @@ struct pci_dev *pci_get_domain_bus_and_slot(int domain, unsigned int bus,
 {
 	struct pci_dev *dev = NULL;
 
-	while ((dev = pci_get_device(PCI_ANY_ID, PCI_ANY_ID, dev)) != NULL) {
+	for_each_pci_dev(dev) {
 		if (pci_domain_nr(dev->bus) = domain &&
 		    (dev->bus->number = bus && dev->devfn = devfn))
 			return dev;
-- 
1.7.0.4

