From: Scott Feldman <sfeldma@pobox.com>
Date: Mon, 20 Sep 2004 08:20:20 +0000
Subject: Re: [Kernel-janitors] pci_find_* to pci_get_*
Message-Id: <1095668419.4052.22.camel@sfeldma-mobl2.dsl-verizon.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============70194312921197621=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1095662774.4052.10.camel@sfeldma-mobl2.dsl-verizon.net>
In-Reply-To: <1095662774.4052.10.camel@sfeldma-mobl2.dsl-verizon.net>
To: kernel-janitors@vger.kernel.org

--===============70194312921197621==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2004-09-20 at 00:03, Greg KH wrote:
> I've already done a few of these conversions.  They are in the -mm tree,
> in the bk-pci patch, if you are curious.  I also think that Hanna Linder

I'm still trying to map out BK; where is the -mm BK repository?

> It's not a simple conversion all the time, as a number of drivers should
> be converted to use the real "probe/release" functions instead of just
> converting them to pci_get_device.  So feel free to start, as it will
> take a while to get them all.  And don't wait until you are finished
> with all of them to send in patches, even a few here and there are
> gladly accepted.

Here's one for driver/net.  It's off of Jeff's net-drivers-2.6 BK.  This
is a straight s/pci_find_device/pci_get_device; I'll check to see if any
of these need conversion to probe/release, but this should cover
drivers/net for step 1.

-scott

# This is a BitKeeper generated diff -Nru style patch.
#
# ChangeSet
#   2004/09/20 00:23:56-07:00 sfeldma@sfeldma-mobl2.dsl-verizon.net 
#   Use pci_get_device instead of pci_find_device as pci device returned from pci_find_device can disappear at any momemt in time.
# 
# drivers/net/wan/sdladrv.c
#   2004/09/20 00:23:43-07:00 sfeldma@sfeldma-mobl2.dsl-verizon.net +14 -5
#   Use pci_get_device instead of pci_find_device as pci device returned from pci_find_device can disappear at any momemt in time.
# 
# drivers/net/tulip/tulip_core.c
#   2004/09/20 00:23:43-07:00 sfeldma@sfeldma-mobl2.dsl-verizon.net +5 -2
#   Use pci_get_device instead of pci_find_device as pci device returned from pci_find_device can disappear at any momemt in time.
# 
# drivers/net/tg3.c
#   2004/09/20 00:23:43-07:00 sfeldma@sfeldma-mobl2.dsl-verizon.net +13 -10
#   Use pci_get_device instead of pci_find_device as pci device returned from pci_find_device can disappear at any momemt in time.
# 
# drivers/net/sunhme.c
#   2004/09/20 00:23:43-07:00 sfeldma@sfeldma-mobl2.dsl-verizon.net +5 -2
#   Use pci_get_device instead of pci_find_device as pci device returned from pci_find_device can disappear at any momemt in time.
# 
# drivers/net/sis900.c
#   2004/09/20 00:23:43-07:00 sfeldma@sfeldma-mobl2.dsl-verizon.net +7 -4
#   Use pci_get_device instead of pci_find_device as pci device returned from pci_find_device can disappear at any momemt in time.
# 
# drivers/net/ixgb/ixgb_main.c
#   2004/09/20 00:23:43-07:00 sfeldma@sfeldma-mobl2.dsl-verizon.net +2 -1
#   Use pci_get_device instead of pci_find_device as pci device returned from pci_find_device can disappear at any momemt in time.
# 
# drivers/net/gt96100eth.c
#   2004/09/20 00:23:43-07:00 sfeldma@sfeldma-mobl2.dsl-verizon.net +4 -2
#   Use pci_get_device instead of pci_find_device as pci device returned from pci_find_device can disappear at any momemt in time.
# 
# drivers/net/fc/iph5526.c
#   2004/09/20 00:23:43-07:00 sfeldma@sfeldma-mobl2.dsl-verizon.net +11 -5
#   Use pci_get_device instead of pci_find_device as pci device returned from pci_find_device can disappear at any momemt in time.
# 
# drivers/net/e1000/e1000_main.c
#   2004/09/20 00:23:42-07:00 sfeldma@sfeldma-mobl2.dsl-verizon.net +2 -1
#   Use pci_get_device instead of pci_find_device as pci device returned from pci_find_device can disappear at any momemt in time.
# 
diff -Nru a/drivers/net/e1000/e1000_main.c b/drivers/net/e1000/e1000_main.c
--- a/drivers/net/e1000/e1000_main.c	2004-09-20 00:25:03 -07:00
+++ b/drivers/net/e1000/e1000_main.c	2004-09-20 00:25:03 -07:00
@@ -2789,9 +2789,10 @@
 	case SYS_DOWN:
 	case SYS_HALT:
 	case SYS_POWER_OFF:
-		while((pdev = pci_find_device(PCI_ANY_ID, PCI_ANY_ID, pdev))) {
+		while((pdev = pci_get_device(PCI_ANY_ID, PCI_ANY_ID, pdev))) {
 			if(pci_dev_driver(pdev) == &e1000_driver)
 				e1000_suspend(pdev, 3);
+			pci_dev_put(pdev);
 		}
 	}
 	return NOTIFY_DONE;
diff -Nru a/drivers/net/fc/iph5526.c b/drivers/net/fc/iph5526.c
--- a/drivers/net/fc/iph5526.c	2004-09-20 00:25:03 -07:00
+++ b/drivers/net/fc/iph5526.c	2004-09-20 00:25:03 -07:00
@@ -3711,20 +3711,22 @@
 		fc[i] = NULL;
 
 	for (i = 0; clone_list[i].vendor_id != 0; i++)
-	while ((pdev = pci_find_device(clone_list[i].vendor_id, clone_list[i].device_id, pdev))) {
+	while ((pdev = pci_get_device(clone_list[i].vendor_id, clone_list[i].device_id, pdev))) {
 		unsigned short pci_command;
 		if (pci_enable_device(pdev))
-			continue;
+			goto next_dev;
 		if (count < MAX_FC_CARDS) {
 			fc[count] = kmalloc(sizeof(struct fc_info), GFP_ATOMIC);
 			if (fc[count] == NULL) {
 				printk("iph5526.c: Unable to register card # %d\n", count + 1);
+				pci_dev_put(pdev);
 				return no_of_hosts;
 			}
 			memset(fc[count], 0, sizeof(struct fc_info));
 		}
 		else {
 			printk("iph5526.c: Maximum Number of cards reached.\n");
+			pci_dev_put(pdev);
 			return no_of_hosts;
 		}
 			
@@ -3734,6 +3736,7 @@
 		host = scsi_register(tmpt, sizeof(struct iph5526_hostdata));
 		if(host==NULL) {
 			kfree(fc[count]);
+			pci_dev_put(pdev);
 			return no_of_hosts;
 		}
 			
@@ -3753,7 +3756,7 @@
 			scsi_unregister(host);
 			kfree(fc[count]);
 			fc[count] = NULL;
-			continue;
+			goto next_dev;
 		}
 		
 		DPRINTK("pci_maddr = %x", pci_maddr);
@@ -3776,7 +3779,7 @@
 			scsi_unregister(host);
 			kfree(fc[count]);
 			fc[count] = NULL;
-			continue;
+			goto next_dev;
 		}	
 		DPRINTK("IRQ1 = %d\n", pci_irq_line);
 		printk(version);
@@ -3792,7 +3795,7 @@
 				scsi_unregister(host);
 				kfree(fc[count]);
 				fc[count] = NULL;
-				continue;
+				goto next_dev;
 			}
 			host->irq = fi->irq = pci_irq_line;
 			pci_irq_line = 0;
@@ -3807,6 +3810,7 @@
 				clean_up_memory(fi);
 			kfree(fc[count]);
 			fc[count] = NULL;
+			pci_dev_put(pdev);
 			break;
 		}
 		DPRINTK1("Fibre Channel card initialized");
@@ -3821,6 +3825,8 @@
 		
 		count++;
 		no_of_hosts++;
+next_dev:
+		pci_dev_put(pdev);
 	}
 	DPRINTK1("no_of_hosts = %d",no_of_hosts);
 	
diff -Nru a/drivers/net/gt96100eth.c b/drivers/net/gt96100eth.c
--- a/drivers/net/gt96100eth.c	2004-09-20 00:25:03 -07:00
+++ b/drivers/net/gt96100eth.c	2004-09-20 00:25:03 -07:00
@@ -617,9 +617,9 @@
 	/*
 	 * Stupid probe because this really isn't a PCI device
 	 */
-	if (!(pci = pci_find_device(PCI_VENDOR_ID_MARVELL,
+	if (!(pci = pci_get_device(PCI_VENDOR_ID_MARVELL,
 	                            PCI_DEVICE_ID_MARVELL_GT96100, NULL)) &&
-	    !(pci = pci_find_device(PCI_VENDOR_ID_MARVELL,
+	    !(pci = pci_get_device(PCI_VENDOR_ID_MARVELL,
 		                    PCI_DEVICE_ID_MARVELL_GT96100A, NULL))) {
 		printk(KERN_ERR __FILE__ ": GT96100 not found!\n");
 		return -ENODEV;
@@ -629,12 +629,14 @@
 	if (cpuConfig & (1<<12)) {
 		printk(KERN_ERR __FILE__
 		       ": must be in Big Endian mode!\n");
+		pci_dev_put(pci);
 		return -ENODEV;
 	}
 
 	for (i=0; i < NUM_INTERFACES; i++)
 		retval |= gt96100_probe1(pci, i);
 
+	pci_dev_put(pci);
 	return retval;
 }
 
diff -Nru a/drivers/net/ixgb/ixgb_main.c b/drivers/net/ixgb/ixgb_main.c
--- a/drivers/net/ixgb/ixgb_main.c	2004-09-20 00:25:03 -07:00
+++ b/drivers/net/ixgb/ixgb_main.c	2004-09-20 00:25:03 -07:00
@@ -2094,9 +2094,10 @@
 	case SYS_DOWN:
 	case SYS_HALT:
 	case SYS_POWER_OFF:
-		while ((pdev = pci_find_device(PCI_ANY_ID, PCI_ANY_ID, pdev))) {
+		while ((pdev = pci_get_device(PCI_ANY_ID, PCI_ANY_ID, pdev))) {
 			if (pci_dev_driver(pdev) == &ixgb_driver)
 				ixgb_suspend(pdev, 3);
+			pci_dev_put(pdev);
 		}
 	}
 	return NOTIFY_DONE;
diff -Nru a/drivers/net/sis900.c b/drivers/net/sis900.c
--- a/drivers/net/sis900.c	2004-09-20 00:25:03 -07:00
+++ b/drivers/net/sis900.c	2004-09-20 00:25:03 -07:00
@@ -262,9 +262,9 @@
 	u8 reg;
 	int i;
 
-	isa_bridge = pci_find_device(PCI_VENDOR_ID_SI, 0x0008, isa_bridge);
+	isa_bridge = pci_get_device(PCI_VENDOR_ID_SI, 0x0008, isa_bridge);
 	if (!isa_bridge) {
-		isa_bridge = pci_find_device(PCI_VENDOR_ID_SI, 0x0018, isa_bridge);
+		isa_bridge = pci_get_device(PCI_VENDOR_ID_SI, 0x0018, isa_bridge);
 		if (!isa_bridge) {
 			printk("%s: Can not find ISA bridge\n", net_dev->name);
 			return 0;
@@ -279,6 +279,7 @@
 	}
 	pci_write_config_byte(isa_bridge, 0x48, reg & ~0x40);
 
+	pci_dev_put(isa_bridge);
 	return 1;
 }
 
@@ -485,9 +486,11 @@
 	}
 
 	/* save our host bridge revision */
-	dev = pci_find_device(PCI_VENDOR_ID_SI, PCI_DEVICE_ID_SI_630, NULL);
-	if (dev)
+	dev = pci_get_device(PCI_VENDOR_ID_SI, PCI_DEVICE_ID_SI_630, NULL);
+	if (dev) {
 		pci_read_config_byte(dev, PCI_CLASS_REVISION, &sis_priv->host_bridge_rev);
+		pci_dev_put(dev);
+	}
 
 	/* print some information about our NIC */
 	printk(KERN_INFO "%s: %s at %#lx, IRQ %d, ", net_dev->name,
diff -Nru a/drivers/net/sunhme.c b/drivers/net/sunhme.c
--- a/drivers/net/sunhme.c	2004-09-20 00:25:03 -07:00
+++ b/drivers/net/sunhme.c	2004-09-20 00:25:03 -07:00
@@ -3311,13 +3311,16 @@
 	struct pci_dev *pdev = NULL;
 	int cards = 0;
 
-	while ((pdev = pci_find_device(PCI_VENDOR_ID_SUN,
+	while ((pdev = pci_get_device(PCI_VENDOR_ID_SUN,
 				       PCI_DEVICE_ID_SUN_HAPPYMEAL, pdev)) != NULL) {
-		if (pci_enable_device(pdev))
+		if (pci_enable_device(pdev)) {
+			pci_dev_put(pdev);
 			continue;
+		}
 		pci_set_master(pdev);
 		cards++;
 		happy_meal_pci_init(pdev);
+		pci_dev_put(pdev);
 	}
 	return cards;
 }
diff -Nru a/drivers/net/tg3.c b/drivers/net/tg3.c
--- a/drivers/net/tg3.c	2004-09-20 00:25:03 -07:00
+++ b/drivers/net/tg3.c	2004-09-20 00:25:03 -07:00
@@ -7380,6 +7380,7 @@
 	u32 pci_state_reg, grc_misc_cfg;
 	u32 val;
 	u16 pci_cmd;
+	struct pci_dev *pdev;
 	int err;
 
 #ifdef CONFIG_SPARC64
@@ -7393,17 +7394,19 @@
 	 * every mailbox register write to force the writes to be
 	 * posted to the chip in order.
 	 */
-	if (pci_find_device(PCI_VENDOR_ID_INTEL,
-			    PCI_DEVICE_ID_INTEL_82801AA_8, NULL) ||
-	    pci_find_device(PCI_VENDOR_ID_INTEL,
-			    PCI_DEVICE_ID_INTEL_82801AB_8, NULL) ||
-	    pci_find_device(PCI_VENDOR_ID_INTEL,
-			    PCI_DEVICE_ID_INTEL_82801BA_11, NULL) ||
-	    pci_find_device(PCI_VENDOR_ID_INTEL,
-			    PCI_DEVICE_ID_INTEL_82801BA_6, NULL) ||
-	    pci_find_device(PCI_VENDOR_ID_AMD,
-			    PCI_DEVICE_ID_AMD_FE_GATE_700C, NULL))
+	if ((pdev = pci_get_device(PCI_VENDOR_ID_INTEL,
+			    PCI_DEVICE_ID_INTEL_82801AA_8, NULL)) ||
+	    (pdev = pci_get_device(PCI_VENDOR_ID_INTEL,
+			    PCI_DEVICE_ID_INTEL_82801AB_8, NULL)) ||
+	    (pdev = pci_get_device(PCI_VENDOR_ID_INTEL,
+			    PCI_DEVICE_ID_INTEL_82801BA_11, NULL)) ||
+	    (pdev = pci_get_device(PCI_VENDOR_ID_INTEL,
+			    PCI_DEVICE_ID_INTEL_82801BA_6, NULL)) ||
+	    (pdev = pci_get_device(PCI_VENDOR_ID_AMD,
+			    PCI_DEVICE_ID_AMD_FE_GATE_700C, NULL))) {
 		tp->tg3_flags |= TG3_FLAG_MBOX_WRITE_REORDER;
+		pci_dev_put(pdev);
+	}
 
 	/* Force memory write invalidate off.  If we leave it on,
 	 * then on 5700_BX chips we have to enable a workaround.
diff -Nru a/drivers/net/tulip/tulip_core.c b/drivers/net/tulip/tulip_core.c
--- a/drivers/net/tulip/tulip_core.c	2004-09-20 00:25:03 -07:00
+++ b/drivers/net/tulip/tulip_core.c	2004-09-20 00:25:03 -07:00
@@ -1249,6 +1249,7 @@
 	const char *chip_name = tulip_tbl[chip_idx].chip_name;
 	unsigned int eeprom_missing = 0;
 	unsigned int force_csr0 = 0;
+	struct pci_dev *pdev_cs;
 
 #ifndef MODULE
 	static int did_version;		/* Already printed version info. */
@@ -1294,14 +1295,16 @@
 	   thankfully it's an old 486 chipset.
 	*/
 
-	if (pci_find_device(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_82424, NULL)) {
+	if ((pdev_cs = pci_get_device(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_82424, NULL))) {
 		csr0 = MRL | MRM | (8 << BurstLenShift) | (1 << CALShift);
 		force_csr0 = 1;
+		pci_dev_put(pdev_cs);
 	}
 	/* The dreaded SiS496 486 chipset. Same workaround as above. */
-	if (pci_find_device(PCI_VENDOR_ID_SI, PCI_DEVICE_ID_SI_496, NULL)) {
+	if ((pdev_cs = pci_get_device(PCI_VENDOR_ID_SI, PCI_DEVICE_ID_SI_496, NULL))) {
 		csr0 = MRL | MRM | (8 << BurstLenShift) | (1 << CALShift);
 		force_csr0 = 1;
+		pci_dev_put(pdev_cs);
 	}
 
 	/* bugfix: the ASIX must have a burst limit or horrible things happen. */
diff -Nru a/drivers/net/wan/sdladrv.c b/drivers/net/wan/sdladrv.c
--- a/drivers/net/wan/sdladrv.c	2004-09-20 00:25:03 -07:00
+++ b/drivers/net/wan/sdladrv.c	2004-09-20 00:25:03 -07:00
@@ -2032,19 +2032,23 @@
  
        slot_no = hw->S514_slot_no;
   
-	while ((pci_dev = pci_find_device(V3_VENDOR_ID, V3_DEVICE_ID, pci_dev))
+	while ((pci_dev = pci_get_device(V3_VENDOR_ID, V3_DEVICE_ID, pci_dev))
         	!= NULL) {
                 
 		pci_read_config_word(pci_dev, PCI_SUBSYS_VENDOR_WORD,
                         &PCI_subsys_vendor);
                 
-		if(PCI_subsys_vendor != SANGOMA_SUBSYS_VENDOR)
+		if(PCI_subsys_vendor != SANGOMA_SUBSYS_VENDOR) {
+			pci_dev_put(pci_dev);
                 	continue;
+		}
         	
 		hw->pci_dev = pci_dev;
 		
-		if(find_first_S514_card)
+		if(find_first_S514_card) {
+			pci_dev_put(pci_dev);
 			return(1);
+		}
 		
                 number_S514_cards ++;
                 
@@ -2059,8 +2063,10 @@
 			
 		}else if (((pci_dev->devfn >> 3) & PCI_DEV_SLOT_MASK) == slot_no){
                         S514_found_in_slot = 1;
+			pci_dev_put(pci_dev);
                         break;
                 }
+		pci_dev_put(pci_dev);
         }
 
 	/* if no S514 adapter has been found, then exit */
@@ -2245,14 +2251,16 @@
  
        slot_no = 0;
   
-	while ((pci_dev = pci_find_device(V3_VENDOR_ID, V3_DEVICE_ID, pci_dev))
+	while ((pci_dev = pci_get_device(V3_VENDOR_ID, V3_DEVICE_ID, pci_dev))
         	!= NULL) {
 		
                 pci_read_config_word(pci_dev, PCI_SUBSYS_VENDOR_WORD,
                         &PCI_subsys_vendor);
 		
-                if(PCI_subsys_vendor != SANGOMA_SUBSYS_VENDOR)
+                if(PCI_subsys_vendor != SANGOMA_SUBSYS_VENDOR) {
+			pci_dev_put(pci_dev);
                 	continue;
+		}
 
 		pci_read_config_word(pci_dev, PCI_CARD_TYPE,
                         &PCI_card_type);
@@ -2277,6 +2285,7 @@
                         	bus->number,((pci_dev->devfn >> 3) & PCI_DEV_SLOT_MASK),
 				pci_dev->irq);
 		}
+		pci_dev_put(pci_dev);
         }
 
 	return number_S514_cards;



--===============70194312921197621==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============70194312921197621==--
