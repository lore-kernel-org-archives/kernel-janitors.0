From: Nicolas Kaiser <nikai@nikai.net>
Date: Sun, 11 Nov 2007 11:51:32 +0000
Subject: [PATCH] fs/hfs: remove duplicated defines
Message-Id: <20071111125132.1ce29211@lucky.kitzblitz>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Roman Zippel <zippel@linux-m68k.org>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Remove duplicated defines.

Signed-off-by: Nicolas Kaiser <nikai@nikai.net>
---

 fs/hfs/btree.h |    5 -----
 1 file changed, 5 deletions(-)

--- a/fs/hfs/btree.h	2007-10-09 22:31:38.000000000 +0200
+++ b/fs/hfs/btree.h	2007-11-11 12:42:59.000000000 +0100
@@ -153,11 +153,6 @@
 	u32 reserved3[16];
 } __packed;
 
-#define HFS_NODE_INDEX	0x00	/* An internal (index) node */
-#define HFS_NODE_HEADER	0x01	/* The tree header node (node 0) */
-#define HFS_NODE_MAP		0x02	/* Holds part of the bitmap of used nodes */
-#define HFS_NODE_LEAF		0xFF	/* A leaf (ndNHeight=1) node */
-
 #define BTREE_ATTR_BADCLOSE	0x00000001	/* b-tree not closed properly. not
 						   used by hfsplus. */
 #define HFS_TREE_BIGKEYS	0x00000002	/* key length is u16 instead of u8.
