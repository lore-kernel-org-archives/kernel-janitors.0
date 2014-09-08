From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 08 Sep 2014 11:15:42 +0000
Subject: [patch] xen-scsifront: use GFP_ATOMIC under spin_lock
Message-Id: <20140908111542.GA6947@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Juergen Gross <jgross@suse.com>
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, David Vrabel <david.vrabel@citrix.com>, "James E.J. Bottomley" <JBottomley@parallels.com>, xen-devel@lists.xenproject.org, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org

This function is only called with a spin_lock held and IRQs disabled.
The allocation is not allowed to sleep and NOIO is not sufficient, it
has to be ATOMIC.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/scsi/xen-scsifront.c b/drivers/scsi/xen-scsifront.c
index 0aceb70..7e88659 100644
--- a/drivers/scsi/xen-scsifront.c
+++ b/drivers/scsi/xen-scsifront.c
@@ -359,7 +359,7 @@ static int map_data_for_request(struct vscsifrnt_info *info,
 		}
 		seg_grants = vscsiif_grants_sg(data_grants);
 		shadow->sg = kcalloc(data_grants,
-			sizeof(struct scsiif_request_segment), GFP_NOIO);
+			sizeof(struct scsiif_request_segment), GFP_ATOMIC);
 		if (!shadow->sg)
 			return -ENOMEM;
 	}
