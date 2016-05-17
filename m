From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Tue, 17 May 2016 14:38:44 +0000
Subject: [PATCH 5/7] pm8001: fix typo
Message-Id: <1463495926-13728-6-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1463495926-13728-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1463495926-13728-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jack Wang <jinpu.wang@profitbricks.com>
Cc: kernel-janitors@vger.kernel.org, lindar_liu@usish.com, "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, pmchba@pmcs.com, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org

firmare -> firmware

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/scsi/pm8001/pm8001_init.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/scsi/pm8001/pm8001_init.c b/drivers/scsi/pm8001/pm8001_init.c
index 6bd7bf4..fdbee8b4 100644
--- a/drivers/scsi/pm8001/pm8001_init.c
+++ b/drivers/scsi/pm8001/pm8001_init.c
@@ -1249,7 +1249,7 @@ static int pm8001_pci_resume(struct pci_dev *pdev)
 
 	/* Chip documentation for the 8070 and 8072 SPCv    */
 	/* states that a 500ms minimum delay is required    */
-	/* before issuing commands.  Otherwise, the firmare */
+	/* before issuing commands. Otherwise, the firmware */
 	/* will enter an unrecoverable state.               */
 
 	if (pm8001_ha->chip_id = chip_8070 ||

