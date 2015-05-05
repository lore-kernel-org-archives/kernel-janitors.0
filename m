From: Adir Kuhn <adirkuhn@gmail.com>
Date: Tue, 05 May 2015 01:51:32 +0000
Subject: [PATCH 4/4] fs: ext4: dir: Removing indent on label
Message-Id: <1430790692-5679-5-git-send-email-adirkuhn@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Removing indent on label

Signed-off-by: Adir Kuhn <adirkuhn@gmail.com>
---
 fs/ext4/dir.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ext4/dir.c b/fs/ext4/dir.c
index 5c730bd..6573cef 100644
--- a/fs/ext4/dir.c
+++ b/fs/ext4/dir.c
@@ -579,7 +579,7 @@ static int ext4_dx_readdir(struct file *file, struct dir_context *ctx)
 		info->curr_minor_hash = fname->minor_hash;
 		if (call_filldir(file, ctx, fname))
 			break;
-	next_node:
+next_node:
 		info->curr_node = rb_next(info->curr_node);
 		if (info->curr_node) {
 			fname = rb_entry(info->curr_node, struct fname,
--
2.1.4

