From: Peter =?iso-8859-1?q?H=FCwe?= <PeterHuewe@gmx.de>
Date: Thu, 15 Jul 2010 13:57:37 +0000
Subject: Re: Convert pci_table entries with PCI_ANY_ID to PCI_DEVICE ?
Message-Id: <201007151557.37555.PeterHuewe@gmx.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <201007151550.42146.PeterHuewe@gmx.de>
In-Reply-To: <201007151550.42146.PeterHuewe@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Or even better convert them using PCI_VDEVICE,

Here's the same sample patch with PCI_VDEVICE:

---
diff --git a/arch/x86/kernel/cpu/cpufreq/gx-suspmod.c 
b/arch/x86/kernel/cpu/cpufreq/gx-suspmod.c
index 16e3483..581b29c 100644
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
+       { PCI_VDEVICE(CYRIX, PCI_DEVICE_ID_CYRIX_5530_LEGACY) },
+       { PCI_VDEVICE(CYRIX, PCI_DEVICE_ID_CYRIX_5520) },
+       { PCI_VDEVICE(CYRIX, PCI_DEVICE_ID_CYRIX_5510) },
        { 0, },
 };
---

What do you think?

