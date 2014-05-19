From: Benoit Taine <benoit.taine@lip6.fr>
Date: Mon, 19 May 2014 16:24:26 +0000
Subject: [PATCH] staging: rts5208: Use pci_device_id rather than DEFINE_PCI_DEVICE_TABLE
Message-Id: <1400516666-17303-1-git-send-email-benoit.taine@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: benoit.taine@lip6.fr, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

This patch enhances kernel style usage for the rts5208 driver.
We should prefer `struct pci_device_id` over `DEFINE_PCI_DEVICE_TABLE` to meet
kernel coding style guidelines. This issue was reported by checkpatch.

Signed-off-by: Benoit Taine <benoit.taine@lip6.fr>
---
 drivers/staging/rts5208/rtsx.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rts5208/rtsx.c b/drivers/staging/rts5208/rtsx.c
index d2d1345..c0a0e60 100644
--- a/drivers/staging/rts5208/rtsx.c
+++ b/drivers/staging/rts5208/rtsx.c
@@ -1030,7 +1030,7 @@ static void rtsx_remove(struct pci_dev *pci)
 }
 
 /* PCI IDs */
-static DEFINE_PCI_DEVICE_TABLE(rtsx_ids) = {
+static const struct pci_device_id rtsx_ids[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_REALTEK, 0x5208),
 		PCI_CLASS_OTHERS << 16, 0xFF0000 },
 	{ PCI_DEVICE(PCI_VENDOR_ID_REALTEK, 0x5288),

