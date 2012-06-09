From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 09 Jun 2012 09:08:23 +0000
Subject: [patch] UBIFS: change | to & in assertion
Message-Id: <20120609090823.GA877@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Artem Bityutskiy <dedekind1@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-mtd@lists.infradead.org, Adrian Hunter <adrian.hunter@intel.com>

The asserts here never check anything because it uses '|' instead of
'&'.  Now if the flags are not set it prints a warning a a stack trace.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Static checker stuff.  I have not tested this and it really does need to
be tested.

diff --git a/fs/ubifs/find.c b/fs/ubifs/find.c
index 2559d17..28ec13a 100644
--- a/fs/ubifs/find.c
+++ b/fs/ubifs/find.c
@@ -939,8 +939,8 @@ static int find_dirtiest_idx_leb(struct ubifs_info *c)
 	}
 	dbg_find("LEB %d, dirty %d and free %d flags %#x", lp->lnum, lp->dirty,
 		 lp->free, lp->flags);
-	ubifs_assert(lp->flags | LPROPS_TAKEN);
-	ubifs_assert(lp->flags | LPROPS_INDEX);
+	ubifs_assert(lp->flags & LPROPS_TAKEN);
+	ubifs_assert(lp->flags & LPROPS_INDEX);
 	return lnum;
 }
 
