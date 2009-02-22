From: Hannes Eder <hannes@hanneseder.net>
Date: Sun, 22 Feb 2009 00:05:13 +0000
Subject: [PATCH 12/16] reiserfs: fix sparse warning: Using plain integer as
Message-Id: <20090222000511.17557.96434.stgit@vmbox.hanneseder.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090221235706.17557.97714.stgit@vmbox.hanneseder.net>
In-Reply-To: <20090221235706.17557.97714.stgit@vmbox.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: trivial@kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Fix this sparse warning:
  fs/reiserfs/inode.c:2555:19: warning: Using plain integer as NULL pointer

Signed-off-by: Hannes Eder <hannes@hanneseder.net>
---
 fs/reiserfs/inode.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/fs/reiserfs/inode.c b/fs/reiserfs/inode.c
index 823227a..e69d63a 100644
--- a/fs/reiserfs/inode.c
+++ b/fs/reiserfs/inode.c
@@ -2552,7 +2552,7 @@ static int reiserfs_write_begin(struct file *file,
 	int old_ref = 0;
 
  	inode = mapping->host;
-	*fsdata = 0;
+	*fsdata = NULL;
  	if (flags & AOP_FLAG_CONT_EXPAND &&
  	    (pos & (inode->i_sb->s_blocksize - 1)) = 0) {
  		pos ++;

