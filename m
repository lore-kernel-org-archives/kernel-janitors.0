From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 14 Dec 2020 11:52:58 +0000
Subject: [PATCH] fs/adfs: bigdir: Fix another error code in adfs_fplus_read()
Message-Id: <X9dSGhuIWbOfmp7I@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Russell King <rmk+kernel@armlinux.org.uk>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

This should return -EINVAL if the checkbyte is wrong instead of success.

Fixes: d79288b4f61b ("fs/adfs: bigdir: calculate and validate directory checkbyte")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Sorry for not catching this one last time.  :/

 fs/adfs/dir_fplus.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/adfs/dir_fplus.c b/fs/adfs/dir_fplus.c
index 4a15924014da..a5e47c94a5b9 100644
--- a/fs/adfs/dir_fplus.c
+++ b/fs/adfs/dir_fplus.c
@@ -143,6 +143,7 @@ static int adfs_fplus_read(struct super_block *sb, u32 indaddr,
 
 	if (adfs_fplus_checkbyte(dir) != t->bigdircheckbyte) {
 		adfs_error(sb, "dir %06x checkbyte mismatch\n", indaddr);
+		ret = -EINVAL;
 		goto out;
 	}
 
-- 
2.29.2
