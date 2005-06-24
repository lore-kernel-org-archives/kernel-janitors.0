From: Jesse Millan <jessem@cs.pdx.edu>
Date: Fri, 24 Jun 2005 19:39:57 +0000
Subject: [KJ] [PATCH] Fix GCC warning: unused variable
Message-Id: <42BC618D.7070704@cs.pdx.edu>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------000701040408090903070003"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------000701040408090903070003
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit


This function will return either 'eisacount', 'pcicount' or 0. Because
of the control flow, one, or both the variables will be unused.
Replacing them with one generic variable 'count' instead of the two is
more efficient and eliminates the unused variable warning.


--------------000701040408090903070003
Content-Type: text/plain; x-mac-type="0"; x-mac-creator="0";
 name="patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="patch"

Signed-off-by: Jesse Millan <jessem@cs.pdx.edu>

--- linux-2.6.12-rc6.kj/drivers/net/dgrs.c~	2005-06-24 12:05:17.748053320 -0700
+++ linux-2.6.12-rc6.kj/drivers/net/dgrs.c	2005-06-24 12:20:34.474689688 -0700
@@ -1549,7 +1549,7 @@ MODULE_PARM_DESC(nicmode, "Digi RightSwi
 static int __init dgrs_init_module (void)
 {
 	int	i;
-	int eisacount = 0, pcicount = 0;
+	int count = 0;

 	/*
 	 *	Command line variable overrides
@@ -1591,14 +1591,14 @@ static int __init dgrs_init_module (void
 	 *	Find and configure all the cards
 	 */
 #ifdef CONFIG_EISA
-	eisacount = eisa_driver_register(&dgrs_eisa_driver);
-	if (eisacount < 0)
-		return eisacount;
+	count = eisa_driver_register(&dgrs_eisa_driver);
+	if (count < 0)
+		return count;
 #endif
 #ifdef CONFIG_PCI
-	pcicount = pci_register_driver(&dgrs_pci_driver);
-	if (pcicount)
-		return pcicount;
+	count = pci_register_driver(&dgrs_pci_driver);
+	if (count)
+		return count;
 #endif
 	return 0;
 }


--------------000701040408090903070003
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------000701040408090903070003--
