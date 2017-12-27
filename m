From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Wed, 27 Dec 2017 14:51:37 +0000
Subject: [PATCH 04/12] ext2: drop unneeded newline
Message-Id: <1514386305-7402-5-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1514386305-7402-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1514386305-7402-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Kara <jack@suse.com>
Cc: kernel-janitors@vger.kernel.org, linux-ext4@vger.kernel.org, linux-kernel@vger.kernel.org

ext2_msg prints a newline at the end of the message string, so the message
string does not need to include a newline explicitly.  Done using
Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 fs/ext2/super.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ext2/super.c b/fs/ext2/super.c
index 0083ea5..3220035 100644
--- a/fs/ext2/super.c
+++ b/fs/ext2/super.c
@@ -1226,7 +1226,7 @@ static void ext2_clear_super_error(struct super_block *sb)
 		 * write and hope for the best.
 		 */
 		ext2_msg(sb, KERN_ERR,
-		       "previous I/O error to superblock detected\n");
+		       "previous I/O error to superblock detected");
 		clear_buffer_write_io_error(sbh);
 		set_buffer_uptodate(sbh);
 	}

