From: Luiz Fernando Capitulino <lcapitulino@prefeitura.sp.gov.br>
Date: Fri, 19 Mar 2004 19:31:43 +0000
Subject: [Kernel-janitors] [TRIVIAL] - section drivers/acpi/asus_acpi.c.
Message-Id: <1079724660.14846.38.camel@telecentrolivre>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


Hi all,

 I need to be more descriptive in this patches. :-)

 asus_hotk_remove() is only called when drivers is being
removed.

diff -Nparu linux-2.6.5-rc1/drivers/acpi/asus_acpi.c linux-2.6.5-rc1~/drivers/acpi/asus_acpi.c
--- linux-2.6.5-rc1/drivers/acpi/asus_acpi.c	2004-02-18 15:54:21.000000000 -0300
+++ linux-2.6.5-rc1~/drivers/acpi/asus_acpi.c	2004-03-16 19:15:33.000000000 -0300
@@ -1097,7 +1097,7 @@ static int __init asus_hotk_add(struct a
 }
 
 
-static int asus_hotk_remove(struct acpi_device *device, int type)
+static int __exit asus_hotk_remove(struct acpi_device *device, int type)
 {
 	acpi_status status = 0;
 	struct asus_hotk *hotk = NULL;

-- 
Luiz Fernando N. Capitulino
<lcapitulino@prefeitura.sp.gov.br>
<http://www.telecentros.sp.gov.br>

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
