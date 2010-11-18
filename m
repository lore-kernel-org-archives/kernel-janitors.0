From: Dan Carpenter <error27@gmail.com>
Date: Thu, 18 Nov 2010 03:58:04 +0000
Subject: [patch] UBI: release locks in check_corruption()
Message-Id: <20101118035804.GM31724@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Artem Bityutskiy <dedekind1@gmail.com>
Cc: linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>

Commit 45aafd32996e27 "UBI: tighten the corrupted PEB criteria"
introduced some return paths that didn't release the ubi->buf_mutex;

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/mtd/ubi/scan.c b/drivers/mtd/ubi/scan.c
index 3c63186..204345b 100644
--- a/drivers/mtd/ubi/scan.c
+++ b/drivers/mtd/ubi/scan.c
@@ -787,16 +787,15 @@ static int check_corruption(struct ubi_device *ubi, struct ubi_vid_hdr *vid_hdr,
 		 * erased, so it became unstable and corrupted, and should be
 		 * erased.
 		 */
-		return 0;
+		err = 0;
+		goto out_unlock;
 	}
 
 	if (err)
-		return err;
+		goto out_unlock;
 
-	if (ubi_check_pattern(ubi->peb_buf1, 0xFF, ubi->leb_size)) {
-		mutex_unlock(&ubi->buf_mutex);
-		return 0;
-	}
+	if (ubi_check_pattern(ubi->peb_buf1, 0xFF, ubi->leb_size))
+		goto out_unlock;
 
 	ubi_err("PEB %d contains corrupted VID header, and the data does not "
 		"contain all 0xFF, this may be a non-UBI PEB or a severe VID "
@@ -806,8 +805,11 @@ static int check_corruption(struct ubi_device *ubi, struct ubi_vid_hdr *vid_hdr,
 		pnum, ubi->leb_start, ubi->leb_size);
 	ubi_dbg_print_hex_dump(KERN_DEBUG, "", DUMP_PREFIX_OFFSET, 32, 1,
 			       ubi->peb_buf1, ubi->leb_size, 1);
+	err = 1;
+
+out_unlock:
 	mutex_unlock(&ubi->buf_mutex);
-	return 1;
+	return err;
 }
 
 /**
