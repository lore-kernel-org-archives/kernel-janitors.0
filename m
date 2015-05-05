From: Adir Kuhn <adirkuhn@gmail.com>
Date: Tue, 05 May 2015 01:51:29 +0000
Subject: [PATCH 1/4] fs: ext4: dir: Removed unnecessary braces
Message-Id: <1430790692-5679-2-git-send-email-adirkuhn@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Removed unnecessary braces

Signed-off-by: Adir Kuhn <adirkuhn@gmail.com>
---
 fs/ext4/dir.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/ext4/dir.c b/fs/ext4/dir.c
index 61db51a..b81ffae 100644
--- a/fs/ext4/dir.c
+++ b/fs/ext4/dir.c
@@ -115,9 +115,9 @@ static int ext4_readdir(struct file *file, struct dir_context *ctx)

 	if (is_dx_dir(inode)) {
 		err = ext4_dx_readdir(file, ctx);
-		if (err != ERR_BAD_DX_DIR) {
+		if (err != ERR_BAD_DX_DIR)
 			return err;
-		}
+
 		/*
 		 * We don't set the inode dirty flag since it's not
 		 * critical that it get flushed back to the disk.
--
2.1.4

