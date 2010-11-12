From: Dan Carpenter <error27@gmail.com>
Date: Fri, 12 Nov 2010 04:31:46 +0000
Subject: [patch] scsi/osd: checking NULL instead of ERR_PTR()
Message-Id: <20101112043146.GC3533@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Boaz Harrosh <bharrosh@panasas.com>
Cc: Benny Halevy <bhalevy@panasas.com>, "James E.J. Bottomley" <James.Bottomley@suse.de>, osd-dev@open-osd.org, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org

bio_map_kern() returns ERR_PTRs on failure and never returns NULL.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/scsi/osd/osd_initiator.c b/drivers/scsi/osd/osd_initiator.c
index 0433ea6..b798919 100644
--- a/drivers/scsi/osd/osd_initiator.c
+++ b/drivers/scsi/osd/osd_initiator.c
@@ -951,8 +951,8 @@ static int _osd_req_finalize_cdb_cont(struct osd_request *or, const u8 *cap_key)
 	/* create a bio for continuation segment */
 	bio = bio_map_kern(req_q, or->cdb_cont.buff, or->cdb_cont.total_bytes,
 			   GFP_KERNEL);
-	if (unlikely(!bio))
-		return -ENOMEM;
+	if (unlikely(IS_ERR(bio)))
+		return PTR_ERR(bio);
 
 	bio->bi_rw |= REQ_WRITE;
 
