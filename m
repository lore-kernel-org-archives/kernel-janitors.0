From: Julia Lawall <julia@diku.dk>
Date: Mon, 27 Jul 2009 16:13:48 +0000
Subject: [PATCH 5/12] drivers/parisc: Correct redundant test
Message-Id: <Pine.LNX.4.64.0907271813310.2682@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kyle@mcmartin.ca, deller@gmx.de, linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

pa_pdc_cell has already been tested.  It seems that this test should be on the
recently returned value io_pdc_cell.

A simplified version of the semantic match that finds this problem is as
follows: (http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@r exists@
local idexpression x;
expression E;
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
 drivers/parisc/lba_pci.c            |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/parisc/lba_pci.c b/drivers/parisc/lba_pci.c
index ede6146..3aeb327 100644
--- a/drivers/parisc/lba_pci.c
+++ b/drivers/parisc/lba_pci.c
@@ -992,7 +992,7 @@ lba_pat_resources(struct parisc_device *pa_dev, struct lba_device *lba_dev)
 		return;
 
 	io_pdc_cell = kzalloc(sizeof(pdc_pat_cell_mod_maddr_block_t), GFP_KERNEL);
-	if (!pa_pdc_cell) {
+	if (!io_pdc_cell) {
 		kfree(pa_pdc_cell);
 		return;
 	}
