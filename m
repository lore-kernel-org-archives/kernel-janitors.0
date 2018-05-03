From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 03 May 2018 10:54:32 +0000
Subject: [PATCH] scsi: megaraid: silence a static checker bug
Message-Id: <20180503105432.GB5315@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

If we had more than 32 megaraid cards then it would cause memory
corruption.  That's not likely, of course, but it's handy to enforce it
and make the static checker happy.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/scsi/megaraid.c b/drivers/scsi/megaraid.c
index 7195cff51d4c..9b6f5d024dba 100644
--- a/drivers/scsi/megaraid.c
+++ b/drivers/scsi/megaraid.c
@@ -4199,6 +4199,9 @@ megaraid_probe_one(struct pci_dev *pdev, const struct pci_device_id *id)
 	int irq, i, j;
 	int error = -ENODEV;
 
+	if (hba_count >= MAX_CONTROLLERS)
+		goto out;
+
 	if (pci_enable_device(pdev))
 		goto out;
 	pci_set_master(pdev);
