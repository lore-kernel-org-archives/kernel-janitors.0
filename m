From: Hannes Eder <hannes@hanneseder.net>
Date: Sun, 22 Feb 2009 00:05:03 +0000
Subject: [PATCH 11/16] fs/super.c: fix sparse warning: Using plain integer as
Message-Id: <20090222000459.17557.20005.stgit@vmbox.hanneseder.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090221235706.17557.97714.stgit@vmbox.hanneseder.net>
In-Reply-To: <20090221235706.17557.97714.stgit@vmbox.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: trivial@kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Fix this sparse warning:
  fs/super.c:849:26: warning: Using plain integer as NULL pointer

Signed-off-by: Hannes Eder <hannes@hanneseder.net>
---
 fs/super.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/fs/super.c b/fs/super.c
index c38eef4..c6ad02d 100644
--- a/fs/super.c
+++ b/fs/super.c
@@ -846,7 +846,7 @@ void kill_block_super(struct super_block *sb)
 	struct block_device *bdev = sb->s_bdev;
 	fmode_t mode = sb->s_mode;
 
-	bdev->bd_super = 0;
+	bdev->bd_super = NULL;
 	generic_shutdown_super(sb);
 	sync_blockdev(bdev);
 	close_bdev_exclusive(bdev, mode);

