From: YueHaibing <yuehaibing@huawei.com>
Date: Tue, 23 Oct 2018 05:59:46 +0000
Subject: [PATCH -next] scsi: a100u2w: remove set but not used variable 'bios_phys'
Message-Id: <1540274386-65609-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/scsi/a100u2w.c: In function 'inia100_probe_one':
drivers/scsi/a100u2w.c:1093:8: warning:
 variable 'bios_phys' set but not used [-Wunused-but-set-variable]

It never used since introduction in
comit 4023c4747861 ("[SCSI] a100u2w: Convert into Linux style")

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/scsi/a100u2w.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/scsi/a100u2w.c b/drivers/scsi/a100u2w.c
index 00072ed..012aa25 100644
--- a/drivers/scsi/a100u2w.c
+++ b/drivers/scsi/a100u2w.c
@@ -1089,8 +1089,6 @@ static int inia100_probe_one(struct pci_dev *pdev,
 	unsigned long port, bios;
 	int error = -ENODEV;
 	u32 sz;
-	unsigned long biosaddr;
-	char *bios_phys;
 
 	if (pci_enable_device(pdev))
 		goto out;
@@ -1140,9 +1138,6 @@ static int inia100_probe_one(struct pci_dev *pdev,
 		goto out_free_scb_array;
 	}
 
-	biosaddr = host->BIOScfg;
-	biosaddr = (biosaddr << 4);
-	bios_phys = phys_to_virt(biosaddr);
 	if (init_orchid(host)) {	/* Initialize orchid chip */
 		printk("inia100: initial orchid fail!!\n");
 		goto out_free_escb_array;
