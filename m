From: walter harms <wharms@bfs.de>
Date: Tue, 22 Mar 2005 16:30:15 +0000
Subject: Resend: [KJ] linux-2.6.11: fix psmouse-base.c error messages
Message-Id: <42404817.4090004@bfs.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------060603020202000107010409"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------060603020202000107010409
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Hi list,
this is a resend for domen. no changes except the default value for
psmouse_resetafter changed from 0 to 100. for my touchpad this is VERY 
usefull (0 simply does nothing).
to avoid pitfails (space <-> tab conversion this patch is also available 
as attachment).

have fun,
walter


--- linux-2.6.11/drivers/input/mouse/psmouse-base.c.bak	2005-03-06 
14:10:48.000000000 +0100
+++ linux-2.6.11/drivers/input/mouse/psmouse-base.c	2005-03-07 
21:37:02.000000000 +0100
@@ -48,7 +48,7 @@
  module_param_named(smartscroll, psmouse_smartscroll, bool, 0);
  MODULE_PARM_DESC(smartscroll, "Logitech Smartscroll autorepeat, 1 = 
enabled (default), 0 = disabled.");

-static unsigned int psmouse_resetafter;
+static unsigned int psmouse_resetafter = 100;
  module_param_named(resetafter, psmouse_resetafter, uint, 0);
  MODULE_PARM_DESC(resetafter, "Reset device after so many bad packets 
(0 = never).");

@@ -150,8 +150,8 @@

  	if (flags & (SERIO_PARITY|SERIO_TIMEOUT)) {
  		if (psmouse->state == PSMOUSE_ACTIVATED)
-			printk(KERN_WARNING "psmouse.c: bad data from KBC -%s%s\n",
-				flags & SERIO_TIMEOUT ? " timeout" : "",
+			printk(KERN_WARNING "%s: bad data from KBC -%s%s\n",__FUNCTION__,
+			        flags & SERIO_TIMEOUT ? " timeout" : "",
  				flags & SERIO_PARITY ? " bad parity" : "");
  		ps2_cmd_aborted(&psmouse->ps2dev);
  		goto out;
@@ -170,7 +170,7 @@

  	if (psmouse->state == PSMOUSE_ACTIVATED &&
  	    psmouse->pktcnt && time_after(jiffies, psmouse->last + HZ/2)) {
-		printk(KERN_WARNING "psmouse.c: %s at %s lost synchronization, 
throwing %d bytes away.\n",
+		printk(KERN_WARNING "%s: %s at %s lost synchronization, throwing %d 
bytes away.\n",__FUNCTION__,
  		       psmouse->name, psmouse->phys, psmouse->pktcnt);
  		psmouse->pktcnt = 0;
  	}
@@ -202,13 +202,13 @@

  	switch (rc) {
  		case PSMOUSE_BAD_DATA:
-			printk(KERN_WARNING "psmouse.c: %s at %s lost sync at byte %d\n",
+			printk(KERN_WARNING "%s: %s at %s lost sync at byte %d\n",__FUNCTION__,
  				psmouse->name, psmouse->phys, psmouse->pktcnt);
  			psmouse->pktcnt = 0;

  			if (++psmouse->out_of_sync == psmouse->resetafter) {
  				psmouse->state = PSMOUSE_IGNORE;
-				printk(KERN_NOTICE "psmouse.c: issuing reconnect request\n");
+				printk(KERN_NOTICE "%s: issuing reconnect request\n",__FUNCTION__);
  				serio_reconnect(psmouse->ps2dev.serio);
  			}
  			break;
@@ -217,7 +217,7 @@
  			psmouse->pktcnt = 0;
  			if (psmouse->out_of_sync) {
  				psmouse->out_of_sync = 0;
-				printk(KERN_NOTICE "psmouse.c: %s at %s - driver resynched.\n",
+				printk(KERN_NOTICE "%s: %s at %s - driver resynched.\n",__FUNCTION__,
  					psmouse->name, psmouse->phys);
  			}
  			break;
@@ -527,7 +527,7 @@
   */

  	if (ps2_command(ps2dev, NULL, PSMOUSE_CMD_RESET_DIS))
-		printk(KERN_WARNING "psmouse.c: Failed to reset mouse on %s\n", 
ps2dev->serio->phys);
+		printk(KERN_WARNING "%s: Failed to reset mouse on %s\n",__FUNCTION__, 
ps2dev->serio->phys);

  	return 0;
  }
@@ -606,7 +606,7 @@
  static void psmouse_activate(struct psmouse *psmouse)
  {
  	if (ps2_command(&psmouse->ps2dev, NULL, PSMOUSE_CMD_ENABLE))
-		printk(KERN_WARNING "psmouse.c: Failed to enable mouse on %s\n",
+		printk(KERN_WARNING "%s: Failed to enable mouse on %s\n",__FUNCTION__,
  			psmouse->ps2dev.serio->phys);

  	psmouse_set_state(psmouse, PSMOUSE_ACTIVATED);
@@ -621,7 +621,7 @@
  static void psmouse_deactivate(struct psmouse *psmouse)
  {
  	if (ps2_command(&psmouse->ps2dev, NULL, PSMOUSE_CMD_DISABLE))
-		printk(KERN_WARNING "psmouse.c: Failed to deactivate mouse on %s\n",
+		printk(KERN_WARNING "%s: Failed to deactivate mouse on 
%s\n",__FUNCTION__,
  			psmouse->ps2dev.serio->phys);

  	psmouse_set_state(psmouse, PSMOUSE_CMD_MODE);
@@ -743,7 +743,7 @@

  	input_register_device(&psmouse->dev);

-	printk(KERN_INFO "input: %s on %s\n", psmouse->devname, serio->phys);
+	printk(KERN_INFO "%s: %s on %s\n", __FUNCTION__,psmouse->devname, 
serio->phys);

  	psmouse_set_state(psmouse, PSMOUSE_CMD_MODE);

@@ -781,7 +781,7 @@
  	int rc = -1;

  	if (!drv || !psmouse) {
-		printk(KERN_DEBUG "psmouse: reconnect request, but serio is 
disconnected, ignoring...\n");
+		printk(KERN_DEBUG "%s: reconnect request, but serio is disconnected, 
ignoring...\n",__FUNCTION__);
  		return -1;
  	}

@@ -952,7 +952,7 @@
  		else if (!strcmp(psmouse_proto, "exps"))
  			psmouse_max_proto = PSMOUSE_IMEX;
  		else
-			printk(KERN_ERR "psmouse: unknown protocol type '%s'\n", psmouse_proto);
+			printk(KERN_ERR "%s: unknown protocol type '%s'\n",__FUNCTION__, 
psmouse_proto);
  	}
  }


--------------060603020202000107010409
Content-Type: text/plain;
 name="psmouse-base.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="psmouse-base.diff"

--- linux-2.6.11/drivers/input/mouse/psmouse-base.c.bak	2005-03-06 14:10:48.000000000 +0100
+++ linux-2.6.11/drivers/input/mouse/psmouse-base.c	2005-03-07 21:37:02.000000000 +0100
@@ -48,7 +48,7 @@
 module_param_named(smartscroll, psmouse_smartscroll, bool, 0);
 MODULE_PARM_DESC(smartscroll, "Logitech Smartscroll autorepeat, 1 = enabled (default), 0 = disabled.");
 
-static unsigned int psmouse_resetafter;
+static unsigned int psmouse_resetafter = 100;
 module_param_named(resetafter, psmouse_resetafter, uint, 0);
 MODULE_PARM_DESC(resetafter, "Reset device after so many bad packets (0 = never).");
 
@@ -150,8 +150,8 @@
 
 	if (flags & (SERIO_PARITY|SERIO_TIMEOUT)) {
 		if (psmouse->state == PSMOUSE_ACTIVATED)
-			printk(KERN_WARNING "psmouse.c: bad data from KBC -%s%s\n",
-				flags & SERIO_TIMEOUT ? " timeout" : "",
+			printk(KERN_WARNING "%s: bad data from KBC -%s%s\n",__FUNCTION__,
+			        flags & SERIO_TIMEOUT ? " timeout" : "",
 				flags & SERIO_PARITY ? " bad parity" : "");
 		ps2_cmd_aborted(&psmouse->ps2dev);
 		goto out;
@@ -170,7 +170,7 @@
 
 	if (psmouse->state == PSMOUSE_ACTIVATED &&
 	    psmouse->pktcnt && time_after(jiffies, psmouse->last + HZ/2)) {
-		printk(KERN_WARNING "psmouse.c: %s at %s lost synchronization, throwing %d bytes away.\n",
+		printk(KERN_WARNING "%s: %s at %s lost synchronization, throwing %d bytes away.\n",__FUNCTION__,
 		       psmouse->name, psmouse->phys, psmouse->pktcnt);
 		psmouse->pktcnt = 0;
 	}
@@ -202,13 +202,13 @@
 
 	switch (rc) {
 		case PSMOUSE_BAD_DATA:
-			printk(KERN_WARNING "psmouse.c: %s at %s lost sync at byte %d\n",
+			printk(KERN_WARNING "%s: %s at %s lost sync at byte %d\n",__FUNCTION__,
 				psmouse->name, psmouse->phys, psmouse->pktcnt);
 			psmouse->pktcnt = 0;
 
 			if (++psmouse->out_of_sync == psmouse->resetafter) {
 				psmouse->state = PSMOUSE_IGNORE;
-				printk(KERN_NOTICE "psmouse.c: issuing reconnect request\n");
+				printk(KERN_NOTICE "%s: issuing reconnect request\n",__FUNCTION__);
 				serio_reconnect(psmouse->ps2dev.serio);
 			}
 			break;
@@ -217,7 +217,7 @@
 			psmouse->pktcnt = 0;
 			if (psmouse->out_of_sync) {
 				psmouse->out_of_sync = 0;
-				printk(KERN_NOTICE "psmouse.c: %s at %s - driver resynched.\n",
+				printk(KERN_NOTICE "%s: %s at %s - driver resynched.\n",__FUNCTION__,
 					psmouse->name, psmouse->phys);
 			}
 			break;
@@ -527,7 +527,7 @@
  */
 
 	if (ps2_command(ps2dev, NULL, PSMOUSE_CMD_RESET_DIS))
-		printk(KERN_WARNING "psmouse.c: Failed to reset mouse on %s\n", ps2dev->serio->phys);
+		printk(KERN_WARNING "%s: Failed to reset mouse on %s\n",__FUNCTION__, ps2dev->serio->phys);
 
 	return 0;
 }
@@ -606,7 +606,7 @@
 static void psmouse_activate(struct psmouse *psmouse)
 {
 	if (ps2_command(&psmouse->ps2dev, NULL, PSMOUSE_CMD_ENABLE))
-		printk(KERN_WARNING "psmouse.c: Failed to enable mouse on %s\n",
+		printk(KERN_WARNING "%s: Failed to enable mouse on %s\n",__FUNCTION__,
 			psmouse->ps2dev.serio->phys);
 
 	psmouse_set_state(psmouse, PSMOUSE_ACTIVATED);
@@ -621,7 +621,7 @@
 static void psmouse_deactivate(struct psmouse *psmouse)
 {
 	if (ps2_command(&psmouse->ps2dev, NULL, PSMOUSE_CMD_DISABLE))
-		printk(KERN_WARNING "psmouse.c: Failed to deactivate mouse on %s\n",
+		printk(KERN_WARNING "%s: Failed to deactivate mouse on %s\n",__FUNCTION__,
 			psmouse->ps2dev.serio->phys);
 
 	psmouse_set_state(psmouse, PSMOUSE_CMD_MODE);
@@ -743,7 +743,7 @@
 
 	input_register_device(&psmouse->dev);
 
-	printk(KERN_INFO "input: %s on %s\n", psmouse->devname, serio->phys);
+	printk(KERN_INFO "%s: %s on %s\n", __FUNCTION__,psmouse->devname, serio->phys);
 
 	psmouse_set_state(psmouse, PSMOUSE_CMD_MODE);
 
@@ -781,7 +781,7 @@
 	int rc = -1;
 
 	if (!drv || !psmouse) {
-		printk(KERN_DEBUG "psmouse: reconnect request, but serio is disconnected, ignoring...\n");
+		printk(KERN_DEBUG "%s: reconnect request, but serio is disconnected, ignoring...\n",__FUNCTION__);
 		return -1;
 	}
 
@@ -952,7 +952,7 @@
 		else if (!strcmp(psmouse_proto, "exps"))
 			psmouse_max_proto = PSMOUSE_IMEX;
 		else
-			printk(KERN_ERR "psmouse: unknown protocol type '%s'\n", psmouse_proto);
+			printk(KERN_ERR "%s: unknown protocol type '%s'\n",__FUNCTION__, psmouse_proto);
 	}
 }
 

--------------060603020202000107010409
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------060603020202000107010409--
