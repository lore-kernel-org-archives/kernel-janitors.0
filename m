From: Alexander Nyberg <alexn@telia.com>
Date: Sun, 25 Jul 2004 20:47:45 +0000
Subject: [Kernel-janitors] gcc compilation warning fix
Message-Id: <1090788465.8868.59.camel@boxen.(null)>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============45833139867241091=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============45833139867241091==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

The actual prototype is:
typedef	void (*acpi_gpe_handler) (void *context);

(noone was even using the return value)

===== drivers/char/ipmi/ipmi_si_intf.c 1.6 vs edited =====
--- 1.6/drivers/char/ipmi/ipmi_si_intf.c	2004-07-13 13:46:29 +00:00
+++ edited/drivers/char/ipmi/ipmi_si_intf.c	2004-07-25 19:21:12 +00:00
@@ -1132,7 +1132,7 @@
 static int acpi_failure = 0;
 
 /* For GPE-type interrupts. */
-u32 ipmi_acpi_gpe(void *context)
+void ipmi_acpi_gpe(void *context)
 {
 	struct smi_info *smi_info = context;
 	unsigned long   flags;
@@ -1156,7 +1156,6 @@
 	smi_event_handler(smi_info, 0);
  out:
 	spin_unlock_irqrestore(&(smi_info->si_lock), flags);
-	return 0;
 }
 
 static int acpi_gpe_irq_setup(struct smi_info *info)



--===============45833139867241091==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============45833139867241091==--
