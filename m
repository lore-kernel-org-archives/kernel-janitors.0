From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 04 Nov 2015 13:26:24 +0000
Subject: [patch] vfio: make an array larger
Message-Id: <20151104132624.GC20966@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Williamson <alex.williamson@redhat.com>
Cc: Frank Blaschka <frank.blaschka@de.ibm.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Smatch complains about a possible out of bounds error:

	drivers/vfio/pci/vfio_pci_config.c:1241 vfio_cap_init()
	error: buffer overflow 'pci_cap_length' 20 <= 20

Fix this by making the array larger.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/vfio/pci/vfio_pci_config.c b/drivers/vfio/pci/vfio_pci_config.c
index ff75ca3..001d48a 100644
--- a/drivers/vfio/pci/vfio_pci_config.c
+++ b/drivers/vfio/pci/vfio_pci_config.c
@@ -46,7 +46,7 @@
  *   0: Removed from the user visible capability list
  *   FF: Variable length
  */
-static u8 pci_cap_length[] = {
+static u8 pci_cap_length[PCI_CAP_ID_MAX + 1] = {
 	[PCI_CAP_ID_BASIC]	= PCI_STD_HEADER_SIZEOF, /* pci config header */
 	[PCI_CAP_ID_PM]		= PCI_PM_SIZEOF,
 	[PCI_CAP_ID_AGP]	= PCI_AGP_SIZEOF,
