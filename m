From: Dan Carpenter <error27@gmail.com>
Date: Thu, 23 Dec 2010 19:09:11 +0000
Subject: [patch] ext4: testing the wrong variable in ext4_init_pageio()
Message-Id: <20101223190911.GM1936@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Theodore Ts'o <tytso@mit.edu>
Cc: Andreas Dilger <adilger.kernel@dilger.ca>, linux-ext4@vger.kernel.org, kernel-janitors@vger.kernel.org

This is a copy and paste error.  The intent was to check
"io_page_cachep".  We tested "io_page_cachep" earlier.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/fs/ext4/page-io.c b/fs/ext4/page-io.c
index beacce1..857abc6 100644
--- a/fs/ext4/page-io.c
+++ b/fs/ext4/page-io.c
@@ -44,7 +44,7 @@ int __init ext4_init_pageio(void)
 	if (io_page_cachep = NULL)
 		return -ENOMEM;
 	io_end_cachep = KMEM_CACHE(ext4_io_end, SLAB_RECLAIM_ACCOUNT);
-	if (io_page_cachep = NULL) {
+	if (io_end_cachep = NULL) {
 		kmem_cache_destroy(io_page_cachep);
 		return -ENOMEM;
 	}
