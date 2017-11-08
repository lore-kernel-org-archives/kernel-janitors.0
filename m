From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 08 Nov 2017 08:38:20 +0000
Subject: [patch 2/2] scsi: mpt3sas: remove a stray KERN_INFO
Message-Id: <20171108083819.u2yufaeamh2vffac@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sathya Prakash <sathya.prakash@broadcom.com>, Suganath Prabu Subramani <suganath-prabu.subramani@broadcom.com>
Cc: Chaitra P B <chaitra.basappa@broadcom.com>, "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, MPT-FusionLinux.pdl@broadcom.com, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org

pr_info() has a KERN_INFO already so the second KERN_INFO isn't needed.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/scsi/mpt3sas/mpt3sas_scsih.c b/drivers/scsi/mpt3sas/mpt3sas_scsih.c
index 3a9438a1704e..b258f210120a 100644
--- a/drivers/scsi/mpt3sas/mpt3sas_scsih.c
+++ b/drivers/scsi/mpt3sas/mpt3sas_scsih.c
@@ -8683,7 +8684,7 @@ _scsih_mark_responding_pcie_device(struct MPT3SAS_ADAPTER *ioc,
 
 			if (pcie_device->handle = pcie_device_pg0->DevHandle)
 				goto out;
-			pr_info(KERN_INFO "\thandle changed from(0x%04x)!!!\n",
+			pr_info("\thandle changed from(0x%04x)!!!\n",
 			    pcie_device->handle);
 			pcie_device->handle = pcie_device_pg0->DevHandle;
 			if (sas_target_priv_data)
