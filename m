From: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>
Date: Sat, 16 Jul 2005 07:03:48 +0000
Subject: [KJ] [PATCH] drivers/block/DAC960.c : Use of time_after(),
Message-Id: <42D8B154.3050203@feitoza.com.br>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------080806030609070406090000"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------080806030609070406090000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



--------------080806030609070406090000
Content-Type: text/x-patch;
 name="DAC960.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="DAC960.patch"

Use of time_after(), time_after_eq() and time_before() macros, define at
linux/jiffies.h, which deal with wrapping correctly and are nicer to read.

Signed-off-by: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>

--- linux/drivers/block/DAC960.c	2005-07-13 17:53:24.000000000 -0300
+++ linux-kj/drivers/block/DAC960.c	2005-07-14 01:05:30.116859896 -0300
@@ -42,6 +42,7 @@
 #include <linux/pci.h>
 #include <linux/init.h>
 #include <linux/wait.h>
+#include <linux/jiffies.h>
 #include <asm/io.h>
 #include <asm/uaccess.h>
 #include "DAC960.h"
@@ -3674,8 +3675,8 @@
 	      (NewEnquiry->EventLogSequenceNumber !=
 	       OldEnquiry->EventLogSequenceNumber) ||
 	      Controller->MonitoringTimerCount == 0 ||
-	      (jiffies - Controller->SecondaryMonitoringTime
-	       >= DAC960_SecondaryMonitoringInterval))
+	      (time_after_eq(jiffies, Controller->SecondaryMonitoringTime
+	       + DAC960_SecondaryMonitoringInterval)))
 	    {
 	      Controller->V1.NeedLogicalDriveInformation = true;
 	      Controller->V1.NewEventLogSequenceNumber =
@@ -5660,8 +5661,8 @@
       unsigned int StatusChangeCounter =
 	Controller->V2.HealthStatusBuffer->StatusChangeCounter;
       boolean ForceMonitoringCommand = false;
-      if (jiffies - Controller->SecondaryMonitoringTime
-	  > DAC960_SecondaryMonitoringInterval)
+      if (time_after(jiffies, Controller->SecondaryMonitoringTime
+	  + DAC960_SecondaryMonitoringInterval))
 	{
 	  int LogicalDriveNumber;
 	  for (LogicalDriveNumber = 0;
@@ -5689,8 +5690,8 @@
 	   ControllerInfo->ConsistencyChecksActive +
 	   ControllerInfo->RebuildsActive +
 	   ControllerInfo->OnlineExpansionsActive == 0 ||
-	   jiffies - Controller->PrimaryMonitoringTime
-	   < DAC960_MonitoringTimerInterval) &&
+	   time_before(jiffies, Controller->PrimaryMonitoringTime
+	   + DAC960_MonitoringTimerInterval)) &&
 	  !ForceMonitoringCommand)
 	{
 	  Controller->MonitoringTimer.expires =
@@ -5827,8 +5828,8 @@
       Controller->ProgressBufferLength = Length;
       if (Controller->EphemeralProgressMessage)
 	{
-	  if (jiffies - Controller->LastProgressReportTime
-	      >= DAC960_ProgressReportingInterval)
+	  if (time_after_eq(jiffies, Controller->LastProgressReportTime
+	      + DAC960_ProgressReportingInterval))
 	    {
 	      printk("%sDAC960#%d: %s", DAC960_MessageLevelMap[MessageLevel],
 		     Controller->ControllerNumber, Buffer);

--------------080806030609070406090000
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------080806030609070406090000--
