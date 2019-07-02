From: Colin King <colin.king@canonical.com>
Date: Tue, 02 Jul 2019 09:18:35 +0000
Subject: [PATCH] scsi: libfc: fix null pointer dereference on a null lport
Message-Id: <20190702091835.13629-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hannes Reinecke <hare@suse.de>, "James E . J . Bottomley" <jejb@linux.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently if lport is null then the null lport pointer is dereference
when printing out debug via the FC_LPORT_DB macro. Fix this by using
the more generic FC_LIBFC_DBG debug macro instead that does not use
lport.

Addresses-Coverity: ("Dereference after null check")
Fixes: 7414705ea4ae ("libfc: Add runtime debugging with debug_logging module parameter")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/scsi/libfc/fc_exch.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/scsi/libfc/fc_exch.c b/drivers/scsi/libfc/fc_exch.c
index 025cd2ff9f65..c477fadbf504 100644
--- a/drivers/scsi/libfc/fc_exch.c
+++ b/drivers/scsi/libfc/fc_exch.c
@@ -2591,8 +2591,8 @@ void fc_exch_recv(struct fc_lport *lport, struct fc_frame *fp)
 
 	/* lport lock ? */
 	if (!lport || lport->state = LPORT_ST_DISABLED) {
-		FC_LPORT_DBG(lport, "Receiving frames for an lport that "
-			     "has not been initialized correctly\n");
+		FC_LIBFC_DBG("Receiving frames for an lport that "
+			     "has not been initialized correctly\n");
 		fc_frame_free(fp);
 		return;
 	}
-- 
2.20.1
