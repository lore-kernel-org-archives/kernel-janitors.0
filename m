From: Christophe Lucas <c.lucas@ifrance.com>
Date: Fri, 28 Jan 2005 16:50:14 +0000
Subject: [KJ] [PATCH] pci_register_driver() for drivers/char
Message-Id: <20050128165014.GD8645@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="MnLPg7ZWsaic7Fhd"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050128110438.GA8645@rhum.iomeda.fr>
In-Reply-To: <20050128110438.GA8645@rhum.iomeda.fr>
To: kernel-janitors@vger.kernel.org


--MnLPg7ZWsaic7Fhd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Description:
From : http://kerneljanitors.org/TODO
>-  convert from pci_module_init to pci_register_driver

Signed-off-by: Christophe Lucas <c.lucas@ifrance.com>
-- 
Christophe

--MnLPg7ZWsaic7Fhd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="pci_register_drivers_char_agp.patch"

diff -urpN -X /work/users/dontdiff linux-2.6.11-rc2-vanilla/drivers/char/agp/ali-agp.c linux-2.6.11-rc2/drivers/char/agp/ali-agp.c
--- linux-2.6.11-rc2-vanilla/drivers/char/agp/ali-agp.c	2005-01-26 08:31:08.000000000 +0100
+++ linux-2.6.11-rc2/drivers/char/agp/ali-agp.c	2005-01-26 09:48:34.000000000 +0100
@@ -398,7 +398,7 @@ static int __init agp_ali_init(void)
 {
 	if (agp_off)
 		return -EINVAL;
-	return pci_module_init(&agp_ali_pci_driver);
+	return pci_register_driver(&agp_ali_pci_driver);
 }
 
 static void __exit agp_ali_cleanup(void)
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc2-vanilla/drivers/char/agp/amd64-agp.c linux-2.6.11-rc2/drivers/char/agp/amd64-agp.c
--- linux-2.6.11-rc2-vanilla/drivers/char/agp/amd64-agp.c	2005-01-26 08:31:08.000000000 +0100
+++ linux-2.6.11-rc2/drivers/char/agp/amd64-agp.c	2005-01-26 09:48:52.000000000 +0100
@@ -709,7 +709,7 @@ int __init agp_amd64_init(void)
 
 	if (agp_off)
 		return -EINVAL;
-	if (pci_module_init(&agp_amd64_pci_driver) > 0) {
+	if (pci_register_driver(&agp_amd64_pci_driver) > 0) {
 		struct pci_dev *dev;
 		if (!agp_try_unsupported && !agp_try_unsupported_boot) {
 			printk(KERN_INFO PFX "No supported AGP bridge found.\n");
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc2-vanilla/drivers/char/agp/amd-k7-agp.c linux-2.6.11-rc2/drivers/char/agp/amd-k7-agp.c
--- linux-2.6.11-rc2-vanilla/drivers/char/agp/amd-k7-agp.c	2005-01-26 08:31:08.000000000 +0100
+++ linux-2.6.11-rc2/drivers/char/agp/amd-k7-agp.c	2005-01-26 09:48:43.000000000 +0100
@@ -480,7 +480,7 @@ static int __init agp_amdk7_init(void)
 {
 	if (agp_off)
 		return -EINVAL;
-	return pci_module_init(&agp_amdk7_pci_driver);
+	return pci_register_driver(&agp_amdk7_pci_driver);
 }
 
 static void __exit agp_amdk7_cleanup(void)
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc2-vanilla/drivers/char/agp/ati-agp.c linux-2.6.11-rc2/drivers/char/agp/ati-agp.c
--- linux-2.6.11-rc2-vanilla/drivers/char/agp/ati-agp.c	2005-01-26 08:31:08.000000000 +0100
+++ linux-2.6.11-rc2/drivers/char/agp/ati-agp.c	2005-01-26 09:49:00.000000000 +0100
@@ -531,7 +531,7 @@ static int __init agp_ati_init(void)
 {
 	if (agp_off)
 		return -EINVAL;
-	return pci_module_init(&agp_ati_pci_driver);
+	return pci_register_driver(&agp_ati_pci_driver);
 }
 
 static void __exit agp_ati_cleanup(void)
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc2-vanilla/drivers/char/agp/efficeon-agp.c linux-2.6.11-rc2/drivers/char/agp/efficeon-agp.c
--- linux-2.6.11-rc2-vanilla/drivers/char/agp/efficeon-agp.c	2005-01-26 08:31:08.000000000 +0100
+++ linux-2.6.11-rc2/drivers/char/agp/efficeon-agp.c	2005-01-26 09:49:08.000000000 +0100
@@ -448,7 +448,7 @@ static int __init agp_efficeon_init(void
 		return 0;
 	agp_initialised=1;
 
-	return pci_module_init(&agp_efficeon_pci_driver);
+	return pci_register_driver(&agp_efficeon_pci_driver);
 }
 
 static void __exit agp_efficeon_cleanup(void)
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc2-vanilla/drivers/char/agp/i460-agp.c linux-2.6.11-rc2/drivers/char/agp/i460-agp.c
--- linux-2.6.11-rc2-vanilla/drivers/char/agp/i460-agp.c	2005-01-26 08:31:08.000000000 +0100
+++ linux-2.6.11-rc2/drivers/char/agp/i460-agp.c	2005-01-26 09:49:16.000000000 +0100
@@ -624,7 +624,7 @@ static int __init agp_intel_i460_init(vo
 {
 	if (agp_off)
 		return -EINVAL;
-	return pci_module_init(&agp_intel_i460_pci_driver);
+	return pci_register_driver(&agp_intel_i460_pci_driver);
 }
 
 static void __exit agp_intel_i460_cleanup(void)
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc2-vanilla/drivers/char/agp/intel-agp.c linux-2.6.11-rc2/drivers/char/agp/intel-agp.c
--- linux-2.6.11-rc2-vanilla/drivers/char/agp/intel-agp.c	2005-01-26 08:31:08.000000000 +0100
+++ linux-2.6.11-rc2/drivers/char/agp/intel-agp.c	2005-01-26 09:49:26.000000000 +0100
@@ -1806,7 +1806,7 @@ static struct pci_driver agp_intel_pci_d
 
 static int __init agp_intel_init(void)
 {
-	return pci_module_init(&agp_intel_pci_driver);
+	return pci_register_driver(&agp_intel_pci_driver);
 }
 
 static void __exit agp_intel_cleanup(void)
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc2-vanilla/drivers/char/agp/intel-mch-agp.c linux-2.6.11-rc2/drivers/char/agp/intel-mch-agp.c
--- linux-2.6.11-rc2-vanilla/drivers/char/agp/intel-mch-agp.c	2005-01-26 08:31:08.000000000 +0100
+++ linux-2.6.11-rc2/drivers/char/agp/intel-mch-agp.c	2005-01-26 09:49:33.000000000 +0100
@@ -627,7 +627,7 @@ int __init agp_intelmch_init(void)
 		return 0;
 	agp_initialised=1;
 
-	return pci_module_init(&agp_intelmch_pci_driver);
+	return pci_register_driver(&agp_intelmch_pci_driver);
 }
 
 static void __exit agp_intelmch_cleanup(void)
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc2-vanilla/drivers/char/agp/nvidia-agp.c linux-2.6.11-rc2/drivers/char/agp/nvidia-agp.c
--- linux-2.6.11-rc2-vanilla/drivers/char/agp/nvidia-agp.c	2005-01-26 08:31:08.000000000 +0100
+++ linux-2.6.11-rc2/drivers/char/agp/nvidia-agp.c	2005-01-26 09:49:42.000000000 +0100
@@ -407,7 +407,7 @@ static int __init agp_nvidia_init(void)
 {
 	if (agp_off)
 		return -EINVAL;
-	return pci_module_init(&agp_nvidia_pci_driver);
+	return pci_register_driver(&agp_nvidia_pci_driver);
 }
 
 static void __exit agp_nvidia_cleanup(void)
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc2-vanilla/drivers/char/agp/sis-agp.c linux-2.6.11-rc2/drivers/char/agp/sis-agp.c
--- linux-2.6.11-rc2-vanilla/drivers/char/agp/sis-agp.c	2005-01-26 08:31:08.000000000 +0100
+++ linux-2.6.11-rc2/drivers/char/agp/sis-agp.c	2005-01-26 09:49:51.000000000 +0100
@@ -342,7 +342,7 @@ static int __init agp_sis_init(void)
 {
 	if (agp_off)
 		return -EINVAL;
-	return pci_module_init(&agp_sis_pci_driver);
+	return pci_register_driver(&agp_sis_pci_driver);
 }
 
 static void __exit agp_sis_cleanup(void)
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc2-vanilla/drivers/char/agp/sworks-agp.c linux-2.6.11-rc2/drivers/char/agp/sworks-agp.c
--- linux-2.6.11-rc2-vanilla/drivers/char/agp/sworks-agp.c	2005-01-26 08:31:08.000000000 +0100
+++ linux-2.6.11-rc2/drivers/char/agp/sworks-agp.c	2005-01-26 09:50:02.000000000 +0100
@@ -541,7 +541,7 @@ static int __init agp_serverworks_init(v
 {
 	if (agp_off)
 		return -EINVAL;
-	return pci_module_init(&agp_serverworks_pci_driver);
+	return pci_register_driver(&agp_serverworks_pci_driver);
 }
 
 static void __exit agp_serverworks_cleanup(void)
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc2-vanilla/drivers/char/agp/uninorth-agp.c linux-2.6.11-rc2/drivers/char/agp/uninorth-agp.c
--- linux-2.6.11-rc2-vanilla/drivers/char/agp/uninorth-agp.c	2005-01-26 08:31:08.000000000 +0100
+++ linux-2.6.11-rc2/drivers/char/agp/uninorth-agp.c	2005-01-26 09:50:11.000000000 +0100
@@ -375,7 +375,7 @@ static int __init agp_uninorth_init(void
 {
 	if (agp_off)
 		return -EINVAL;
-	return pci_module_init(&agp_uninorth_pci_driver);
+	return pci_register_driver(&agp_uninorth_pci_driver);
 }
 
 static void __exit agp_uninorth_cleanup(void)
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc2-vanilla/drivers/char/agp/via-agp.c linux-2.6.11-rc2/drivers/char/agp/via-agp.c
--- linux-2.6.11-rc2-vanilla/drivers/char/agp/via-agp.c	2005-01-26 08:31:08.000000000 +0100
+++ linux-2.6.11-rc2/drivers/char/agp/via-agp.c	2005-01-26 09:50:21.000000000 +0100
@@ -525,7 +525,7 @@ static int __init agp_via_init(void)
 {
 	if (agp_off)
 		return -EINVAL;
-	return pci_module_init(&agp_via_pci_driver);
+	return pci_register_driver(&agp_via_pci_driver);
 }
 
 static void __exit agp_via_cleanup(void)

--MnLPg7ZWsaic7Fhd
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--MnLPg7ZWsaic7Fhd--
