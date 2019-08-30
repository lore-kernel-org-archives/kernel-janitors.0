From: Colin King <colin.king@canonical.com>
Date: Fri, 30 Aug 2019 17:50:50 +0000
Subject: [PATCH] staging: exfat: check for null return from call to FAT_getblk
Message-Id: <20190830175050.12706-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Valdis Kletnieks <valdis.kletnieks@vt.edu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

A call to FAT_getblk is missing a null return check which can
lead to a null pointer dereference.  Fix this by adding a null
check to match all the other FAT_getblk return sanity checks.

Addresses-Coverity: ("Dereference null return")
Fixes: c48c9f7ff32b ("staging: exfat: add exfat filesystem code to staging")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/exfat/exfat_cache.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/exfat/exfat_cache.c b/drivers/staging/exfat/exfat_cache.c
index f05d692c2b1e..1565ce65d39f 100644
--- a/drivers/staging/exfat/exfat_cache.c
+++ b/drivers/staging/exfat/exfat_cache.c
@@ -369,6 +369,8 @@ static s32 __FAT_write(struct super_block *sb, u32 loc, u32 content)
 				FAT_modify(sb, sec);
 
 				fat_sector = FAT_getblk(sb, ++sec);
+				if (!fat_sector)
+					return -1;
 				fat_sector[0] = (u8)((fat_sector[0] & 0xF0) |
 						     (content >> 8));
 			} else {
-- 
2.20.1
