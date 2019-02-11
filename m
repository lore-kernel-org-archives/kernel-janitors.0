From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 11 Feb 2019 18:44:59 +0000
Subject: [PATCH] ext4: prevent very high s_inode_readahead_blks
Message-Id: <20190211184459.GB22106@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Theodore Ts'o <tytso@mit.edu>
Cc: Andreas Dilger <adilger.kernel@dilger.ca>, linux-ext4@vger.kernel.org, kernel-janitors@vger.kernel.org

My static checker complains that "arg" can be negative.  That does seem
possible.  I don't know if it causes an issue at run time but it seems
safest to allow negatives.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 fs/ext4/super.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ext4/super.c b/fs/ext4/super.c
index 60da0a6e4d86..4e0845708c52 100644
--- a/fs/ext4/super.c
+++ b/fs/ext4/super.c
@@ -1838,7 +1838,7 @@ static int handle_mount_opt(struct super_block *sb, char *opt, int token,
 	} else if (token = Opt_min_batch_time) {
 		sbi->s_min_batch_time = arg;
 	} else if (token = Opt_inode_readahead_blks) {
-		if (arg && (arg > (1 << 30) || !is_power_of_2(arg))) {
+		if (arg && (arg > (1U << 30) || !is_power_of_2(arg))) {
 			ext4_msg(sb, KERN_ERR,
 				 "EXT4-fs: inode_readahead_blks must be "
 				 "0 or a power of 2 smaller than 2^31");
-- 
2.17.1
