From: Hanna Linder <hannal@us.ibm.com>
Date: Wed, 29 Sep 2004 19:35:23 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2-mm4 ide.c] [2/8] Patch to
Message-Id: <12260000.1096486523@w-hlinder.beaverton.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============070093637423261246=="
List-Id: <kernel-janitors.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@lists.osdl.org, greg@kroah.com, hannal@us.ibm.com, B.Zolnierkiewicz@elka.pw.edu.pl

--===============070093637423261246==
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


As pci_find_device is going away it needs to be replaced. In this case the dev
returned from pci_find_device was not being used so pci_dev_present was the
appropriate replacement.

This has been compile and boot tested on a T22.

Hanna Linder
IBM Linux Technology Center

Signed-off-by: Hanna Linder <hannal@us.ibm.com>

diff -Nrup linux-2.6.9-rc2-mm4cln/drivers/ide/ide.c linux-2.6.9-rc2-mm4patch/drivers/ide/ide.c
--- linux-2.6.9-rc2-mm4cln/drivers/ide/ide.c	2004-09-28 14:58:25.000000000 -0700
+++ linux-2.6.9-rc2-mm4patch/drivers/ide/ide.c	2004-09-29 11:29:53.592066584 -0700
@@ -335,11 +335,16 @@ static void __init init_ide_data (void)
 
 int ide_system_bus_speed (void)
 {
+	static struct pci_device_id pci_default[] = {
+		{ PCI_DEVICE(PCI_ANY_ID, PCI_ANY_ID) },
+		{ }
+	};
+
 	if (!system_bus_speed) {
 		if (idebus_parameter) {
 			/* user supplied value */
 			system_bus_speed = idebus_parameter;
-		} else if (pci_find_device(PCI_ANY_ID, PCI_ANY_ID, NULL) != NULL) {
+		} else if (pci_dev_present(pci_default)) {
 			/* safe default value for PCI */
 			system_bus_speed = 33;
 		} else {




--===============070093637423261246==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============070093637423261246==--
