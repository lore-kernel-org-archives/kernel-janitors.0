From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 25 Aug 2020 11:20:03 +0000
Subject: [PATCH] scsi: aacraid: remove erroneous fallthrough annotation
Message-Id: <20200825112003.GD285523@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Adaptec OEM Raid Solutions <aacraid@microsemi.com>
Cc: "James E.J. Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, Raghava Aditya Renukunta <RaghavaAditya.Renukunta@microsemi.com>, Dave Carroll <David.Carroll@microsemi.com>, Johannes Thumshirn <jthumshirn@suse.de>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org

This fallthrough annotation is unreachable so we can delete it.

Fixes: c4e2fbca374b ("scsi: aacraid: Reworked scsi command submission path")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/scsi/aacraid/aachba.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/scsi/aacraid/aachba.c b/drivers/scsi/aacraid/aachba.c
index fd6ae5c38086..2fb1881954c7 100644
--- a/drivers/scsi/aacraid/aachba.c
+++ b/drivers/scsi/aacraid/aachba.c
@@ -3253,7 +3253,6 @@ int aac_scsi_cmd(struct scsi_cmnd * scsicmd)
 	case START_STOP:
 		return aac_start_stop(scsicmd);
 
-		fallthrough;
 	default:
 	/*
 	 *	Unhandled commands
-- 
2.28.0
