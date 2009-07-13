From: Julia Lawall <julia@diku.dk>
Date: Mon, 13 Jul 2009 20:43:41 +0000
Subject: [PATCH 1/4] drivers/block: adjust NULL test
Message-Id: <Pine.LNX.4.64.0907132243110.12374@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

dtp is derefenced on the lines above the test !dtp, and so it cannot be
NULL at this point.

A simplified version of the semantic match that finds this problem is as
follows: (http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@r@
expression x,E,E1;
identifier f,l;
position p1,p2;
@@

*x@p1->f = E1;
... when != x = E
    when != goto l;
(
*x@p2 = NULL
|
*x@p2 != NULL
)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/block/ataflop.c             |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/block/ataflop.c b/drivers/block/ataflop.c
index f5e7180..3ff0294 100644
--- a/drivers/block/ataflop.c
+++ b/drivers/block/ataflop.c
@@ -1627,7 +1627,7 @@ static int fd_ioctl(struct block_device *bdev, fmode_t mode,
 				drive, dtp->blocks, dtp->spt, dtp->stretch);
 
 		/* sanity check */
-		if (!dtp || setprm.track != dtp->blocks/dtp->spt/2 ||
+		if (setprm.track != dtp->blocks/dtp->spt/2 ||
 		    setprm.head != 2) {
 			redo_fd_request();
 			return -EINVAL;
