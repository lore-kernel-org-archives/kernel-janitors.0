From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 07 Nov 2017 13:01:32 +0000
Subject: [PATCH] scsi: hpsa: remove an unecessary NULL check
Message-Id: <20171107130131.3zohbeoobjxbqmdz@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Don Brace <don.brace@microsemi.com>
Cc: "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, esc.storagedev@microsemi.com, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org

device->scsi3addr[] is an array, not a pointer, so it can't be NULL.
I've removed the check.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/scsi/hpsa.c b/drivers/scsi/hpsa.c
index 287e5eb0723f..b0aa5dc1d54c 100644
--- a/drivers/scsi/hpsa.c
+++ b/drivers/scsi/hpsa.c
@@ -8223,8 +8223,6 @@ static void hpsa_set_ioaccel_status(struct ctlr_info *h)
 
 		if (!device)
 			continue;
-		if (!device->scsi3addr)
-			continue;
 		if (!hpsa_vpd_page_supported(h, device->scsi3addr,
 						HPSA_VPD_LV_IOACCEL_STATUS))
 			continue;
