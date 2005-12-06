From: Nicolas Kaiser <nikai@nikai.net>
Date: Tue, 06 Dec 2005 14:08:23 +0000
Subject: [KJ] [PATCH] fs/block_dev.c: add unsigned declaration to ints that
Message-Id: <20051206150823.1b23c14f@lucky.kitzblitz>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============83695311398287409=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============83695311398287409==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

add unsigned declaration to ints that can't go negative

Signed-off-by: Nicolas Kaiser <nikai@nikai.net>
---
 block_dev.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- a/fs/block_dev.c	2005-10-02 15:53:44.000000000 +0200
+++ b/fs/block_dev.c	2005-12-06 14:23:20.000000000 +0100
@@ -86,7 +86,7 @@ EXPORT_SYMBOL(set_blocksize);
 
 int sb_set_blocksize(struct super_block *sb, int size)
 {
-	int bits = 9; /* 2^9 = 512 */
+	unsigned int bits = 9; /* 2^9 = 512 */
 
 	if (set_blocksize(sb->s_bdev, size))
 		return 0;
@@ -103,7 +103,7 @@ EXPORT_SYMBOL(sb_set_blocksize);
 
 int sb_min_blocksize(struct super_block *sb, int size)
 {
-	int minsize = bdev_hardsect_size(sb->s_bdev);
+	unsigned int minsize = bdev_hardsect_size(sb->s_bdev);
 	if (size < minsize)
 		size = minsize;
 	return sb_set_blocksize(sb, size);

--===============83695311398287409==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============83695311398287409==--
