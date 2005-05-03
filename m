From: Christophe Lucas <clucas@rotomalug.org>
Date: Tue, 03 May 2005 14:08:47 +0000
Subject: [KJ] [PATCH] drivers/acpi/osl.c : replace direct assignment with
Message-Id: <20050503140847.GB26332@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="vtzGhvizbBRQ85DL"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--vtzGhvizbBRQ85DL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

description:
Use set_current_state() instead of direct assignment of
current->state.

Signed-off-by: Christophe Lucas <clucas@rotomalug.org>

--vtzGhvizbBRQ85DL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="linux-2.6.12-rc3_drivers_acpi_osl.c.patch"

diff -urpNX dontdiff a/drivers/acpi/osl.c b/drivers/acpi/osl.c
--- a/drivers/acpi/osl.c	2005-04-21 02:03:13.000000000 +0200
+++ b/drivers/acpi/osl.c	2005-04-29 09:46:46.000000000 +0200
@@ -317,7 +317,7 @@ acpi_os_remove_interrupt_handler(u32 irq
 void
 acpi_os_sleep(acpi_integer ms)
 {
-	current->state = TASK_INTERRUPTIBLE;
+	set_current_state(TASK_INTERRUPTIBLE);
 	schedule_timeout(((signed long) ms * HZ) / 1000);
 }
 EXPORT_SYMBOL(acpi_os_sleep);
@@ -942,7 +942,7 @@ acpi_os_wait_semaphore(
 
 			ret = down_trylock(sem);
 			for (i = timeout; (i > 0 && ret < 0); i -= quantum_ms) {
-				current->state = TASK_INTERRUPTIBLE;
+				set_current_state(TASK_INTERRUPTIBLE);
 				schedule_timeout(1);
 				ret = down_trylock(sem);
 			}

--vtzGhvizbBRQ85DL
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--vtzGhvizbBRQ85DL--
