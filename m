From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 14 May 2015 08:52:28 +0000
Subject: [patch] f2fs: cleanup a confusing indent
Message-Id: <20150514085228.GA11265@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: Changman Lee <cm224.lee@samsung.com>, linux-f2fs-devel@lists.sourceforge.net, kernel-janitors@vger.kernel.org

The return was not indented far enough so it looked like it was supposed
to go with the other if statement.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 17e89ba..741db3a 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -554,8 +554,8 @@ static void add_discard_addrs(struct f2fs_sb_info *sbi, struct cp_control *cpc)
 
 	if (!force) {
 		if (!test_opt(sbi, DISCARD) || !se->valid_blocks ||
-			SM_I(sbi)->nr_discards >= SM_I(sbi)->max_discards)
-		return;
+		    SM_I(sbi)->nr_discards >= SM_I(sbi)->max_discards)
+			return;
 	}
 
 	/* SIT_VBLOCK_MAP_SIZE should be multiple of sizeof(unsigned long) */
