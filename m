From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 03 Nov 2012 10:58:30 +0000
Subject: [PATCH 9/16] fs/ext4/indirect.c: use WARN
Message-Id: <1351940317-14812-10-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1351940317-14812-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1351940317-14812-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Theodore Ts'o <tytso@mit.edu>
Cc: kernel-janitors@vger.kernel.org, Andreas Dilger <adilger.kernel@dilger.ca>, linux-ext4@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

Use WARN rather than printk followed by WARN_ON(1), for conciseness.

A simplified version of the semantic patch that makes this transformation
is as follows: (http://coccinelle.lip6.fr/)

// <smpl>
@@
expression list es;
@@

-printk(
+WARN(1,
  es);
-WARN_ON(1);
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 fs/ext4/indirect.c |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/ext4/indirect.c b/fs/ext4/indirect.c
index 792e388..0cdd20f 100644
--- a/fs/ext4/indirect.c
+++ b/fs/ext4/indirect.c
@@ -354,9 +354,8 @@ static int ext4_alloc_blocks(handle_t *handle, struct inode *inode,
 			 * for the first direct block
 			 */
 			new_blocks[index] = current_block;
-			printk(KERN_INFO "%s returned more blocks than "
+			WARN(1, KERN_INFO "%s returned more blocks than "
 						"requested\n", __func__);
-			WARN_ON(1);
 			break;
 		}
 	}

