From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Wed, 02 Mar 2005 19:59:14 +0000
Subject: [KJ] [UPDATE PATCH] acpi/osl: correct HZ dependencies
Message-Id: <20050302195914.GI2741@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============23508219160255495=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050302194821.GG2741@us.ibm.com>
In-Reply-To: <20050302194821.GG2741@us.ibm.com>
To: len.brown@intel.com
Cc: Kernel-Janitors <kernel-janitors@lists.osdl.org>, acpi-devel@lists.sourceforge.net

--===============23508219160255495==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 02, 2005 at 11:48:21AM -0800, Nishanth Aravamudan wrote:
> Hi,
> 
> Please consider applying.
> 
> Description: The osl driver has a few dependencies on HZ which are not
> handled correctly for all values. Use msleep_interruptible() and
> jiffies_to_msecs() to rectify the situation. Patch is compile-tested.

Sorry forgot Signed-off-by line.

Description: The osl driver has a few dependencies on HZ which are not
handled correctly for all values. Use msleep_interruptible() and
jiffies_to_msecs() to rectify the situation. Patch is compile-tested.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- 2.6.11-kj-v/drivers/acpi/osl.c	2005-03-01 23:38:38.000000000 -0800
+++ 2.6.11-kj/drivers/acpi/osl.c	2005-03-02 11:47:34.000000000 -0800
@@ -317,8 +317,7 @@ acpi_os_remove_interrupt_handler(u32 irq
 void
 acpi_os_sleep(acpi_integer ms)
 {
-	current->state = TASK_INTERRUPTIBLE;
-	schedule_timeout(((signed long) ms * HZ) / 1000);
+	msleep_interruptible((unsigned int)ms);
 }
 EXPORT_SYMBOL(acpi_os_sleep);
 
@@ -938,7 +937,7 @@ acpi_os_wait_semaphore(
 		// TODO: A better timeout algorithm?
 		{
 			int i = 0;
-			static const int quantum_ms = 1000/HZ;
+			unsigned int quantum_ms = jiffies_to_msecs(1);
 
 			ret = down_trylock(sem);
 			for (i = timeout; (i > 0 && ret < 0); i -= quantum_ms) {

--===============23508219160255495==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============23508219160255495==--
