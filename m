From: Christophe Lucas <c.lucas@ifrance.com>
Date: Sun, 13 Feb 2005 13:05:51 +0000
Subject: [KJ] [PATCH] drivers/net/wan/*: convert to pci_register_driver
Message-Id: <20050213130551.GJ15348@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="XMHqbYJb993HXwLR"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--XMHqbYJb993HXwLR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Description:
convert from pci_module_init to pci_register_driver
(from:http://kerneljanitors.org/TODO).

Signed-off-by: Christophe Lucas <c.lucas@ifrance.com>


--XMHqbYJb993HXwLR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="pci_register_driver-linux-2.6.11-rc3_drivers_net_wan.patch"

diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/net/wan/dscc4.c linux-2.6.11-rc3/drivers/net/wan/dscc4.c
--- linux-2.6.11-rc3-vanilla/drivers/net/wan/dscc4.c	2005-02-03 17:03:52.000000000 +0100
+++ linux-2.6.11-rc3/drivers/net/wan/dscc4.c	2005-02-07 09:39:29.000000000 +0100
@@ -2057,7 +2057,7 @@ static struct pci_driver dscc4_driver = 
 
 static int __init dscc4_init_module(void)
 {
-	return pci_module_init(&dscc4_driver);
+	return pci_register_driver(&dscc4_driver);
 }
 
 static void __exit dscc4_cleanup_module(void)
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/net/wan/farsync.c linux-2.6.11-rc3/drivers/net/wan/farsync.c
--- linux-2.6.11-rc3-vanilla/drivers/net/wan/farsync.c	2005-02-03 17:03:52.000000000 +0100
+++ linux-2.6.11-rc3/drivers/net/wan/farsync.c	2005-02-07 09:39:29.000000000 +0100
@@ -2698,7 +2698,7 @@ fst_init(void)
 	for (i = 0; i < FST_MAX_CARDS; i++)
 		fst_card_array[i] = NULL;
 	spin_lock_init(&fst_work_q_lock);
-	return pci_module_init(&fst_driver);
+	return register_driver(&fst_driver);
 }
 
 static void __exit
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/net/wan/pc300_drv.c linux-2.6.11-rc3/drivers/net/wan/pc300_drv.c
--- linux-2.6.11-rc3-vanilla/drivers/net/wan/pc300_drv.c	2005-02-03 17:03:52.000000000 +0100
+++ linux-2.6.11-rc3/drivers/net/wan/pc300_drv.c	2005-02-07 09:39:29.000000000 +0100
@@ -3674,7 +3674,7 @@ static struct pci_driver cpc_driver = {
 
 static int __init cpc_init(void)
 {
-	return pci_module_init(&cpc_driver);
+	return pci_register_driver(&cpc_driver);
 }
 
 static void __exit cpc_cleanup_module(void)
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/net/wan/pci200syn.c linux-2.6.11-rc3/drivers/net/wan/pci200syn.c
--- linux-2.6.11-rc3-vanilla/drivers/net/wan/pci200syn.c	2004-12-24 22:34:01.000000000 +0100
+++ linux-2.6.11-rc3/drivers/net/wan/pci200syn.c	2005-02-07 09:39:29.000000000 +0100
@@ -468,7 +468,7 @@ static int __init pci200_init_module(voi
 		printk(KERN_ERR "pci200syn: Invalid PCI clock frequency\n");
 		return -EINVAL;
 	}
-	return pci_module_init(&pci200_pci_driver);
+	return pci_register_driver(&pci200_pci_driver);
 }
 
 
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc3-vanilla/drivers/net/wan/wanxl.c linux-2.6.11-rc3/drivers/net/wan/wanxl.c
--- linux-2.6.11-rc3-vanilla/drivers/net/wan/wanxl.c	2004-12-24 22:35:28.000000000 +0100
+++ linux-2.6.11-rc3/drivers/net/wan/wanxl.c	2005-02-07 09:39:29.000000000 +0100
@@ -827,7 +827,7 @@ static int __init wanxl_init_module(void
 #ifdef MODULE
 	printk(KERN_INFO "%s\n", version);
 #endif
-	return pci_module_init(&wanxl_pci_driver);
+	return pci_register_driver(&wanxl_pci_driver);
 }
 
 static void __exit wanxl_cleanup_module(void)

--XMHqbYJb993HXwLR
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--XMHqbYJb993HXwLR--
