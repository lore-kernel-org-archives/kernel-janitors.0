From: Kulikov Vasiliy <segooon@gmail.com>
Date: Sat, 03 Jul 2010 16:03:37 +0000
Subject: [PATCH 02/19] arch/cris/arch-v32/drivers/pci: use for_each_pci_dev()
Message-Id: <1278173019-11473-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kernel Janitors <kernel-janitors@vger.kernel.org>
Cc: Mikael Starvik <starvik@axis.com>, Jesper Nilsson <jesper.nilsson@axis.com>, Jesse Barnes <jbarnes@virtuousgeek.org>, Dominik Brodowski <linux@dominikbrodowski.net>, David Howells <dhowells@redhat.com>, linux-cris-kernel@axis.com, linux-kernel@vger.kernel.org

Use for_each_pci_dev() to simplify the code.

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
---
 arch/cris/arch-v32/drivers/pci/bios.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/cris/arch-v32/drivers/pci/bios.c b/arch/cris/arch-v32/drivers/pci/bios.c
index bc0cfda..6c3c8e8 100644
--- a/arch/cris/arch-v32/drivers/pci/bios.c
+++ b/arch/cris/arch-v32/drivers/pci/bios.c
@@ -109,7 +109,7 @@ int pcibios_assign_resources(void)
 	int idx;
 	struct resource *r;
 
-	while ((dev = pci_get_device(PCI_ANY_ID, PCI_ANY_ID, dev)) != NULL) {
+	for_each_pci_dev(dev) {
 		int class = dev->class >> 8;
 
 		/* Don't touch classless devices and host bridges */
-- 
1.7.0.4

