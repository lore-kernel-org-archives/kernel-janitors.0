From: Colin King <colin.king@canonical.com>
Date: Tue, 17 Oct 2017 14:02:58 +0000
Subject: [PATCH] fat: remove redundant assignment of 0 to slots
Message-Id: <20171017140258.22536-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable slots is being assigned a value of zero that is never
read, slots is being updated again a few lines later. Remove this
redundant assignment.
Cleans clang warning: Value stored to 'slots' is never read

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 fs/fat/dir.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/fs/fat/dir.c b/fs/fat/dir.c
index 81cecbe6d7cf..b833ffeee1e1 100644
--- a/fs/fat/dir.c
+++ b/fs/fat/dir.c
@@ -291,7 +291,6 @@ static int fat_parse_long(struct inode *dir, loff_t *pos,
 		}
 	}
 parse_long:
-	slots = 0;
 	ds = (struct msdos_dir_slot *)*de;
 	id = ds->id;
 	if (!(id & 0x40))
-- 
2.14.1

