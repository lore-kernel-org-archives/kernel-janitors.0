From: =?ISO-8859-1?Q?Daniel_Marjam=E4ki?= <daniel.marjamaki@comhem.se>
Date: Tue, 29 Nov 2005 13:56:09 +0000
Subject: Re: [KJ] changed from pci_find_device to pci_get_device
Message-Id: <438C5DF9.80800@comhem.se>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============18320274550936544=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <438A0BE0.4010904@comhem.se>
In-Reply-To: <438A0BE0.4010904@comhem.se>
To: kernel-janitors@vger.kernel.org

--===============18320274550936544==
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit


Hello friends!

I have reworked my patch that I sent a few days ago.
I made huge mistakes in the previous patch but I hope this patch is perfect.


--- a/drivers/ide/pci/via82cxxx.c	2005-11-29 14:45:00.000000000 +0100
+++ b/drivers/ide/pci/via82cxxx.c	2005-11-29 14:49:32.000000000 +0100
@@ -247,7 +247,7 @@ static struct via_isa_bridge *via_config
  	u8 t;

  	for (via_config = via_isa_bridges; via_config->id; via_config++)
-		if ((*isa = pci_find_device(PCI_VENDOR_ID_VIA +
+		if ((*isa = pci_get_device(PCI_VENDOR_ID_VIA +
  			!!(via_config->flags & VIA_BAD_ID),
  			via_config->id, NULL))) {

@@ -255,6 +255,9 @@ static struct via_isa_bridge *via_config
  			if (t >= via_config->rev_min &&
  			    t <= via_config->rev_max)
  				break;
+
+			pci_dev_put(*isa);
+			*isa = NULL;
  		}

  	return via_config;
@@ -360,6 +363,8 @@ static unsigned int __devinit init_chips
  		via_dma[via_config->flags & VIA_UDMA],
  		pci_name(dev));

+	pci_dev_put(isa);
+
  	return 0;
  }

@@ -430,6 +435,8 @@ static void __devinit init_hwif_via82cxx
  	ide_set_hwifdata(hwif, vdev);

  	vdev->via_config = via_config_find(&isa);
+	if (isa)
+		pci_dev_put(isa);
  	via_cable_detect(hwif->pci_dev, vdev);

  	hwif->autodma = 0;



--===============18320274550936544==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============18320274550936544==--
