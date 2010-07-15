From: Peter =?iso-8859-1?q?H=FCwe?= <PeterHuewe@gmx.de>
Date: Thu, 15 Jul 2010 13:50:41 +0000
Subject: Convert pci_table entries with PCI_ANY_ID to PCI_DEVICE ?
Message-Id: <201007151550.42146.PeterHuewe@gmx.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi,

I was wondering what you think about changing pci_table entries with 
subvendor=PCI_ANY_ID and subdevice=PCI_ANY_ID to use the PCI_DEVICE MACRO?

Here's a sample patch:

---
diff --git a/arch/x86/kernel/cpu/cpufreq/gx-suspmod.c 
b/arch/x86/kernel/cpu/cpufreq/gx-suspmod.c
index 16e3483..b0126eb 100644
--- a/arch/x86/kernel/cpu/cpufreq/gx-suspmod.c
+++ b/arch/x86/kernel/cpu/cpufreq/gx-suspmod.c
@@ -169,12 +169,9 @@ static int gx_freq_mult[16] = {
  *     Low Level chipset interface                             *
  ****************************************************************/
 static struct pci_device_id gx_chipset_tbl[] __initdata = {
-       { PCI_VENDOR_ID_CYRIX, PCI_DEVICE_ID_CYRIX_5530_LEGACY,
-               PCI_ANY_ID, PCI_ANY_ID },
-       { PCI_VENDOR_ID_CYRIX, PCI_DEVICE_ID_CYRIX_5520,
-               PCI_ANY_ID, PCI_ANY_ID },
-       { PCI_VENDOR_ID_CYRIX, PCI_DEVICE_ID_CYRIX_5510,
-               PCI_ANY_ID, PCI_ANY_ID },
+       { PCI_DEVICE(PCI_VENDOR_ID_CYRIX, PCI_DEVICE_ID_CYRIX_5530_LEGACY) },
+       { PCI_DEVICE(PCI_VENDOR_ID_CYRIX, PCI_DEVICE_ID_CYRIX_5520) },
+       { PCI_DEVICE(PCI_VENDOR_ID_CYRIX, PCI_DEVICE_ID_CYRIX_5510) },
        { 0, },
 };
---
Do you think it's worth the effort (e.g. in terms of readability) to convert 
the entries?


Thanks,
Peter

