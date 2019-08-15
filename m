From: Colin King <colin.king@canonical.com>
Date: Thu, 15 Aug 2019 09:14:54 +0000
Subject: [PATCH] scsi: fcoe: remove redundant call to skb_transport_header
Message-Id: <20190815091454.13430-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hannes Reinecke <hare@suse.de>, "James E . J . Bottomley" <jejb@linux.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Pointer fh is being assigned a return value from the call to
skb_transport_header however this value is never read and fh
is being re-assigned immediately afterwards with a new value.
Since there are side-effects from calling skb_transport_header
the call is redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/scsi/fcoe/fcoe.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/scsi/fcoe/fcoe.c b/drivers/scsi/fcoe/fcoe.c
index 587d4bbb7d22..6fd61555120a 100644
--- a/drivers/scsi/fcoe/fcoe.c
+++ b/drivers/scsi/fcoe/fcoe.c
@@ -1617,7 +1617,6 @@ static inline int fcoe_filter_frames(struct fc_lport *lport,
 	else
 		fr_flags(fp) |= FCPHF_CRC_UNCHECKED;
 
-	fh = (struct fc_frame_header *) skb_transport_header(skb);
 	fh = fc_frame_header_get(fp);
 	if (fh->fh_r_ctl = FC_RCTL_DD_SOL_DATA && fh->fh_type = FC_TYPE_FCP)
 		return 0;
-- 
2.20.1
