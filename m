From: Julia Lawall <julia@diku.dk>
Date: Sun, 13 Dec 2009 11:40:55 +0000
Subject: [PATCH 2/9] drivers/atm: Correct code taking the size of a pointer
Message-Id: <Pine.LNX.4.64.0912131240400.24267@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: chas@cmf.nrl.navy.mil, linux-atm-general@lists.sourceforge.net, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

sizeof(TstSchedTbl) is just the size of the pointer.  Change it to the size
of the referenced data.

A simplified version of the semantic patch that finds this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@@
expression *x;
expression f;
type T;
@@

*f(...,(T)x,...)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/atm/iphase.c                |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/atm/iphase.c b/drivers/atm/iphase.c
index f734b34..6b73c2b 100644
--- a/drivers/atm/iphase.c
+++ b/drivers/atm/iphase.c
@@ -557,7 +557,7 @@ static int ia_cbr_setup (IADEV *dev, struct atm_vcc *vcc) {
           memcpy((caddr_t)&cbrVC,(caddr_t)TstSchedTbl,sizeof(cbrVC));
        } /* while */
        // Move this VCI number into this location of the CBR Sched table.
-       memcpy((caddr_t)TstSchedTbl, (caddr_t)&vcIndex,sizeof(TstSchedTbl));
+       memcpy((caddr_t)TstSchedTbl, (caddr_t)&vcIndex, sizeof(*TstSchedTbl));
        dev->CbrRemEntries--;
        toBeAssigned--;
    } /* while */ 
