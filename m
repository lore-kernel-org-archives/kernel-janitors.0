From: Colin King <colin.king@canonical.com>
Date: Mon, 16 Jul 2018 14:09:07 +0000
Subject: [PATCH] hpfs: remove unnecessary checks on the value of r when assigning error code
Message-Id: <20180716140907.9805-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>, linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

At the point where r is being checked for different values, r is always
going to be equal to 2 as the previous if statements jump to end or end1
if r is not 2.  Hence the assignment to err can be simplified to just
err an assignment without any checks on the value or r.

Detected by CoverityScan, CID#1226737 ("Logically dead code")

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 fs/hpfs/namei.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/hpfs/namei.c b/fs/hpfs/namei.c
index a3615e4c730d..03aded219896 100644
--- a/fs/hpfs/namei.c
+++ b/fs/hpfs/namei.c
@@ -565,7 +565,7 @@ static int hpfs_rename(struct inode *old_dir, struct dentry *old_dentry,
 			err = -EFSERROR;
 			goto end1;
 		}
-		err = r = 2 ? -ENOSPC : r = 1 ? -EFSERROR : 0;
+		err = -ENOSPC;
 		goto end1;
 	}
 
-- 
2.17.1

