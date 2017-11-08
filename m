From: Sathya Prakash Veerichetty <sathya.prakash@broadcom.com>
Date: Wed, 08 Nov 2017 16:03:17 +0000
Subject: RE: [patch 2/2] scsi: mpt3sas: remove a stray KERN_INFO
Message-Id: <c153aa212e6c8918020602fba7e975ce@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171108083819.u2yufaeamh2vffac@mwanda>
In-Reply-To: <20171108083819.u2yufaeamh2vffac@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Suganath Prabu Subramani <suganath-prabu.subramani@broadcom.com>
Cc: Chaitra Basappa <chaitra.basappa@broadcom.com>, "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, PDL-MPT-FUSIONLINUX <mpt-fusionlinux.pdl@broadcom.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org

Thanks.
Acked-by: Sathya Prakash Veerichetty <sathya.prakash@broadcom.com>

-----Original Message-----
From: Dan Carpenter [mailto:dan.carpenter@oracle.com]
Sent: Wednesday, November 8, 2017 1:38 AM
To: Sathya Prakash; Suganath Prabu Subramani
Cc: Chaitra P B; James E.J. Bottomley; Martin K. Petersen;
MPT-FusionLinux.pdl@broadcom.com; linux-scsi@vger.kernel.org;
kernel-janitors@vger.kernel.org
Subject: [patch 2/2] scsi: mpt3sas: remove a stray KERN_INFO

pr_info() has a KERN_INFO already so the second KERN_INFO isn't needed.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/scsi/mpt3sas/mpt3sas_scsih.c
b/drivers/scsi/mpt3sas/mpt3sas_scsih.c
index 3a9438a1704e..b258f210120a 100644
--- a/drivers/scsi/mpt3sas/mpt3sas_scsih.c
+++ b/drivers/scsi/mpt3sas/mpt3sas_scsih.c
@@ -8683,7 +8684,7 @@ _scsih_mark_responding_pcie_device(struct
MPT3SAS_ADAPTER *ioc,

 			if (pcie_device->handle =
pcie_device_pg0->DevHandle)
 				goto out;
-			pr_info(KERN_INFO "\thandle changed
from(0x%04x)!!!\n",
+			pr_info("\thandle changed from(0x%04x)!!!\n",
 			    pcie_device->handle);
 			pcie_device->handle = pcie_device_pg0->DevHandle;
 			if (sas_target_priv_data)
