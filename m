From: Julia Lawall <julia@diku.dk>
Date: Wed, 26 May 2010 15:57:23 +0000
Subject: [PATCH 11/17] fs/xfs/quota: Add missing mutex_unlock
Message-Id: <Pine.LNX.4.64.1005261757050.23743@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Elder <aelder@sgi.com>, xfs-masters@oss.sgi.com, xfs@oss.sgi.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Add a mutex_unlock missing on the error path.  The use of this lock is
balanced elsewhere in the file.

The semantic match that finds this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
expression E1;
@@

* mutex_lock(E1,...);
  <+... when != E1
  if (...) {
    ... when != E1
*   return ...;
  }
  ...+>
* mutex_unlock(E1,...);
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
The use of ENOMEM rather than -ENOMEM is also a bit odd.

 fs/xfs/quota/xfs_qm.c |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/xfs/quota/xfs_qm.c b/fs/xfs/quota/xfs_qm.c
index 38e7641..2d8b7bc 100644
--- a/fs/xfs/quota/xfs_qm.c
+++ b/fs/xfs/quota/xfs_qm.c
@@ -249,8 +249,10 @@ xfs_qm_hold_quotafs_ref(
 
 	if (!xfs_Gqm) {
 		xfs_Gqm = xfs_Gqm_init();
-		if (!xfs_Gqm)
+		if (!xfs_Gqm) {
+			mutex_unlock(&xfs_Gqm_lock);
 			return ENOMEM;
+		}
 	}
 
 	/*
