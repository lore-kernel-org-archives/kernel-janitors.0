From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 24 Nov 2016 10:52:38 +0000
Subject: [patch] scsi: libfc: Remove an unneeded condition
Message-Id: <20161124105238.GB17225@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Johannes Thumshirn <jth@kernel.org>, Hannes Reinecke <hare@suse.de>
Cc: "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, fcoe-devel@open-fcoe.org, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org

We verified that resp_code is FC_SPP_RESP_ACK earlier so we don't need
to check again here.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/scsi/libfc/fc_rport.c b/drivers/scsi/libfc/fc_rport.c
index 110a707..c991f3b 100644
--- a/drivers/scsi/libfc/fc_rport.c
+++ b/drivers/scsi/libfc/fc_rport.c
@@ -1196,7 +1196,6 @@ static void fc_rport_prli_resp(struct fc_seq *sp, struct fc_frame *fp,
 		 * Check if the image pair could be established
 		 */
 		if (rdata->spp_type != FC_TYPE_FCP ||
-		    resp_code != FC_SPP_RESP_ACK ||
 		    !(pp->spp.spp_flags & FC_SPP_EST_IMG_PAIR)) {
 			/*
 			 * Nope; we can't use this port as a target.
