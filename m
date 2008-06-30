From: "Manish Katiyar" <mkatiyar@gmail.com>
Date: Mon, 30 Jun 2008 18:58:47 +0000
Subject: [PATCH] ext2 : Use __func__ for function names in ext2_error messages
Message-Id: <ea11fea30806301156vadc53fenfbfc0ed6978e456@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ext4@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

==============================

Signed-off-by : Manish Katiyar <mkatiyar@gmail.com>

---
 fs/ext2/dir.c |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/ext2/dir.c b/fs/ext2/dir.c
index a78c6b4..bf3c467 100644
--- a/fs/ext2/dir.c
+++ b/fs/ext2/dir.c
@@ -146,7 +146,7 @@ out:
        /* Too bad, we had an error */

 Ebadsize:
-       ext2_error(sb, "ext2_check_page",
+       ext2_error(sb, __func__,
                "size of directory #%lu is not a multiple of chunk size",
                dir->i_ino
        );
@@ -166,7 +166,7 @@ Espan:
 Einumber:
        error = "inode out of bounds";
 bad_entry:
-       ext2_error (sb, "ext2_check_page", "bad entry in directory #%lu: %s - "
+       ext2_error (sb, __func__, "bad entry in directory #%lu: %s - "
                "offset=%lu, inode=%lu, rec_len=%d, name_len=%d",
                dir->i_ino, error, (page->index<<PAGE_CACHE_SHIFT)+offs,
                (unsigned long) le32_to_cpu(p->inode),
@@ -174,7 +174,7 @@ bad_entry:
        goto fail;
 Eend:
        p = (ext2_dirent *)(kaddr + offs);
-       ext2_error (sb, "ext2_check_page",
+	ext2_error (sb, __func__,
 		"entry in directory #%lu spans the page boundary"
 		"offset=%lu, inode=%lu",
 		dir->i_ino, (page->index<<PAGE_CACHE_SHIFT)+offs,
-- 
1.5.4.3

================================-- 
Thanks & Regards,
********************************************
Manish Katiyar ( http://mkatiyar.googlepages.com )
3rd Floor, Fair Winds Block
EGL Software Park
Off Intermediate Ring Road
Bangalore 560071, India
***********************************************
