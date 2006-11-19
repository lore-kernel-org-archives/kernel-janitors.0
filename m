From: trem <tremyfr@yahoo.fr>
Date: Sun, 19 Nov 2006 23:31:25 +0000
Subject: [KJ] [PATCH] replace pci_find_device with pci_get_device in
Message-Id: <4560E94D.4090706@yahoo.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------020704090005000409040105"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------020704090005000409040105
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

From: trem <tremyfr@yahoo.fr>

This patch simply replaces pci_find_device by pci_get_device, because
pci_find_device is deprecated. pci_dev_put has been added to decrement
the counter, so unload could be done.

Signed-Off-By: trem <tremyfr@yahoo.fr>
---


--------------020704090005000409040105
Content-Type: text/x-patch;
	name*0="longhaul_replace_pci_find_device_by_pci_get_device.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename*0="longhaul_replace_pci_find_device_by_pci_get_device.patch"

diff --git a/arch/i386/kernel/cpu/cpufreq/longhaul.c b/arch/i386/kernel/cpu/cpufreq/longhaul.c
index 7233abe..37c28f9 100644
--- a/arch/i386/kernel/cpu/cpufreq/longhaul.c
+++ b/arch/i386/kernel/cpu/cpufreq/longhaul.c
@@ -578,11 +578,11 @@ static int enable_arbiter_disable(void)
 
 	/* Find PLE133 host bridge */
 	reg = 0x78;
-	dev = pci_find_device(PCI_VENDOR_ID_VIA, PCI_DEVICE_ID_VIA_8601_0, NULL);
+	dev = pci_get_device(PCI_VENDOR_ID_VIA, PCI_DEVICE_ID_VIA_8601_0, NULL);
 	/* Find CLE266 host bridge */
 	if (dev == NULL) {
 		reg = 0x76;
-		dev = pci_find_device(PCI_VENDOR_ID_VIA, PCI_DEVICE_ID_VIA_862X_0, NULL);
+		dev = pci_get_device(PCI_VENDOR_ID_VIA, PCI_DEVICE_ID_VIA_862X_0, NULL);
 	}
 	if (dev != NULL) {
 		/* Enable access to port 0x22 */
@@ -591,6 +591,7 @@ static int enable_arbiter_disable(void)
 			pci_cmd |= 1<<7;
 			pci_write_config_byte(dev, reg, pci_cmd);
 		}
+		pci_dev_put(dev);
 		return 1;
 	}
 	return 0;

--------------020704090005000409040105
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------020704090005000409040105--
