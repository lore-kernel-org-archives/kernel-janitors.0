From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 28 Aug 2014 13:13:21 +0000
Subject: [patch] f2fs: simplify by using a literal
Message-Id: <20140828131320.GA24477@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: kernel-janitors@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net

We can make the code a bit simpler because we know that "!retry" is
zero.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 0f61f5a..41bdf51 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1133,7 +1133,7 @@ free_sbi:
 
 	/* give only one another chance */
 	if (retry) {
-		retry = !retry;
+		retry = 0;
 		shrink_dcache_sb(sb);
 		goto try_onemore;
 	}
