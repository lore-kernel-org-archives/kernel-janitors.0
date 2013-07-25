From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 25 Jul 2013 09:27:42 +0000
Subject: [patch] affs: use loff_t in affs_truncate()
Message-Id: <20130725092742.GB15116@longonot.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marco Stornelli <marco.stornelli@gmail.com>
Cc: Al Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org, kernel-janitors@vger.kernel.org

It seems pretty unlikely that AFFS supports files over 4GB but we may as
well leave use loff_t just for cleanness sake instead of truncating it
to 32 bits.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/affs/file.c b/fs/affs/file.c
index af3261b..776e393 100644
--- a/fs/affs/file.c
+++ b/fs/affs/file.c
@@ -836,7 +836,7 @@ affs_truncate(struct inode *inode)
 		struct address_space *mapping = inode->i_mapping;
 		struct page *page;
 		void *fsdata;
-		u32 size = inode->i_size;
+		loff_t size = inode->i_size;
 		int res;
 
 		res = mapping->a_ops->write_begin(NULL, mapping, size, 0, 0, &page, &fsdata);
