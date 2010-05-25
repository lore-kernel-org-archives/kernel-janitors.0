From: Dan Carpenter <error27@gmail.com>
Date: Tue, 25 May 2010 09:37:17 +0000
Subject: [patch] TTY/n_gsm: potential double lock
Message-Id: <20100525093717.GC22515@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@suse.de>
Cc: Alan Cox <alan@linux.intel.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

In gsm_dlci_data_kick() we call gsm_dlci_data_sweep() with the
"gsm->tx_lock" held so we can't lock it again inside
gsm_dlci_data_sweep().  I removed that lock from and added one to 
gsmld_write_wakeup() instead.  The sweep function is only called from
those two places.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/char/n_gsm.c b/drivers/char/n_gsm.c
index c4161d5..e4089c4 100644
--- a/drivers/char/n_gsm.c
+++ b/drivers/char/n_gsm.c
@@ -904,9 +904,7 @@ static void gsm_dlci_data_sweep(struct gsm_mux *gsm)
 	int len;
 	/* Priority ordering: We should do priority with RR of the groups */
 	int i = 1;
-	unsigned long flags;
 
-	spin_lock_irqsave(&gsm->tx_lock, flags);
 	while (i < NUM_DLCI) {
 		struct gsm_dlci *dlci;
 
@@ -927,7 +925,6 @@ static void gsm_dlci_data_sweep(struct gsm_mux *gsm)
 		if (len = 0)
 			i++;
 	}
-	spin_unlock_irqrestore(&gsm->tx_lock, flags);
 }
 
 /**
@@ -2230,12 +2227,16 @@ static int gsmld_open(struct tty_struct *tty)
 static void gsmld_write_wakeup(struct tty_struct *tty)
 {
 	struct gsm_mux *gsm = tty->disc_data;
+	unsigned long flags;
 
 	/* Queue poll */
 	clear_bit(TTY_DO_WRITE_WAKEUP, &tty->flags);
 	gsm_data_kick(gsm);
-	if (gsm->tx_bytes < TX_THRESH_LO)
+	if (gsm->tx_bytes < TX_THRESH_LO) {
+		spin_lock_irqsave(&gsm->tx_lock, flags);
 		gsm_dlci_data_sweep(gsm);
+		spin_unlock_irqrestore(&gsm->tx_lock, flags);
+	}
 }
 
 /**
