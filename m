From: Julia Lawall <julia@diku.dk>
Date: Sun, 17 Feb 2008 17:56:18 +0000
Subject: [PATCH 4/7] fs/udf/truncate.c: Use BUG_ON
Message-Id: <Pine.LNX.4.64.0802171855510.28055@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: bfennema@falcon.csc.calpoly.edu, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

if (...) BUG(); should be replaced with BUG_ON(...) when the test has no
side-effects to allow a definition of BUG_ON that drops the code completely.

The semantic patch that makes this change is as follows:
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@ disable unlikely @ expression E,f; @@

(
  if (<... f(...) ...>) { BUG(); }
|
- if (unlikely(E)) { BUG(); }
+ BUG_ON(E);
)

@@ expression E,f; @@

(
  if (<... f(...) ...>) { BUG(); }
|
- if (E) { BUG(); }
+ BUG_ON(E);
)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---

diff -u -p a/fs/udf/truncate.c b/fs/udf/truncate.c
--- a/fs/udf/truncate.c 2008-02-10 22:34:15.000000000 +0100
+++ b/fs/udf/truncate.c 2008-02-17 16:41:19.000000000 +0100
@@ -224,8 +224,7 @@ void udf_truncate_extents(struct inode *
 				if (indirect_ext_len) {
 					/* We managed to free all extents in the
 					 * indirect extent - free it too */
-					if (!epos.bh)
-						BUG();
+					BUG_ON(!epos.bh);
 					udf_free_blocks(sb, inode, epos.block,
 							0, indirect_ext_len);
 				} else {
@@ -272,8 +271,7 @@ void udf_truncate_extents(struct inode *
 		}
 
 		if (indirect_ext_len) {
-			if (!epos.bh)
-				BUG();
+			BUG_ON(!epos.bh);
 			udf_free_blocks(sb, inode, epos.block, 0,
 					indirect_ext_len);
 		} else {
