From: Julia Lawall <julia@diku.dk>
Date: Sun, 21 Dec 2008 15:41:36 +0000
Subject: [PATCH 11/13] : Remove redundant test
Message-Id: <Pine.LNX.4.64.0812211640580.9555@pc-004.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gregkh@suse.de, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

priv is checked not to be NULL near the beginning of the function and not
changed subsequently, making the test redundant.

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
 drivers/usb/gadget/pxa27x_udc.c |    2 +-
 drivers/usb/serial/ftdi_sio.c   |   16 +++++++---------
 2 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/gadget/pxa27x_udc.c b/drivers/usb/gadget/pxa27x_udc.c
index 990f40f..ee0d7a0 100644
--- a/drivers/usb/gadget/pxa27x_udc.c
+++ b/drivers/usb/gadget/pxa27x_udc.c
@@ -278,7 +278,7 @@ static void pxa_init_debugfs(struct pxa_udc *udc)
 		goto err_queues;
 	eps = debugfs_create_file("epstate", 0400, root, udc,
 			&eps_dbg_fops);
-	if (!queues)
+	if (!eps)
 		goto err_eps;
 
 	udc->debugfs_root = root;
diff --git a/drivers/usb/serial/ftdi_sio.c b/drivers/usb/serial/ftdi_sio.c
index ef6cfa5..ad6142e 100644
--- a/drivers/usb/serial/ftdi_sio.c
+++ b/drivers/usb/serial/ftdi_sio.c
@@ -1928,15 +1928,13 @@ static void ftdi_process_read(struct work_struct *work)
 		/* Compare new line status to the old one, signal if different/
 		   N.B. packet may be processed more than once, but differences
 		   are only processed once.  */
-		if (priv != NULL) {
-			char new_status = data[packet_offset + 0] &
-							FTDI_STATUS_B0_MASK;
-			if (new_status != priv->prev_status) {
-				priv->diff_status |-					new_status ^ priv->prev_status;
-				wake_up_interruptible(&priv->delta_msr_wait);
-				priv->prev_status = new_status;
-			}
+		char new_status = data[packet_offset + 0] &
+						FTDI_STATUS_B0_MASK;
+		if (new_status != priv->prev_status) {
+			priv->diff_status |+				new_status ^ priv->prev_status;
+			wake_up_interruptible(&priv->delta_msr_wait);
+			priv->prev_status = new_status;
 		}
 
 		length = min(PKTSZ, urb->actual_length-packet_offset)-2;
