From: Christophe Lucas <clucas@rotomalug.org>
Date: Fri, 01 Apr 2005 12:55:04 +0000
Subject: [KJ] [PATCH] printk : drivers/block/drivers/acpi/container.c
Message-Id: <20050401125504.GP5445@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="w2JjAQZceEVGylhD"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--w2JjAQZceEVGylhD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Description:
printk() calls should include appropriate KERN_* constant.

Signed-off-by: Christophe Lucas <clucas@rotomalug.org>


--w2JjAQZceEVGylhD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="2.6.12-rc1-pointer_drivers_acpi_container.c.patch"

diff -urpN -X dontdiff a/drivers/acpi/container.c b/drivers/acpi/container.c
--- a/drivers/acpi/container.c	2005-03-18 02:34:12.000000000 +0100
+++ b/drivers/acpi/container.c	2005-03-30 16:57:55.000000000 +0200
@@ -174,7 +174,7 @@ container_notify_cb(acpi_handle handle, 
 	case ACPI_NOTIFY_BUS_CHECK:
 		/* Fall through */
 	case ACPI_NOTIFY_DEVICE_CHECK:
-		printk("Container driver received %s event\n",
+		printk(KERN_INFO "Container driver received %s event\n",
 			(type == ACPI_NOTIFY_BUS_CHECK)?
 			"ACPI_NOTIFY_BUS_CHECK":"ACPI_NOTIFY_DEVICE_CHECK");
 		if (present) {

--w2JjAQZceEVGylhD
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--w2JjAQZceEVGylhD--
