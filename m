From: Adir Kuhn <adirkuhn@gmail.com>
Date: Tue, 05 May 2015 01:51:30 +0000
Subject: [PATCH 2/4] fs: ext4: dir: Added a blank line after declaration
Message-Id: <1430790692-5679-3-git-send-email-adirkuhn@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Added a blank line after declaration

Signed-off-by: Adir Kuhn <adirkuhn@gmail.com>
---
 fs/ext4/dir.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/ext4/dir.c b/fs/ext4/dir.c
index b81ffae..89fa42b 100644
--- a/fs/ext4/dir.c
+++ b/fs/ext4/dir.c
@@ -128,6 +128,7 @@ static int ext4_readdir(struct file *file, struct dir_context *ctx)

 	if (ext4_has_inline_data(inode)) {
 		int has_inline_data = 1;
+
 		err = ext4_read_inline_dir(file, ctx,
 					   &has_inline_data);
 		if (has_inline_data)
--
2.1.4

