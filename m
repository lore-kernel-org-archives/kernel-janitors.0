From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Wed, 02 Mar 2005 19:48:21 +0000
Subject: [KJ] [PATCH] acpi/osl: correct HZ dependencies
Message-Id: <20050302194821.GG2741@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============53934269005499147=="
List-Id: <kernel-janitors.vger.kernel.org>
To: len.brown-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org
Cc: acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, Kernel-Janitors <kernel-janitors-qjLDD68F18O7TbgM5vRIOg@public.gmane.org>

--===============53934269005499147==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Please consider applying.

Description: The osl driver has a few dependencies on HZ which are not
handled correctly for all values. Use msleep_interruptible() and
jiffies_to_msecs() to rectify the situation. Patch is compile-tested.

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

--===============53934269005499147==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============53934269005499147==--
