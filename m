From: =?ISO-8859-1?Q?Daniel_Marjam=E4ki?= <daniel.marjamaki@comhem.se>
Date: Sun, 27 Nov 2005 19:41:20 +0000
Subject: [KJ] changed from pci_find_device to pci_get_device
Message-Id: <438A0BE0.4010904@comhem.se>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org



Hello friends!

I've made some changes and are interested in feedback (drivers/ide/pci/via8=
2cxxx.c).

Some notes:
* The main change was to switch from pci_find_device to pci_get_device.
* I unlock "isa" when it won't be used anymore
* Changed a return value because init_chipset_via82cxxx returns an unsigned=
 value.

This is the patch in a readable format:

static unsigned int __devinit init_chipset_via82cxxx(struct pci_dev *dev, c=
onst char *name)
{
	struct pci_dev *isa =3D NULL;

	for (via_config =3D via_isa_bridges; via_config->id; via_config++)
-		if ((isa =3D pci_find_device(PCI_VENDOR_ID_VIA +
+		if ((isa =3D pci_get_device(PCI_VENDOR_ID_VIA +
			!!(via_config->flags & VIA_BAD_ID),
			via_config->id, NULL))) {

			pci_read_config_byte(isa, PCI_REVISION_ID, &t);
			if (t >=3D via_config->rev_min &&
			    t <=3D via_config->rev_max)
				break;
+
+			pci_dev_put(isa);
		}

	if (!via_config->id) {
		printk(KERN_WARNING "VP_IDE: Unknown VIA SouthBridge, disabling DMA.\n");
-		return -ENODEV;
+		return ENODEV;
	}

	/* DO STUFF (I don't include it here for your convenience) */

#if defined(DISPLAY_VIA_TIMINGS) && defined(CONFIG_PROC_FS)
-	if (!via_proc) {
+	if (via_proc) {
+		isa_dev =3D NULL;
+		pci_dev_put(isa);
+	} else {
		via_base =3D pci_resource_start(dev, 4);
		bmide_dev =3D dev;
		isa_dev =3D isa;
		ide_pci_create_host_proc("via", via_get_info);
		via_proc =3D 1;
	}
+#else
+	pci_dev_put(isa);=09
#endif /* DISPLAY_VIA_TIMINGS && CONFIG_PROC_FS */

	return 0;
}


+#if defined(DISPLAY_VIA_TIMINGS) && defined(CONFIG_PROC_FS)
+static void via_ide_exit(void)
+{
+	if (isa_dev)
+		pci_dev_put(isa_dev);
+}
+module_exit(via_ide_exit);
+#endif /* DISPLAY_VIA_TIMINGS && CONFIG_PROC_FS */


Best regards,
Daniel Marjam=E4ki




_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
