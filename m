From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 03 Nov 2012 10:58:33 +0000
Subject: [PATCH 12/16] fs/logfs/gc.c: use WARN
Message-Id: <1351940317-14812-13-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1351940317-14812-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1351940317-14812-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joern Engel <joern@logfs.org>
Cc: kernel-janitors@vger.kernel.org, Prasad Joshi <prasadjoshi.linux@gmail.com>, logfs@logfs.org, linux-kernel@vger.kernel.org

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
 fs/logfs/gc.c |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/logfs/gc.c b/fs/logfs/gc.c
index d4efb06..62dee03 100644
--- a/fs/logfs/gc.c
+++ b/fs/logfs/gc.c
@@ -55,9 +55,8 @@ static u8 root_distance(struct super_block *sb, gc_level_t __gc_level)
 		/* inode file data or indirect blocks */
 		return super->s_ifile_levels - (gc_level - 6);
 	default:
-		printk(KERN_ERR"LOGFS: segment of unknown level %x found\n",
+		WARN(1, KERN_ERR "LOGFS: segment of unknown level %x found\n",
 				gc_level);
-		WARN_ON(1);
 		return super->s_ifile_levels + super->s_iblock_levels;
 	}
 }
