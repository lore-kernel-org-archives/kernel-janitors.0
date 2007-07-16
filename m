From: Denis Cheng <crquan@gmail.com>
Date: Mon, 16 Jul 2007 07:02:39 +0000
Subject: [PATCH] change pci_find_device to pci_get_device,
Message-Id: <11845693593123-git-send-email-crquan@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

this eliminates compiler warning:

drivers/scsi/advansys.c: In function ‘advansys_detect’:
drivers/scsi/advansys.c:4456: warning: ‘pci_find_device’ is deprecated (declared at include/linux/pci.h:478)

Signed-off-by: Denis Cheng <crquan@gmail.com>
---
 drivers/scsi/advansys.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/scsi/advansys.c b/drivers/scsi/advansys.c
index 2b66897..8e5abd1 100644
--- a/drivers/scsi/advansys.c
+++ b/drivers/scsi/advansys.c
@@ -4453,7 +4453,7 @@ advansys_detect(struct scsi_host_template *tpnt)
 
                     /* Find all PCI cards. */
                     while (pci_device_id_cnt < ASC_PCI_DEVICE_ID_CNT) {
-                        if ((pci_devp = pci_find_device(PCI_VENDOR_ID_ASP,
+                        if ((pci_devp = pci_get_device(PCI_VENDOR_ID_ASP,
                             pci_device_id[pci_device_id_cnt], pci_devp)) ==
                             NULL) {
                             pci_device_id_cnt++;
-- 
1.5.2.2

