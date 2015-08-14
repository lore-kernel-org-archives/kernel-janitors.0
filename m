From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 14 Aug 2015 09:47:32 +0000
Subject: [patch 2/2] ext4: silence a format string false positive
Message-Id: <20150814094732.GB14179@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <3FC4DED5-76F2-45DE-8E01-8796850CB120@dilger.ca>
In-Reply-To: <3FC4DED5-76F2-45DE-8E01-8796850CB120@dilger.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Theodore Ts'o <tytso@mit.edu>
Cc: Andreas Dilger <adilger.kernel@dilger.ca>, linux-ext4@vger.kernel.org, kernel-janitors@vger.kernel.org

Static checkers complain that the format string should be "%s".  It does
not make a difference for the current code.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/ext4/mmp.c b/fs/ext4/mmp.c
index 0880ec9..8b72634 100644
--- a/fs/ext4/mmp.c
+++ b/fs/ext4/mmp.c
@@ -115,7 +115,7 @@ warn_exit:
 void __dump_mmp_msg(struct super_block *sb, struct mmp_struct *mmp,
 		    const char *function, unsigned int line, const char *msg)
 {
-	__ext4_warning(sb, function, line, msg);
+	__ext4_warning(sb, function, line, "%s", msg);
 	__ext4_warning(sb, function, line,
 		       "MMP failure info: last update time: %llu, last update "
 		       "node: %s, last update device: %s\n",
