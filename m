From: Christophe Lucas <c.lucas@ifrance.com>
Date: Sun, 13 Feb 2005 12:59:47 +0000
Subject: [KJ] [PATCH] drivers/net/tokenring/*: convert to pci_register_driver
Message-Id: <20050213125947.GG15348@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="cN0A5YokcrYPGsSB"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--cN0A5YokcrYPGsSB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Description:
convert from pci_module_init to pci_register_driver
(from:http://kerneljanitors.org/TODO).

Signed-off-by: Christophe Lucas <c.lucas@ifrance.com>

--cN0A5YokcrYPGsSB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="pci_register_driver-linux-2.6.11-rc3_drivers_net_tokenring.patch"

diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/net/tokenring/3c359.c linux-2.6.11-rc3/drivers/net/tokenring/3c359.c
--- linux-2.6.11-rc3-vanilla/drivers/net/tokenring/3c359.c	2005-02-03 17:03:51.000000000 +0100
+++ linux-2.6.11-rc3/drivers/net/tokenring/3c359.c	2005-02-07 09:39:29.000000000 +0100
@@ -1815,7 +1815,7 @@ static struct pci_driver xl_3c359_driver
 
 static int __init xl_pci_init (void)
 {
-	return pci_module_init (&xl_3c359_driver);
+	return pci_register_driver (&xl_3c359_driver);
 }
 
 
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/net/tokenring/lanstreamer.c linux-2.6.11-rc3/drivers/net/tokenring/lanstreamer.c
--- linux-2.6.11-rc3-vanilla/drivers/net/tokenring/lanstreamer.c	2005-02-03 17:03:52.000000000 +0100
+++ linux-2.6.11-rc3/drivers/net/tokenring/lanstreamer.c	2005-02-07 09:39:29.000000000 +0100
@@ -1999,7 +1999,7 @@ static struct pci_driver streamer_pci_dr
 };
 
 static int __init streamer_init_module(void) {
-  return pci_module_init(&streamer_pci_driver);
+  return pci_register_driver(&streamer_pci_driver);
 }
 
 static void __exit streamer_cleanup_module(void) {
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/net/tokenring/olympic.c linux-2.6.11-rc3/drivers/net/tokenring/olympic.c
--- linux-2.6.11-rc3-vanilla/drivers/net/tokenring/olympic.c	2005-02-03 17:03:52.000000000 +0100
+++ linux-2.6.11-rc3/drivers/net/tokenring/olympic.c	2005-02-07 09:39:29.000000000 +0100
@@ -1771,7 +1771,7 @@ static struct pci_driver olympic_driver 
 
 static int __init olympic_pci_init(void) 
 {
-	return pci_module_init (&olympic_driver) ; 
+	return pci_register_driver (&olympic_driver) ; 
 }
 
 static void __exit olympic_pci_cleanup(void)

--cN0A5YokcrYPGsSB
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--cN0A5YokcrYPGsSB--
