From: Amit Gud <amitg@calsoftinc.com>
Date: Mon, 14 Feb 2005 05:47:46 +0000
Subject: [KJ] [PATCH 1/18] remove pci_find_{device, subsys}
Message-Id: <200502141105.50867.amitg@calsoftinc.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============5007818807827249=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============5007818807827249==
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


Remove deprecated pci_find_device and pci_find_subsys


AG
--
May the source be with you


Signed-off-by: Amit Gud <gud@eth.net>


diff -uprN orig/drivers/pci/pci-sysfs.c linux-2.6.11-rc3/drivers/pci/pci-sysfs.c
--- orig/drivers/pci/pci-sysfs.c	2005-02-11 15:19:51.000000000 +0530
+++ linux-2.6.11-rc3/drivers/pci/pci-sysfs.c	2005-02-14 02:13:31.000000000 +0530
@@ -480,7 +480,7 @@ static int __init pci_sysfs_init(void)
 	struct pci_dev *pdev = NULL;
 	
 	sysfs_initialized = 1;
-	while ((pdev = pci_find_device(PCI_ANY_ID, PCI_ANY_ID, pdev)) != NULL)
+	while ((pdev = pci_get_device(PCI_ANY_ID, PCI_ANY_ID, pdev)) != NULL)
 		pci_create_sysfs_dev_files(pdev);
 
 	return 0;
diff -uprN orig/drivers/pci/search.c linux-2.6.11-rc3/drivers/pci/search.c
--- orig/drivers/pci/search.c	2005-02-11 15:19:51.000000000 +0530
+++ linux-2.6.11-rc3/drivers/pci/search.c	2005-02-14 05:41:27.000000000 +0530
@@ -97,7 +97,7 @@ pci_find_slot(unsigned int bus, unsigned
 {
 	struct pci_dev *dev = NULL;
 
-	while ((dev = pci_find_device(PCI_ANY_ID, PCI_ANY_ID, dev)) != NULL) {
+	while ((dev = pci_get_device(PCI_ANY_ID, PCI_ANY_ID, dev)) != NULL) {
 		if (dev->bus->number == bus && dev->devfn == devfn)
 			return dev;
 	}
@@ -140,74 +140,6 @@ struct pci_dev * pci_get_slot(struct pci
 }
 
 /**
- * pci_find_subsys - begin or continue searching for a PCI device by vendor/subvendor/device/subdevice id
- * @vendor: PCI vendor id to match, or %PCI_ANY_ID to match all vendor ids
- * @device: PCI device id to match, or %PCI_ANY_ID to match all device ids
- * @ss_vendor: PCI subsystem vendor id to match, or %PCI_ANY_ID to match all vendor ids
- * @ss_device: PCI subsystem device id to match, or %PCI_ANY_ID to match all device ids
- * @from: Previous PCI device found in search, or %NULL for new search.
- *
- * Iterates through the list of known PCI devices.  If a PCI device is
- * found with a matching @vendor, @device, @ss_vendor and @ss_device, a pointer to its
- * device structure is returned.  Otherwise, %NULL is returned.
- * A new search is initiated by passing %NULL to the @from argument.
- * Otherwise if @from is not %NULL, searches continue from next device on the global list.
- *
- * NOTE: Do not use this function anymore, use pci_get_subsys() instead, as
- * the pci device returned by this function can disappear at any moment in
- * time.
- */
-static struct pci_dev * pci_find_subsys(unsigned int vendor,
-				        unsigned int device,
-					unsigned int ss_vendor,
-					unsigned int ss_device,
-					const struct pci_dev *from)
-{
-	struct list_head *n;
-	struct pci_dev *dev;
-
-	WARN_ON(in_interrupt());
-	spin_lock(&pci_bus_lock);
-	n = from ? from->global_list.next : pci_devices.next;
-
-	while (n && (n != &pci_devices)) {
-		dev = pci_dev_g(n);
-		if ((vendor == PCI_ANY_ID || dev->vendor == vendor) &&
-		    (device == PCI_ANY_ID || dev->device == device) &&
-		    (ss_vendor == PCI_ANY_ID || dev->subsystem_vendor == ss_vendor) &&
-		    (ss_device == PCI_ANY_ID || dev->subsystem_device == ss_device))
-			goto exit;
-		n = n->next;
-	}
-	dev = NULL;
-exit:
-	spin_unlock(&pci_bus_lock);
-	return dev;
-}
-
-/**
- * pci_find_device - begin or continue searching for a PCI device by vendor/device id
- * @vendor: PCI vendor id to match, or %PCI_ANY_ID to match all vendor ids
- * @device: PCI device id to match, or %PCI_ANY_ID to match all device ids
- * @from: Previous PCI device found in search, or %NULL for new search.
- *
- * Iterates through the list of known PCI devices.  If a PCI device is
- * found with a matching @vendor and @device, a pointer to its device structure is
- * returned.  Otherwise, %NULL is returned.
- * A new search is initiated by passing %NULL to the @from argument.
- * Otherwise if @from is not %NULL, searches continue from next device on the global list.
- * 
- * NOTE: Do not use this function anymore, use pci_get_device() instead, as
- * the pci device returned by this function can disappear at any moment in
- * time.
- */
-struct pci_dev *
-pci_find_device(unsigned int vendor, unsigned int device, const struct pci_dev *from)
-{
-	return pci_find_subsys(vendor, device, PCI_ANY_ID, PCI_ANY_ID, from);
-}
-
-/**
  * pci_get_subsys - begin or continue searching for a PCI device by vendor/subvendor/device/subdevice id
  * @vendor: PCI vendor id to match, or %PCI_ANY_ID to match all vendor ids
  * @device: PCI device id to match, or %PCI_ANY_ID to match all device ids
@@ -379,7 +311,6 @@ exit:				
 EXPORT_SYMBOL(pci_dev_present);
 
 EXPORT_SYMBOL(pci_find_bus);
-EXPORT_SYMBOL(pci_find_device);
 EXPORT_SYMBOL(pci_find_device_reverse);
 EXPORT_SYMBOL(pci_find_slot);
 EXPORT_SYMBOL(pci_get_device);
--- orig/include/linux/pci.h	2005-02-11 15:20:05.000000000 +0530
+++ linux-2.6.11-rc3/include/linux/pci.h	2005-02-14 05:44:48.000000000 +0530
@@ -754,7 +754,6 @@ extern void pci_remove_bus_device(struct
 
 /* Generic PCI functions exported to card drivers */
 
-struct pci_dev *pci_find_device (unsigned int vendor, unsigned int device, const struct pci_dev *from);
 struct pci_dev *pci_find_device_reverse (unsigned int vendor, unsigned int device, const struct pci_dev *from);
 struct pci_dev *pci_find_slot (unsigned int bus, unsigned int devfn);
 int pci_find_capability (struct pci_dev *dev, int cap);
@@ -917,9 +916,6 @@ extern void msi_remove_pci_irq_vectors(s
 _PCI_NOP_ALL(read, *)
 _PCI_NOP_ALL(write,)
 
-static inline struct pci_dev *pci_find_device(unsigned int vendor, unsigned int device, const struct pci_dev *from)
-{ return NULL; }
-
 static inline struct pci_dev *pci_find_slot(unsigned int bus, unsigned int devfn)
 { return NULL; }
 


--===============5007818807827249==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============5007818807827249==--
