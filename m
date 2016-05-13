From: Chaitra Basappa <chaitra.basappa@broadcom.com>
Date: Fri, 13 May 2016 09:47:45 +0000
Subject: RE: [patch 1/2] mpt3sas: add missing curly braces
Message-Id: <a8f5e7c81c02912d0ef6d68f0bad8e2d@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160512203738.GB26894@mwanda>
In-Reply-To: <20160512203738.GB26894@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Sathya Prakash Veerichetty <sathya.prakash@broadcom.com>
Cc: Suganath Prabu Subramani <suganath-prabu.subramani@broadcom.com>, "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, PDL-MPT-FUSIONLINUX <mpt-fusionlinux.pdl@broadcom.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi,
 Please consider this patch as Ack-by: Chaitra P B
<chaitra.basappa@broadcom.com>

Thanks,
 Chaitra

-----Original Message-----
From: Dan Carpenter [mailto:dan.carpenter@oracle.com]
Sent: Friday, May 13, 2016 2:08 AM
To: Sathya Prakash; Chaitra P B
Cc: Suganath Prabu Subramani; James E.J. Bottomley; Martin K. Petersen;
MPT-FusionLinux.pdl@broadcom.com; linux-scsi@vger.kernel.org;
kernel-janitors@vger.kernel.org
Subject: [patch 1/2] mpt3sas: add missing curly braces

There are some missing curly braces on this if statement, so we end up
printing when we shouldn't.

Fixes: a470a51cd648 ('mpt3sas: Handle active cable exception event')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/scsi/mpt3sas/mpt3sas_scsih.c
b/drivers/scsi/mpt3sas/mpt3sas_scsih.c
index 6a4df5a..6bff13e 100644
--- a/drivers/scsi/mpt3sas/mpt3sas_scsih.c
+++ b/drivers/scsi/mpt3sas/mpt3sas_scsih.c
@@ -7975,13 +7975,14 @@ mpt3sas_scsih_event_callback(struct
MPT3SAS_ADAPTER *ioc, u8 msix_index,
 		ActiveCableEventData  		    (Mpi26EventDataActiveCableExcept_t *)
mpi_reply->EventData;
 		if (ActiveCableEventData->ReasonCode =
-
MPI26_EVENT_ACTIVE_CABLE_INSUFFICIENT_POWER)
+
MPI26_EVENT_ACTIVE_CABLE_INSUFFICIENT_POWER) {
 			pr_info(MPT3SAS_FMT "Currently an active cable
with ReceptacleID %d",
 			    ioc->name,
ActiveCableEventData->ReceptacleID);
 			pr_info("cannot be powered and devices connected
to this active cable");
 			pr_info("will not be seen. This active cable");
 			pr_info("requires %d mW of power",

ActiveCableEventData->ActiveCablePowerRequirement);
+		}
 		break;

 	default: /* ignore the rest */
