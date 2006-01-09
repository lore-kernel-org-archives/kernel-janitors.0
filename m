From: carlos neira <cneira@srb.cl>
Date: Mon, 09 Jan 2006 11:33:52 +0000
Subject: [KJ] hotplug
Message-Id: <200601091133.53146.cneira@srb.cl>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Boundary-00=_hokwDCPSa+kZtqo"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--Boundary-00=_hokwDCPSa+kZtqo
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Greetings :
linux-2.6.15-rc7/drivers/pci/hotplug/pciehp_ctrl.c
linux-2.6.15-rc7/drivers/pci/hotplug/cpqphp_ctrl.c
linux-2.6.15-rc7/drivers/pci/hotplug/cpci_hotplug_core.c

Replaced lock_kernel()  with spinlocks , compile tested ok , using it.

As always if someone knows this patch breaks anything please tell me so.







-- 
"Employ your time in improving yourself by other men's writings, so that you 
shall gain easily what others have labored hard for."
Socrates

--Boundary-00=_hokwDCPSa+kZtqo
Content-Type: text/x-diff;
  charset="us-ascii";
  name="hotplug.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="hotplug.patch"

diff -uN /usr/src/linux-2.6.15-rc7/drivers/pci/hotplug/cpci_hotplug_core.c /home/cneira/Linuxjanitoring/linux-janitorpatching/drivers/pci/hotplug/cpci_hotplug_core.c
--- /usr/src/linux-2.6.15-rc7/drivers/pci/hotplug/cpci_hotplug_core.c	2005-12-24 20:47:48.000000000 -0300
+++ /home/cneira/Linuxjanitoring/linux-janitorpatching/drivers/pci/hotplug/cpci_hotplug_core.c	2006-01-08 23:41:07.000000000 -0300
@@ -35,6 +35,7 @@
 #include <linux/smp_lock.h>
 #include <asm/atomic.h>
 #include <linux/delay.h>
+#include <linux/spinlock.h>
 #include "pci_hotplug.h"
 #include "cpci_hotplug.h"
 
@@ -525,9 +526,9 @@
 {
 	int rc;
 
-	lock_kernel();
+	spin_lock(&event_thread);
 	daemonize("cpci_hp_eventd");
-	unlock_kernel();
+	spin_unlock(&event_thread);
 
 	dbg("%s - event thread started", __FUNCTION__);
 	while (1) {
@@ -566,9 +567,9 @@
 {
 	int rc;
 
-	lock_kernel();
+	spin_lock(&poll_thread);
 	daemonize("cpci_hp_polld");
-	unlock_kernel();
+	spin_unlock(&poll_thread);
 
 	while (1) {
 		if (thread_finished || signal_pending(current))
diff -uN /usr/src/linux-2.6.15-rc7/drivers/pci/hotplug/cpqphp_ctrl.c /home/cneira/Linuxjanitoring/linux-janitorpatching/drivers/pci/hotplug/cpqphp_ctrl.c
--- /usr/src/linux-2.6.15-rc7/drivers/pci/hotplug/cpqphp_ctrl.c	2005-12-24 20:47:48.000000000 -0300
+++ /home/cneira/Linuxjanitoring/linux-janitorpatching/drivers/pci/hotplug/cpqphp_ctrl.c	2006-01-08 23:37:19.000000000 -0300
@@ -37,6 +37,7 @@
 #include <linux/wait.h>
 #include <linux/smp_lock.h>
 #include <linux/pci.h>
+#include <linux/spinlock.h>
 #include "cpqphp.h"
 
 static u32 configure_new_device(struct controller* ctrl, struct pci_func *func,
@@ -1794,12 +1795,11 @@
 static int event_thread(void* data)
 {
 	struct controller *ctrl;
-	lock_kernel();
+	spin_lock(&event_thread);
 	daemonize("phpd_event");
+	spin_unlock(&event_thread);
 	
-	unlock_kernel();
-
-	while (1) {
+       while (1) {
 		dbg("!!!!event_thread sleeping\n");
 		down_interruptible (&event_semaphore);
 		dbg("event_thread woken finished = %d\n", event_finished);
diff -uN /usr/src/linux-2.6.15-rc7/drivers/pci/hotplug/pciehp_ctrl.c /home/cneira/Linuxjanitoring/linux-janitorpatching/drivers/pci/hotplug/pciehp_ctrl.c
--- /usr/src/linux-2.6.15-rc7/drivers/pci/hotplug/pciehp_ctrl.c	2005-12-24 20:47:48.000000000 -0300
+++ /home/cneira/Linuxjanitoring/linux-janitorpatching/drivers/pci/hotplug/pciehp_ctrl.c	2006-01-08 23:34:39.000000000 -0300
@@ -32,6 +32,7 @@
 #include <linux/types.h>
 #include <linux/smp_lock.h>
 #include <linux/pci.h>
+#include <linux/spinlock.h>
 #include "../pci.h"
 #include "pciehp.h"
 
@@ -517,10 +518,9 @@
 static int event_thread(void* data)
 {
 	struct controller *ctrl;
-	lock_kernel();
+	spin_lock(&event_thread);
 	daemonize("pciehpd_event");
-
-	unlock_kernel();
+	spin_unlock(&event_thread);
 
 	while (1) {
 		dbg("!!!!event_thread sleeping\n");
diff -uN /usr/src/linux-2.6.15-rc7/drivers/pci/hotplug/shpchp_ctrl.c /home/cneira/Linuxjanitoring/linux-janitorpatching/drivers/pci/hotplug/shpchp_ctrl.c
--- /usr/src/linux-2.6.15-rc7/drivers/pci/hotplug/shpchp_ctrl.c	2005-12-24 20:47:48.000000000 -0300
+++ /home/cneira/Linuxjanitoring/linux-janitorpatching/drivers/pci/hotplug/shpchp_ctrl.c	2006-01-09 00:30:06.000000000 -0300
@@ -32,6 +32,7 @@
 #include <linux/types.h>
 #include <linux/smp_lock.h>
 #include <linux/pci.h>
+#include <linux/spinlock.h>
 #include "../pci.h"
 #include "shpchp.h"
 
@@ -693,9 +694,9 @@
 static int event_thread(void* data)
 {
 	struct controller *ctrl;
-	lock_kernel();
+	spin_lock(&event_thread);
 	daemonize("shpchpd_event");
-	unlock_kernel();
+	spin_unlock(&event_thread);
 
 	while (1) {
 		dbg("!!!!event_thread sleeping\n");

--Boundary-00=_hokwDCPSa+kZtqo
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--Boundary-00=_hokwDCPSa+kZtqo--
