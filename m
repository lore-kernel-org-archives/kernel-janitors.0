From: Julia Lawall <julia@diku.dk>
Date: Sun, 21 Dec 2008 15:37:17 +0000
Subject: [PATCH 3/13] drivers/infiniband/hw/ehca: Remove redundant test
Message-Id: <Pine.LNX.4.64.0812211636550.9555@pc-004.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: rolandd@cisco.com, sean.hefty@intel.com, hal.rosenstock@gmail.com, general@lists.openfabrics.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

vpage is checked not to be NULL just after it is initialized at the
beginning of each loop iteration.

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
 drivers/infiniband/hw/ehca/ehca_eq.c           |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/infiniband/hw/ehca/ehca_eq.c b/drivers/infiniband/hw/ehca/ehca_eq.c
index 49660df..523e733 100644
--- a/drivers/infiniband/hw/ehca/ehca_eq.c
+++ b/drivers/infiniband/hw/ehca/ehca_eq.c
@@ -113,7 +113,7 @@ int ehca_create_eq(struct ehca_shca *shca,
 			if (h_ret != H_SUCCESS || vpage)
 				goto create_eq_exit2;
 		} else {
-			if (h_ret != H_PAGE_REGISTERED || !vpage)
+			if (h_ret != H_PAGE_REGISTERED)
 				goto create_eq_exit2;
 		}
 	}
