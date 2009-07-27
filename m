From: Julia Lawall <julia@diku.dk>
Date: Mon, 27 Jul 2009 16:14:48 +0000
Subject: [PATCH 8/12] drivers/scsi/fcoe: Correct redundant test
Message-Id: <Pine.LNX.4.64.0907271814300.2682@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-scsi@vger.kernel.org, James.Bottomley@HansenPartnership.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

The second test is more general than the first one.

A simplified version of the semantic match that finds this problem is as
follows: (http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@r exists@
local idexpression x;
expression E;
position p1,p2;
@@

if (x = NULL || ...) { ... when forall
   return ...; }
... when != \(x=E\|x--\|x++\|--x\|++x\|x-=E\|x+=E\|x|=E\|x&=E\|&x\)
(
*x = NULL
|
*x != NULL
)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/scsi/fcoe/libfcoe.c         |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/drivers/scsi/fcoe/libfcoe.c b/drivers/scsi/fcoe/libfcoe.c
index f544340..ab0eb1b 100644
--- a/drivers/scsi/fcoe/libfcoe.c
+++ b/drivers/scsi/fcoe/libfcoe.c
@@ -911,8 +911,6 @@ static void fcoe_ctlr_recv_clr_vlink(struct fcoe_ctlr *fip,
 	u32	desc_mask;
 
 	LIBFCOE_FIP_DBG("Clear Virtual Link received\n");
-	if (!fcf)
-		return;
 	if (!fcf || !fc_host_port_id(lp->host))
 		return;
 
