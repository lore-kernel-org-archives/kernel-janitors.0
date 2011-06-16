From: Greg Dietsche <Gregory.Dietsche@cuw.edu>
Date: Thu, 16 Jun 2011 16:39:21 +0000
Subject: [PATCH] ata: remove unnecessary code
Message-Id: <1308242361-28859-1-git-send-email-Gregory.Dietsche@cuw.edu>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jgarzik@pobox.com
Cc: linux-ide@vger.kernel.org, kernel-janitors@vger.kernel.org, Greg Dietsche <Gregory.Dietsche@cuw.edu>

Compile tested.
remove unnecessary code that matches this coccinelle pattern
	if (...)
		return ret;
	return ret;

Signed-off-by: Greg Dietsche <Gregory.Dietsche@cuw.edu>
---
 drivers/ata/pata_acpi.c |    8 +-------
 1 files changed, 1 insertions(+), 7 deletions(-)

diff --git a/drivers/ata/pata_acpi.c b/drivers/ata/pata_acpi.c
index 91949d9..54145ed 100644
--- a/drivers/ata/pata_acpi.c
+++ b/drivers/ata/pata_acpi.c
@@ -195,8 +195,6 @@ static int pacpi_port_start(struct ata_port *ap)
 	struct pci_dev *pdev = to_pci_dev(ap->host->dev);
 	struct pata_acpi *acpi;
 
-	int ret;
-
 	if (ap->acpi_handle = NULL)
 		return -ENODEV;
 
@@ -205,11 +203,7 @@ static int pacpi_port_start(struct ata_port *ap)
 		return -ENOMEM;
 	acpi->mask[0] = pacpi_discover_modes(ap, &ap->link.device[0]);
 	acpi->mask[1] = pacpi_discover_modes(ap, &ap->link.device[1]);
-	ret = ata_bmdma_port_start(ap);
-	if (ret < 0)
-		return ret;
-
-	return ret;
+	return ata_bmdma_port_start(ap);
 }
 
 static struct scsi_host_template pacpi_sht = {
-- 
1.7.2.5

