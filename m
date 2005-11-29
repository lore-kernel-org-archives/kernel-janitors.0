From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Tue, 29 Nov 2005 22:57:40 +0000
Subject: [KJ] [PATCH] drivers/acpi/osl.c: correct HZ dependencies
Message-Id: <20051129225740.GD7696@mipter.zuzino.mipt.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============51789569929660262=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============51789569929660262==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

From: Nishanth Aravamudan

The osl driver has a few dependencies on HZ which are not handled
correctly for all values. Use msleep_interruptible() and
jiffies_to_msecs() to rectify the situation. Patch is compile-tested.

Signed-off-by: Nishanth Aravamudan
Signed-off-by: Domen Puncer
Signed-off-by: Alexey Dobriyan

Index: linux-kj/drivers/acpi/osl.c
===================================================================
--- linux-kj.orig/drivers/acpi/osl.c	2005-11-29 12:27:14.000000000 +0300
+++ linux-kj/drivers/acpi/osl.c	2005-11-30 01:56:40.000000000 +0300
@@ -313,7 +313,7 @@ acpi_status acpi_os_remove_interrupt_han
 
 void acpi_os_sleep(acpi_integer ms)
 {
-	schedule_timeout_interruptible(msecs_to_jiffies(ms));
+	msleep_interruptible((unsigned int)ms);
 }
 
 EXPORT_SYMBOL(acpi_os_sleep);
@@ -833,7 +833,7 @@ acpi_status acpi_os_wait_semaphore(acpi_
 		// TODO: A better timeout algorithm?
 		{
 			int i = 0;
-			static const int quantum_ms = 1000 / HZ;
+			unsigned int quantum_ms = jiffies_to_msecs(1);
 
 			ret = down_trylock(sem);
 			for (i = timeout; (i > 0 && ret < 0); i -= quantum_ms) {


--===============51789569929660262==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============51789569929660262==--
