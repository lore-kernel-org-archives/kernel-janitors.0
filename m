From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 17 Jan 2005 23:50:05 +0000
Subject: [KJ] [PATCH 16/21] ppc64/iSeries_pci_reset: replace
Message-Id: <20050117235005.GY24698@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============18481489893685121=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============18481489893685121==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Please consider applying. 

Description: Use msleep() instead of schedule_timeout() to guarantee the task
delays as expected. The code is not wrong as is, but I see two benefits to using
msleep(): 1) real time delays (milliseconds) and 2) consistency across the
kernel with respect to longer delays. Change the units of the WaitDelay and
AssertDelay constants accordingly.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.11-rc1-kj-v/arch/ppc64/kernel/iSeries_pci_reset.c	2005-01-15 16:55:41.000000000 -0800
+++ 2.6.11-rc1-kj/arch/ppc64/kernel/iSeries_pci_reset.c	2005-01-15 17:17:54.000000000 -0800
@@ -32,6 +32,7 @@
 #include <linux/module.h>
 #include <linux/pci.h>
 #include <linux/irq.h>
+#include <linux/delay.h>
 
 #include <asm/io.h>
 #include <asm/iSeries/HvCallPci.h>
@@ -49,7 +50,7 @@
 int iSeries_Device_ToggleReset(struct pci_dev *PciDev, int AssertTime,
 		int DelayTime)
 {
-	unsigned long AssertDelay, WaitDelay;
+	unsigned int AssertDelay, WaitDelay;
 	struct iSeries_Device_Node *DeviceNode =
 		(struct iSeries_Device_Node *)PciDev->sysdata;
 
@@ -62,14 +63,14 @@ int iSeries_Device_ToggleReset(struct pc
 	 * Set defaults, Assert is .5 second, Wait is 3 seconds.
 	 */
 	if (AssertTime == 0)
-		AssertDelay = (5 * HZ) / 10;
+		AssertDelay = 500;
 	else
-		AssertDelay = (AssertTime * HZ) / 10;
+		AssertDelay = AssertTime * 100;
 
 	if (DelayTime == 0)
-		WaitDelay = (30 * HZ) / 10;
+		WaitDelay = 3000;
 	else
-		WaitDelay = (DelayTime * HZ) / 10;
+		WaitDelay = DelayTime * 100;
 
 	/*
 	 * Assert reset
@@ -77,8 +78,7 @@ int iSeries_Device_ToggleReset(struct pc
 	DeviceNode->ReturnCode = HvCallPci_setSlotReset(ISERIES_BUS(DeviceNode),
 			0x00, DeviceNode->AgentId, 1);
 	if (DeviceNode->ReturnCode == 0) {
-		set_current_state(TASK_UNINTERRUPTIBLE);
-		schedule_timeout(AssertDelay);       /* Sleep for the time */
+		msleep(AssertDelay);			/* Sleep for the time */
 		DeviceNode->ReturnCode =
 			HvCallPci_setSlotReset(ISERIES_BUS(DeviceNode),
 					0x00, DeviceNode->AgentId, 0);
@@ -86,8 +86,7 @@ int iSeries_Device_ToggleReset(struct pc
 		/*
    		 * Wait for device to reset
 		 */
-		set_current_state(TASK_UNINTERRUPTIBLE);  
-		schedule_timeout(WaitDelay);
+		msleep(WaitDelay);
 	}
 	if (DeviceNode->ReturnCode == 0)
 		PCIFR("Slot 0x%04X.%02 Reset\n", ISERIES_BUS(DeviceNode),

--===============18481489893685121==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============18481489893685121==--
