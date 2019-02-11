From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 11 Feb 2019 18:45:14 +0000
Subject: [PATCH] f2fs: don't allow negative ->write_io_size_bits
Message-Id: <20190211184514.GA22212@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: kernel-janitors@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net

We put an upper bound on ->write_io_size_bits but we don't have a lower
bound.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 fs/f2fs/super.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 3ec11d392a5e..2db2d38e2aca 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -586,7 +586,7 @@ static int parse_options(struct super_block *sb, char *options)
 		case Opt_io_size_bits:
 			if (args->from && match_int(args, &arg))
 				return -EINVAL;
-			if (arg > __ilog2_u32(BIO_MAX_PAGES)) {
+			if (arg < 0 || arg > __ilog2_u32(BIO_MAX_PAGES)) {
 				f2fs_msg(sb, KERN_WARNING,
 					"Not support %d, larger than %d",
 					1 << arg, BIO_MAX_PAGES);
-- 
2.17.1
