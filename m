From: walter harms <wharms@bfs.de>
Date: Tue, 06 Dec 2005 17:50:35 +0000
Subject: [KJ] drivers/input/mouse/psmouse-base.c: wrong name in error message
Message-Id: <4395CF6B.7080601@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The mouse modul has error messages that use a wrong modul name. i 
replaced them with __FUNCTION__.

sign-off-by: walter <wharms@bfs.de>


--- linux-2.6.14/drivers/input/mouse/psmouse-base.c.bak	2005-11-08 
22:28:55.000000000 +0100
+++ linux-2.6.14/drivers/input/mouse/psmouse-base.c	2005-11-08 
22:37:11.000000000 +0100
@@ -193,8 +193,8 @@

  	if (flags & (SERIO_PARITY|SERIO_TIMEOUT)) {
  		if (psmouse->state = PSMOUSE_ACTIVATED)
-			printk(KERN_WARNING "psmouse.c: bad data from KBC -%s%s\n",
-				flags & SERIO_TIMEOUT ? " timeout" : "",
+			printk(KERN_WARNING "%s: bad data from KBC -%s%s\n",__FUNCTION__,
+			        flags & SERIO_TIMEOUT ? " timeout" : "",
  				flags & SERIO_PARITY ? " bad parity" : "");
  		ps2_cmd_aborted(&psmouse->ps2dev);
  		goto out;
@@ -213,7 +213,7 @@

  	if (psmouse->state = PSMOUSE_ACTIVATED &&
  	    psmouse->pktcnt && time_after(jiffies, psmouse->last + HZ/2)) {
-		printk(KERN_WARNING "psmouse.c: %s at %s lost synchronization, 
throwing %d bytes away.\n",
+		printk(KERN_WARNING "%s: %s at %s lost synchronization, throwing %d 
bytes away.\n",__FUNCTION__,
  		       psmouse->name, psmouse->phys, psmouse->pktcnt);
  		psmouse->pktcnt = 0;
  	}
@@ -245,13 +245,13 @@

  	switch (rc) {
  		case PSMOUSE_BAD_DATA:
-			printk(KERN_WARNING "psmouse.c: %s at %s lost sync at byte %d\n",
+			printk(KERN_WARNING "%s: %s at %s lost sync at byte %d\n",__FUNCTION__,
  				psmouse->name, psmouse->phys, psmouse->pktcnt);
  			psmouse->pktcnt = 0;

  			if (++psmouse->out_of_sync = psmouse->resetafter) {
  				psmouse->state = PSMOUSE_IGNORE;
-				printk(KERN_NOTICE "psmouse.c: issuing reconnect request\n");
+				printk(KERN_NOTICE "%s: issuing reconnect request\n",__FUNCTION__);
  				serio_reconnect(psmouse->ps2dev.serio);
  			}
  			break;
@@ -260,7 +260,7 @@
  			psmouse->pktcnt = 0;
  			if (psmouse->out_of_sync) {
  				psmouse->out_of_sync = 0;
-				printk(KERN_NOTICE "psmouse.c: %s at %s - driver resynched.\n",
+				printk(KERN_NOTICE "%s: %s at %s - driver resynched.\n",__FUNCTION__,
  					psmouse->name, psmouse->phys);
  			}
  			break;
@@ -698,7 +698,7 @@
   */

  	if (ps2_command(ps2dev, NULL, PSMOUSE_CMD_RESET_DIS))
-		printk(KERN_WARNING "psmouse.c: Failed to reset mouse on %s\n", 
ps2dev->serio->phys);
+		printk(KERN_WARNING "%s: Failed to reset mouse on %s\n",__FUNCTION__, 
ps2dev->serio->phys);

  	return 0;
  }
@@ -777,7 +777,7 @@
  static void psmouse_activate(struct psmouse *psmouse)
  {
  	if (ps2_command(&psmouse->ps2dev, NULL, PSMOUSE_CMD_ENABLE))
-		printk(KERN_WARNING "psmouse.c: Failed to enable mouse on %s\n",
+		printk(KERN_WARNING "%s: Failed to enable mouse on %s\n",__FUNCTION__,
  			psmouse->ps2dev.serio->phys);

  	psmouse_set_state(psmouse, PSMOUSE_ACTIVATED);
@@ -792,7 +792,7 @@
  static void psmouse_deactivate(struct psmouse *psmouse)
  {
  	if (ps2_command(&psmouse->ps2dev, NULL, PSMOUSE_CMD_DISABLE))
-		printk(KERN_WARNING "psmouse.c: Failed to deactivate mouse on %s\n",
+		printk(KERN_WARNING "%s: Failed to deactivate mouse on 
%s\n",__FUNCTION__,
  			psmouse->ps2dev.serio->phys);

  	psmouse_set_state(psmouse, PSMOUSE_CMD_MODE);
@@ -948,7 +948,7 @@
  	psmouse_switch_protocol(psmouse, NULL);

  	input_register_device(&psmouse->dev);
-	printk(KERN_INFO "input: %s on %s\n", psmouse->devname, serio->phys);
+	printk(KERN_INFO "%s register %s on %s\n", 
__FUNCTION__,psmouse->devname, serio->phys);

  	psmouse_set_state(psmouse, PSMOUSE_CMD_MODE);

@@ -981,7 +981,7 @@
  	int rc = -1;

  	if (!drv || !psmouse) {
-		printk(KERN_DEBUG "psmouse: reconnect request, but serio is 
disconnected, ignoring...\n");
+		printk(KERN_DEBUG "%s: reconnect request, but serio is disconnected, 
ignoring...\n",__FUNCTION__);
  		return -1;
  	}

@@ -1172,7 +1172,7 @@

  	while (serio->child) {
  		if (++retry > 3) {
-			printk(KERN_WARNING "psmouse: failed to destroy child port, protocol 
change aborted.\n");
+			printk(KERN_WARNING "%s: failed to destroy child port, protocol 
change aborted.\n",__FUNCTION__);
  			return -EIO;
  		}

@@ -1213,7 +1213,7 @@
  	psmouse_set_state(psmouse, PSMOUSE_CMD_MODE);

  	input_register_device(&psmouse->dev);
-	printk(KERN_INFO "input: %s on %s\n", psmouse->devname, serio->phys);
+	printk(KERN_INFO "%s register %s on %s\n", 
__FUNCTION__,psmouse->devname, serio->phys);

  	if (parent && parent->pt_activate)
  		parent->pt_activate(parent);
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
