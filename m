From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 24 Jan 2020 10:15:37 +0000
Subject: [PATCH] fs/adfs: bigdir: Fix an error code in adfs_fplus_read()
Message-Id: <20200124101537.z6n242eovocfbdha@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Russell King <rmk+kernel@armlinux.org.uk>
Cc: Al Viro <viro@zeniv.linux.org.uk>, Kate Stewart <kstewart@linuxfoundation.org>, Enrico Weigelt <info@metux.net>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

This code accidentally returns success, but it should return the
-EIO error code from adfs_fplus_validate_header().

Fixes: d79288b4f61b ("fs/adfs: bigdir: calculate and validate directory checkbyte")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 fs/adfs/dir_fplus.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/adfs/dir_fplus.c b/fs/adfs/dir_fplus.c
index 48ea299b6ece..4a15924014da 100644
--- a/fs/adfs/dir_fplus.c
+++ b/fs/adfs/dir_fplus.c
@@ -114,7 +114,8 @@ static int adfs_fplus_read(struct super_block *sb, u32 indaddr,
 		return ret;
 
 	dir->bighead = h = (void *)dir->bhs[0]->b_data;
-	if (adfs_fplus_validate_header(h)) {
+	ret = adfs_fplus_validate_header(h);
+	if (ret) {
 		adfs_error(sb, "dir %06x has malformed header", indaddr);
 		goto out;
 	}
-- 
2.11.0
