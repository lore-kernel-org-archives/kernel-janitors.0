From: Douglas <dougsland@gmail.com>
Date: Fri, 16 Feb 2007 02:45:47 +0000
Subject: [KJ] [PATCH] lp486e.c: cleanup not needed casts
Message-Id: <20070216024547.GB5791@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <68cac7520702151151n759f0c1am8d7666f02545b054@mail.gmail.com>
In-Reply-To: <68cac7520702151151n759f0c1am8d7666f02545b054@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Removed all unnecessary casts.

Signed-off-by: Douglas Schilling Landgraf <dougsland@gmail.com>

--- linux-2.6.20-vanilla/drivers/net/lp486e.c	2007-02-04 16:44:54.000000000 -0200
+++ linux-2.6.20/drivers/net/lp486e.c	2007-02-15 16:59:38.000000000 -0200
@@ -392,7 +392,7 @@
 	struct i596_private *lp;
 	int boguscnt = ct;
 
-	lp = (struct i596_private *) dev->priv;
+	lp = dev->priv;
 	while (lp->scb.command) {
 		if (--boguscnt = 0) {
 			printk("%s: %s timed out - stat %4.4x, cmd %4.4x\n",
@@ -413,7 +413,7 @@
 	int i;
 	// struct i596_rbd *rbd;
 
-	lp = (struct i596_private *) dev->priv;
+	lp = dev->priv;
 	lp->scb.pa_rfd = I596_NULL;
 
 	for (i = 0; i < num; i++) {
@@ -470,7 +470,7 @@
 	struct i596_private *lp;
 	struct i596_rfd *rfd;
 
-	lp = (struct i596_private *) dev->priv;
+	lp = dev->priv;
 	lp->rx_tail->pa_next = I596_NULL;
 
 	do {
@@ -626,7 +626,7 @@
 	if (i596_scp_setup(dev))
 		return 1;
 
-	lp = (struct i596_private *) dev->priv;
+	lp = dev->priv;
 	lp->scb.command = 0;
 
 	memcpy ((void *)lp->i596_config, init_setup, 14);
@@ -743,9 +743,9 @@
 	struct i596_private *lp;
 	struct i596_cmd *cmd;
 
-	lp = (struct i596_private *) dev->priv;
+	lp = dev->priv;
 	while (lp->cmd_head) {
-		cmd = (struct i596_cmd *)lp->cmd_head;
+		cmd = lp->cmd_head;
 
 		lp->cmd_head = pa_to_va(lp->cmd_head->pa_next);
 		lp->cmd_backlog--;
@@ -976,7 +976,7 @@
 		return -EBUSY;
 	}
 
-	lp = (struct i596_private *) dev->priv;
+	lp = dev->priv;
 	spin_lock_init(&lp->cmd_lock);
 
 	/*
@@ -1073,7 +1073,7 @@
 			struct tx_cmd *tx_cmd;
 			struct i596_tbd *tx_cmd_tbd;
 
-			tx_cmd = (struct tx_cmd *) cmd;
+			tx_cmd = cmd;
 			tx_cmd_tbd = pa_to_va(tx_cmd->pa_tbd);
 
 			frames_out++;
@@ -1157,7 +1157,7 @@
 	unsigned short status, ack_cmd = 0;
 	int frames_in = 0;
 
-	lp = (struct i596_private *) dev->priv;
+	lp = dev->priv;
 
 	/*
 	 * The 82596 examines the command, performs the required action,
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
