From: Pete <greg.petr@gmail.com>
Date: Tue, 03 Nov 2009 05:36:09 +0000
Subject: [PATCH] fs/jfs/super.c: Fix compile warning - 'comparison of
Message-Id: <1257225849.9793.35.camel@linux-k65f.site>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

Hi,

Found a compile warning on linux-next:

fs/jfs/super.c: In function ‘jfs_fill_super’:
fs/jfs/super.c:527: warning: comparison of distinct pointer types lacks
a cast

and the corresponding fix::

Signed-off-by: Greg Petr <greg.petr@gmail.com>

diff --git a/fs/jfs/super.c b/fs/jfs/super.c
index 2234c73..3d8dbab 100644
--- a/fs/jfs/super.c
+++ b/fs/jfs/super.c
@@ -524,7 +524,8 @@ static int jfs_fill_super(struct super_block *sb,
void *data, int silent)
 	 * Page cache is indexed by long.
 	 * I would use MAX_LFS_FILESIZE, but it's only half as big
 	 */
-	sb->s_maxbytes = min(((u64) PAGE_CACHE_SIZE << 32) - 1,
sb->s_maxbytes);
+	 sb->s_maxbytes = min(((u64) PAGE_CACHE_SIZE << 32) - 1,
+				(u64)sb->s_maxbytes);
 #endif
 	sb->s_time_gran = 1;
 	return 0;

Regards.


