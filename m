From: Julia Lawall <julia@diku.dk>
Date: Sun, 21 Dec 2008 16:45:44 +0000
Subject: Re: [PATCH 9/13] fs/xfs: Remove redundant test
Message-Id: <Pine.LNX.4.64.0812211745210.9555@pc-004.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0812211640360.9555@pc-004.diku.dk>
	<494E6846.8070800@sandeen.net>
	<Pine.LNX.4.64.0812211737180.9555@pc-004.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0812211737180.9555@pc-004.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Eric Sandeen <sandeen@sandeen.net>
Cc: xfs-masters@oss.sgi.com, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, xfs@oss.sgi.com

From: Julia Lawall <julia@diku.dk>

In fs/xfs/xfs_trans_buf.c, bp is tested for being NULL just a few lines
above.

A simplified version of the semantic patch that makes this change is as
follows: (http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@r exists@
local idexpression x;
expression E;
position p1,p2;
@@

if (x@p1 = NULL || ...) { ... when forall
   return ...; }
... when != \(x=E\|x--\|x++\|--x\|++x\|x-=E\|x+=E\|x|=E\|x&=E\|&x\)
(
x@p2 = NULL
|
x@p2 != NULL
)

// another path to the test that is not through p1?
@s exists@
local idexpression r.x;
position r.p1,r.p2;
@@

... when != x@p1
(
x@p2 = NULL
|
x@p2 != NULL
)

@fix depends on !s@
position r.p1,r.p2;
expression x,E;
statement S1,S2;
@@

(
- if ((x@p2 != NULL) || ...)
  S1
|
- if ((x@p2 = NULL) && ...) S1
|
- BUG_ON(x@p2 = NULL);
)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 fs/xfs/xfs_trans_buf.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/xfs/xfs_trans_buf.c b/fs/xfs/xfs_trans_buf.c
index 8ee2f8c..218829e 100644
--- a/fs/xfs/xfs_trans_buf.c
+++ b/fs/xfs/xfs_trans_buf.c
@@ -307,7 +307,7 @@ xfs_trans_read_buf(
 			return (flags & XFS_BUF_TRYLOCK) ?
 					EAGAIN : XFS_ERROR(ENOMEM);
 
-		if ((bp != NULL) && (XFS_BUF_GETERROR(bp) != 0)) {
+		if (XFS_BUF_GETERROR(bp) != 0) {
 			xfs_ioerror_alert("xfs_trans_read_buf", mp,
 					  bp, blkno);
 			error = XFS_BUF_GETERROR(bp);
@@ -315,7 +315,7 @@ xfs_trans_read_buf(
 			return error;
 		}
 #ifdef DEBUG
-		if (xfs_do_error && (bp != NULL)) {
+		if (xfs_do_error) {
 			if (xfs_error_target = target) {
 				if (((xfs_req_num++) % xfs_error_mod) = 0) {
 					xfs_buf_relse(bp);
