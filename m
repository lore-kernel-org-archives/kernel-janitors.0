From: Colin King <colin.king@canonical.com>
Date: Thu, 14 Nov 2019 09:42:26 +0000
Subject: [PATCH] jffs2: fix indentation issue
Message-Id: <20191114094226.131317-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Woodhouse <dwmw2@infradead.org>, Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There are a couple of debug statements that are indented
too deeply, remove the extraneous tabs.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 fs/jffs2/nodemgmt.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/fs/jffs2/nodemgmt.c b/fs/jffs2/nodemgmt.c
index a7bbe879cfc3..4699a4ab519f 100644
--- a/fs/jffs2/nodemgmt.c
+++ b/fs/jffs2/nodemgmt.c
@@ -624,8 +624,8 @@ void jffs2_mark_node_obsolete(struct jffs2_sb_info *c, struct jffs2_raw_node_ref
 					  ref->flash_offset, jeb->used_size);
 			BUG();
 		})
-			jffs2_dbg(1, "Obsoleting previously unchecked node at 0x%08x of len %x\n",
-				  ref_offset(ref), freed_len);
+		jffs2_dbg(1, "Obsoleting previously unchecked node at 0x%08x of len %x\n",
+			  ref_offset(ref), freed_len);
 		jeb->unchecked_size -= freed_len;
 		c->unchecked_size -= freed_len;
 	} else {
@@ -635,8 +635,8 @@ void jffs2_mark_node_obsolete(struct jffs2_sb_info *c, struct jffs2_raw_node_ref
 					  ref->flash_offset, jeb->used_size);
 			BUG();
 		})
-			jffs2_dbg(1, "Obsoleting node at 0x%08x of len %#x: ",
-				  ref_offset(ref), freed_len);
+		jffs2_dbg(1, "Obsoleting node at 0x%08x of len %#x: ",
+			  ref_offset(ref), freed_len);
 		jeb->used_size -= freed_len;
 		c->used_size -= freed_len;
 	}
-- 
2.20.1
