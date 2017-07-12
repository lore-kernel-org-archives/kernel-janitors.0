From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 12 Jul 2017 07:30:22 +0000
Subject: [PATCH] scsi: libfc: pass an error pointer to fc_disc_error()
Message-Id: <20170712073022.e24r3iad7jqxarn6@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Johannes Thumshirn <jth@kernel.org>, Robert Love <rml@tech9.net>
Cc: "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, fcoe-devel@open-fcoe.org, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org

This patch is basically to silence a static checker warning.

    drivers/scsi/libfc/fc_disc.c:326 fc_disc_error()
    warn: passing a valid pointer to 'PTR_ERR'

It doesn't affect runtime because it treats -ENOMEM and a valid pointer
the same.  But the documentation says we should be passing an error
pointer.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/scsi/libfc/fc_disc.c b/drivers/scsi/libfc/fc_disc.c
index fd501f8dbb11..8660f923ace0 100644
--- a/drivers/scsi/libfc/fc_disc.c
+++ b/drivers/scsi/libfc/fc_disc.c
@@ -573,7 +573,7 @@ static void fc_disc_gpn_ft_resp(struct fc_seq *sp, struct fc_frame *fp,
 		event = DISC_EV_FAILED;
 	}
 	if (error)
-		fc_disc_error(disc, fp);
+		fc_disc_error(disc, ERR_PTR(error));
 	else if (event != DISC_EV_NONE)
 		fc_disc_done(disc, event);
 	fc_frame_free(fp);
