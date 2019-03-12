From: Mikulas Patocka <mikulas@twibright.com>
Date: Tue, 12 Mar 2019 13:40:14 +0000
Subject: [PATCH] hpfs: fix spelling mistake "partion" -> "partition"
Message-Id: <alpine.DEB.2.20.1903121438550.23788@leontynka>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.DEB.2.20.1903111202460.3466@leontynka>
In-Reply-To: <alpine.DEB.2.20.1903111202460.3466@leontynka>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistakes in comments

Signed-off-by: Colin Ian King <colin.king@canonical.com>
Signed-off-by: Mikulas Patocka <mikulas@twibright.com>

---
 fs/hpfs/hpfs.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/fs/hpfs/hpfs.h b/fs/hpfs/hpfs.h
index 823a328791c0..302f45101a96 100644
--- a/fs/hpfs/hpfs.h
+++ b/fs/hpfs/hpfs.h
@@ -120,11 +120,11 @@ struct hpfs_spare_block
   u8 bad_sector: 1;			/* bad sector, corrupted disk (???) */
   u8 bad_bitmap: 1;			/* bad bitmap */
   u8 fast: 1;				/* partition was fast formatted */
-  u8 old_wrote: 1;			/* old version wrote to partion */
-  u8 old_wrote_1: 1;			/* old version wrote to partion (?) */
+  u8 old_wrote: 1;			/* old version wrote to partition */
+  u8 old_wrote_1: 1;			/* old version wrote to partition (?) */
 #else
-  u8 old_wrote_1: 1;			/* old version wrote to partion (?) */
-  u8 old_wrote: 1;			/* old version wrote to partion */
+  u8 old_wrote_1: 1;			/* old version wrote to partition (?) */
+  u8 old_wrote: 1;			/* old version wrote to partition */
   u8 fast: 1;				/* partition was fast formatted */
   u8 bad_bitmap: 1;			/* bad bitmap */
   u8 bad_sector: 1;			/* bad sector, corrupted disk (???) */
-- 
2.17.1
