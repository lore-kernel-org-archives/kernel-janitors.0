From: Julia Lawall <julia@diku.dk>
Date: Sun, 21 Dec 2008 15:37:55 +0000
Subject: [PATCH 5/13] drivers/net/ehea: Remove redundant test
Message-Id: <Pine.LNX.4.64.0812211637370.9555@pc-004.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jgarzik@pobox.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

In each case, vpage is checked not to be NULL just after it is initialized
at the beginning of each loop iteration.

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
 drivers/net/ehea/ehea_qmr.c         |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ehea/ehea_qmr.c b/drivers/net/ehea/ehea_qmr.c
index 3c0ec82..e8c952b 100644
--- a/drivers/net/ehea/ehea_qmr.c
+++ b/drivers/net/ehea/ehea_qmr.c
@@ -182,7 +182,7 @@ struct ehea_cq *ehea_create_cq(struct ehea_adapter *adapter,
 				goto out_kill_hwq;
 			}
 		} else {
-			if ((hret != H_PAGE_REGISTERED) || (!vpage)) {
+			if (hret != H_PAGE_REGISTERED) {
 				ehea_error("CQ: registration of page failed "
 					   "hret=%lx\n", hret);
 				goto out_kill_hwq;
@@ -303,7 +303,7 @@ struct ehea_eq *ehea_create_eq(struct ehea_adapter *adapter,
 				goto out_kill_hwq;
 
 		} else {
-			if ((hret != H_PAGE_REGISTERED) || (!vpage))
+			if (hret != H_PAGE_REGISTERED)
 				goto out_kill_hwq;
 
 		}
