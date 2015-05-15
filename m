From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 15 May 2015 09:24:15 +0000
Subject: [patch] ata: ahci_xgene: potential NULL dereference in probe
Message-Id: <20150515092415.GA21508@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tejun Heo <tj@kernel.org>, Suman Tripathi <stripathi@apm.com>
Cc: linux-ide@vger.kernel.org, kernel-janitors@vger.kernel.org

Smatch complains about this potential NULL dereference of "acpi_id".

Fixes: c9802a4be661 ('ata: ahci_xgene: Add AHCI Support for 2nd HW version of APM X-Gene SoC AHCI SATA Host controller.')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/ata/ahci_xgene.c b/drivers/ata/ahci_xgene.c
index 2add250..e2c6d9e 100644
--- a/drivers/ata/ahci_xgene.c
+++ b/drivers/ata/ahci_xgene.c
@@ -732,9 +732,7 @@ static int xgene_ahci_probe(struct platform_device *pdev)
 		if (!acpi_id) {
 			dev_warn(&pdev->dev, "No node entry in ACPI table. Assume version1\n");
 			version = XGENE_AHCI_V1;
-		}
-
-		if (acpi_id->driver_data) {
+		} else if (acpi_id->driver_data) {
 			version = (enum xgene_ahci_version) acpi_id->driver_data;
 			status = acpi_get_object_info(ACPI_HANDLE(&pdev->dev), &info);
 			if (ACPI_FAILURE(status)) {
