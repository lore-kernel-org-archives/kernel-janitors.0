From: Julia Lawall <julia@diku.dk>
Date: Sat, 15 Mar 2008 16:05:02 +0000
Subject: [PATCH 7/7] drivers/net/atl1/atl1_main.c: remove unused variable
Message-Id: <Pine.LNX.4.64.0803151704400.24178@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jcliburn@gmail.com, csnook@redhat.com, atl1-devel@lists.sourceforge.net, jgarzik@pobox.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

The variable update_rx is initialized but never used otherwise.

The semantic patch that makes this change is as follows:
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@@
type T;
identifier i;
constant C;
@@

(
extern T i;
|
- T i;
  <+... when != i
- i = C;
  ...+>
)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>
---
 drivers/net/atl1/atl1_main.c |    3 ---
 1 file changed, 3 deletions(-)

diff -u -p a/drivers/net/atl1/atl1_main.c b/drivers/net/atl1/atl1_main.c
--- a/drivers/net/atl1/atl1_main.c	2008-03-12 14:13:13.000000000 +0100
+++ b/drivers/net/atl1/atl1_main.c	2008-03-15 16:18:08.000000000 +0100
@@ -1765,15 +1765,12 @@ static irqreturn_t atl1_intr(int irq, vo
 {
 	struct atl1_adapter *adapter = netdev_priv(data);
 	u32 status;
-	u8 update_rx;
 	int max_ints = 10;
 
 	status = adapter->cmb.cmb->int_stats;
 	if (!status)
 		return IRQ_NONE;
 
-	update_rx = 0;
-
 	do {
 		/* clear CMB interrupt status at once */
 		adapter->cmb.cmb->int_stats = 0;
