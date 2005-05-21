From: Travis Spencer <tspencer@cs.pdx.edu>
Date: Sat, 21 May 2005 01:41:11 +0000
Subject: [KJ] [PATCH 2.6.12-rc4-kj] Reorganization of control flow to
Message-Id: <20050521014111.GF20819@ruby.cat.pdx.edu>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============64966216638974461=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============64966216638974461==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

When the macro `__ISAPNP__' isn't defined, the label
`out_unregister_pci' is never used.  This causes a warning from the
compiler.  To suppress it, this patch reorganizes the flow of control
to use a single point of exit and removes the goto statements.  

Signed-off-by: Travis L. Spencer <tspencer@cs.pdx.edu>

--- linux-2.6.12-rc4-kj/drivers/isdn/hisax/hisax_fcpcipnp.c	2005-05-20 18:12:40.814317000 -0700
+++ mytree/drivers/isdn/hisax/hisax_fcpcipnp.c	2005-05-20 18:34:13.282605000 -0700
@@ -1001,18 +1001,16 @@ static int __init hisax_fcpcipnp_init(vo
 	printk(KERN_INFO "hisax_fcpcipnp: Fritz!Card PCI/PCIv2/PnP ISDN driver v0.0.1\n");
 
 	retval = pci_register_driver(&fcpci_driver);
-	if (retval)
-		goto out;
+	if (! retval)
+	{
 #ifdef __ISAPNP__
-	retval = pnp_register_driver(&fcpnp_driver);
-	if (retval < 0)
-		goto out_unregister_pci;
+		retval = pnp_register_driver(&fcpnp_driver);
+		if (retval < 0)
+			pci_unregister_driver(&fcpci_driver);
+		else
 #endif
-	return 0;
-
- out_unregister_pci:
-	pci_unregister_driver(&fcpci_driver);
- out:
+			retval = 0;
+	}
 	return retval;
 }
 

--===============64966216638974461==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============64966216638974461==--
