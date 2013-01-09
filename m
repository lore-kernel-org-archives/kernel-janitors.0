From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 09 Jan 2013 07:10:59 +0000
Subject: [patch 1/2] staging: sb105x: move dereference under IS_ERR() check
Message-Id: <20130109071059.GB2454@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Avoid dereverencing the ERR_PTR() by shifting the dereference down a
couple lines.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Only needed in linux-next.

diff --git a/drivers/staging/sb105x/sb_pci_mp.c b/drivers/staging/sb105x/sb_pci_mp.c
index 131afd0c..c34ebff 100644
--- a/drivers/staging/sb105x/sb_pci_mp.c
+++ b/drivers/staging/sb105x/sb_pci_mp.c
@@ -1563,13 +1563,13 @@ static int mp_open(struct tty_struct *tty, struct file *filp)
 
 	state = uart_get(drv, line);
 
-	mtpt  = (struct mp_port *)state->port;
-
 	if (IS_ERR(state)) {
 		retval = PTR_ERR(state);
 		goto fail;
 	}
 
+	mtpt  = (struct mp_port *)state->port;
+
 	tty->driver_data = state;
 	tty->low_latency = (state->port->flags & UPF_LOW_LATENCY) ? 1 : 0;
 	tty->alt_speed = 0;
