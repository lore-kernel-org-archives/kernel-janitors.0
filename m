From: Tobias Klauser <tklauser@distanz.ch>
Date: Thu, 20 May 2010 08:39:38 +0000
Subject: [PATCH 09/11] Staging: hv: Storage class should be before const qualifier
Message-Id: <1274344778-9209-1-git-send-email-tklauser@distanz.ch>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The C99 specification states in section 6.11.5:

The placement of a storage-class specifier other than at the beginning
of the declaration specifiers in a declaration is an obsolescent
feature.

Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
---
 drivers/staging/hv/vmbus_drv.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/staging/hv/vmbus_drv.c b/drivers/staging/hv/vmbus_drv.c
index c21731a..4f6f640 100644
--- a/drivers/staging/hv/vmbus_drv.c
+++ b/drivers/staging/hv/vmbus_drv.c
@@ -1025,7 +1025,7 @@ static void __exit vmbus_exit(void)
  * installed and/or configured.  We don't do anything else with the table, but
  * it needs to be present.
  */
-const static struct pci_device_id microsoft_hv_pci_table[] = {
+static const struct pci_device_id microsoft_hv_pci_table[] = {
 	{ PCI_DEVICE(0x1414, 0x5353) },	/* VGA compatible controller */
 	{ 0 }
 };
-- 
1.6.3.3

