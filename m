From: Hanna Linder <hannal@us.ibm.com>
Date: Thu, 30 Sep 2004 00:08:17 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2-mm4 cmipci.c] [8/8] Replace
Message-Id: <28440000.1096502897@w-hlinder.beaverton.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============3062008480246321=="
List-Id: <kernel-janitors.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@lists.osdl.org, greg@kroah.com, sailer@ife.ee.ethz.ch, perex@suse.cz

--===============3062008480246321==
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


The pci_find_device function is going away so I have replace it with pci_dev_present.
I also just used the macros it should have been using in the first place. I have compile tested it.

Hanna Linder
IBM Linux Technology Center

Signed-off-by: Hanna Linder <hannal@us.ibm.com>

---
diff -Nrup linux-2.6.9-rc2-mm4cln/sound/pci/cmipci.c linux-2.6.9-rc2-mm4patch2/sound/pci/cmipci.c
--- linux-2.6.9-rc2-mm4cln/sound/pci/cmipci.c	2004-09-12 22:32:55.000000000 -0700
+++ linux-2.6.9-rc2-mm4patch2/sound/pci/cmipci.c	2004-09-29 16:32:30.000000000 -0700
@@ -2573,6 +2573,10 @@ static int __devinit snd_cmipci_create(s
 	long iomidi = mpu_port[dev];
 	long iosynth = fm_port[dev];
 	int pcm_index, pcm_spdif_index;
+	static struct pci_device_id intel_82437vx[] = {
+		{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_82437VX) },
+		{ },
+	};
 
 	*rcmipci = NULL;
 
@@ -2648,8 +2652,7 @@ static int __devinit snd_cmipci_create(s
 	switch (pci->device) {
 	case PCI_DEVICE_ID_CMEDIA_CM8738:
 	case PCI_DEVICE_ID_CMEDIA_CM8738B:
-		/* PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_82437VX */
-		if (! pci_find_device(0x8086, 0x7030, NULL))
+		if (!pci_dev_present(intel_82437vx)) 
 			snd_cmipci_set_bit(cm, CM_REG_MISC_CTRL, CM_TXVX);
 		break;
 	default:



--===============3062008480246321==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============3062008480246321==--
