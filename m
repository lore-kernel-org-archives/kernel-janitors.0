From: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Mon, 05 Nov 2007 11:01:13 +0000
Subject: [PATCH] Typoes:  "whith" -> "with"
Message-Id: <Pine.LNX.4.64.0711050600260.488@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

 Makefile                               |    2 +-
 drivers/isdn/hardware/eicon/debuglib.c |    2 +-
 fs/jffs2/readinode.c                   |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 188c3b6..601d007 100644
--- a/Makefile
+++ b/Makefile
@@ -1454,7 +1454,7 @@ kernelversion:
 # Single targets
 # ---------------------------------------------------------------------------
 # Single targets are compatible with:
-# - build whith mixed source and output
+# - build with mixed source and output
 # - build with separate output dir 'make O=...'
 # - external modules
 #
diff --git a/drivers/isdn/hardware/eicon/debuglib.c b/drivers/isdn/hardware/eicon/debuglib.c
index a19b7ff..e39c5c1 100644
--- a/drivers/isdn/hardware/eicon/debuglib.c
+++ b/drivers/isdn/hardware/eicon/debuglib.c
@@ -106,7 +106,7 @@ DbgRegister (char *drvName, char *drvTag, unsigned long dbgMask)
   return (1) ;
  }
 /*
- * Check if we registered whith an old maint driver (see debuglib.h)
+ * Check if we registered with an old maint driver (see debuglib.h)
  */
  if ( myDriverDebugHandle.dbg_end != NULL
    /* location of 'dbg_prt' in _OldDbgHandle_ struct */
diff --git a/fs/jffs2/readinode.c b/fs/jffs2/readinode.c
index 2eae5d2..6c1ba35 100644
--- a/fs/jffs2/readinode.c
+++ b/fs/jffs2/readinode.c
@@ -741,7 +741,7 @@ static inline int read_dnode(struct jffs2_sb_info *c, struct jffs2_raw_node_ref
 			 * are not obsolete.
 			 *
 			 * Of course, this optimization only makes sense in case
-			 * of NAND flashes (or other flashes whith
+			 * of NAND flashes (or other flashes with
 			 * !jffs2_can_mark_obsolete()), since on NOR flashes
 			 * nodes are marked obsolete physically.
 			 *

-- 
====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://crashcourse.ca
====================================
