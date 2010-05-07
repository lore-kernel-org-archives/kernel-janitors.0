From: Dan Carpenter <error27@gmail.com>
Date: Fri, 07 May 2010 09:54:14 +0000
Subject: [patch v2] bio-integrity: use hardware sectors instead of block
Message-Id: <20100507095414.GH27064@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100507082928.GT27064@bicker>
In-Reply-To: <20100507082928.GT27064@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Jens Axboe <jens.axboe@oracle.com>, Chuck Ebbert <cebbert@redhat.com>, linux-fsdevel@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>, kernel-janitors@vger.kernel.org

Smatch tagged this code as suspicious because we never use the
"nr_sectors" variable.  Looking at the code, we did intend to use 
"nr_sectors" instead of "sectors" when we call bio_integrity_mark_tail().

The difference between "sectors" and "nr_sectors" is that "sectors" is in
terms of 512 byte sectors and "nr_sectors" is in terms of hardware 
sectors.  They are only different for 4k sector devices.

Also I changed the name because as Jamie Lokier points out, "that code is
so asking for the variable to be called 'hw_sectors'."

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/fs/bio-integrity.c b/fs/bio-integrity.c
index 612a5c3..d8cd1e2 100644
--- a/fs/bio-integrity.c
+++ b/fs/bio-integrity.c
@@ -667,16 +667,16 @@ void bio_integrity_trim(struct bio *bio, unsigned int offset,
 {
 	struct bio_integrity_payload *bip = bio->bi_integrity;
 	struct blk_integrity *bi = bdev_get_integrity(bio->bi_bdev);
-	unsigned int nr_sectors;
+	unsigned int hw_sectors;
 
 	BUG_ON(bip = NULL);
 	BUG_ON(bi = NULL);
 	BUG_ON(!bio_flagged(bio, BIO_CLONED));
 
-	nr_sectors = bio_integrity_hw_sectors(bi, sectors);
+	hw_sectors = bio_integrity_hw_sectors(bi, sectors);
 	bip->bip_sector = bip->bip_sector + offset;
 	bio_integrity_mark_head(bip, offset * bi->tuple_size);
-	bio_integrity_mark_tail(bip, sectors * bi->tuple_size);
+	bio_integrity_mark_tail(bip, hw_sectors * bi->tuple_size);
 }
 EXPORT_SYMBOL(bio_integrity_trim);
 
  
