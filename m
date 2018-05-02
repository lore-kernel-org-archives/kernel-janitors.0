From: Colin King <colin.king@canonical.com>
Date: Wed, 02 May 2018 09:39:37 +0000
Subject: [PATCH] ntfs: fix spelling mistake: "initiailized" -> "initialized"
Message-Id: <20180502093937.26748-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Anton Altaparmakov <anton@tuxera.com>, linux-ntfs-dev@lists.sourceforge.net
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in ntfs_debug debug message

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 fs/ntfs/mft.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ntfs/mft.c b/fs/ntfs/mft.c
index 32c523cf5a2d..8e76f64d9784 100644
--- a/fs/ntfs/mft.c
+++ b/fs/ntfs/mft.c
@@ -1586,7 +1586,7 @@ static int ntfs_mft_bitmap_extend_initialized_nolock(ntfs_volume *vol)
 	ATTR_RECORD *a;
 	int ret;
 
-	ntfs_debug("Extending mft bitmap initiailized (and data) size.");
+	ntfs_debug("Extending mft bitmap initialized (and data) size.");
 	mft_ni = NTFS_I(vol->mft_ino);
 	mftbmp_vi = vol->mftbmp_ino;
 	mftbmp_ni = NTFS_I(mftbmp_vi);
-- 
2.17.0

