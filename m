From: Christophe Lucas <c.lucas@ifrance.com>
Date: Sun, 13 Feb 2005 13:10:29 +0000
Subject: [KJ] [PATCH] drivers/net/wireless/prism54/*: convert to
Message-Id: <20050213131029.GL15348@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="QCC2I/2CckNfI+Tr"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--QCC2I/2CckNfI+Tr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Description:
convert from pci_module_init to pci_register_driver
(from:http://kerneljanitors.org/TODO).

Signed-off-by: Christophe Lucas <c.lucas@ifrance.com>


--QCC2I/2CckNfI+Tr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="pci_register_driver-linux-2.6.11-rc3_drivers_net_wireless_prism54.patch"

diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/net/wireless/prism54/islpci_hotplug.c linux-2.6.11-rc3/drivers/net/wireless/prism54/islpci_hotplug.c
--- linux-2.6.11-rc3-vanilla/drivers/net/wireless/prism54/islpci_hotplug.c	2005-02-03 17:03:52.000000000 +0100
+++ linux-2.6.11-rc3/drivers/net/wireless/prism54/islpci_hotplug.c	2005-02-07 09:39:29.000000000 +0100
@@ -315,7 +315,7 @@ prism54_module_init(void)
 
 	__bug_on_wrong_struct_sizes ();
 
-	return pci_module_init(&prism54_driver);
+	return pci_register_driver(&prism54_driver);
 }
 
 /* by the time prism54_module_exit() terminates, as a postcondition

--QCC2I/2CckNfI+Tr
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--QCC2I/2CckNfI+Tr--
