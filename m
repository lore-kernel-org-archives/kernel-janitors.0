From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 09 Nov 2015 12:24:55 +0000
Subject: [patch v2] vfio/pci: make an array larger
Message-Id: <20151109122455.GA28870@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1446661738.3692.129.camel@redhat.com>
In-Reply-To: <1446661738.3692.129.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Williamson <alex.williamson@redhat.com>, "Sean O. Stalley" <sean.stalley@intel.com>
Cc: Mark Rustad <mark.d.rustad@intel.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Smatch complains about a possible out of bounds error:

	drivers/vfio/pci/vfio_pci_config.c:1241 vfio_cap_init()
	error: buffer overflow 'pci_cap_length' 20 <= 20

The problem is that pci_cap_length[] was defined as large enough to
hold "PCI_CAP_ID_AF + 1" elements.  The code in vfio_cap_init() assumes
it has PCI_CAP_ID_MAX + 1 elements.  Originally, PCI_CAP_ID_AF and
PCI_CAP_ID_MAX were the same but then we introduced PCI_CAP_ID_EA in
f80b0ba95964 ('PCI: Add Enhanced Allocation register entries') so now
the array is too small.

Let's fix this by making the array size PCI_CAP_ID_MAX + 1.  And let's
make a similar change to pci_ext_cap_length[] for consistency.  Also
both these arrays can be made const.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: more cleanups

diff --git a/drivers/vfio/pci/vfio_pci_config.c b/drivers/vfio/pci/vfio_pci_config.c
index a8657ef..fe2b470 100644
--- a/drivers/vfio/pci/vfio_pci_config.c
+++ b/drivers/vfio/pci/vfio_pci_config.c
@@ -46,7 +46,7 @@
  *   0: Removed from the user visible capability list
  *   FF: Variable length
  */
-static u8 pci_cap_length[] = {
+static const u8 pci_cap_length[PCI_CAP_ID_MAX + 1] = {
 	[PCI_CAP_ID_BASIC]	= PCI_STD_HEADER_SIZEOF, /* pci config header */
 	[PCI_CAP_ID_PM]		= PCI_PM_SIZEOF,
 	[PCI_CAP_ID_AGP]	= PCI_AGP_SIZEOF,
@@ -74,7 +74,7 @@ static u8 pci_cap_length[] = {
  *   0: Removed or masked from the user visible capabilty list
  *   FF: Variable length
  */
-static u16 pci_ext_cap_length[] = {
+static const u16 pci_ext_cap_length[PCI_EXT_CAP_ID_MAX + 1] = {
 	[PCI_EXT_CAP_ID_ERR]	=	PCI_ERR_ROOT_COMMAND,
 	[PCI_EXT_CAP_ID_VC]	=	0xFF,
 	[PCI_EXT_CAP_ID_DSN]	=	PCI_EXT_CAP_DSN_SIZEOF,
