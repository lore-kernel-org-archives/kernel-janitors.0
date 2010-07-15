From: Peter =?iso-8859-1?q?H=FCwe?= <PeterHuewe@gmx.de>
Date: Thu, 15 Jul 2010 18:36:41 +0000
Subject: [PATCH 02/25] cpufreq: Convert pci_table entries to PCI_VDEVICE (if PCI_ANY_ID is used)
Message-Id: <201007152036.41768.PeterHuewe@gmx.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kernel Janitors <kernel-janitors@vger.kernel.org>
Cc: Dave Jones <davej@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Tejun Heo <tj@kernel.org>, cpufreq@vger.kernel.org, linux-kernel@vger.kernel.org

From: Peter Huewe <peterhuewe@gmx.de>

This patch converts pci_table entries, where .subvendor=PCI_ANY_ID and
.subdevice=PCI_ANY_ID, .class=0 and .class_mask=0, to use the
PCI_VDEVICE macro, and thus improves readability.

Signed-off-by: Peter Huewe <peterhuewe@gmx.de>
---
 arch/x86/kernel/cpu/cpufreq/gx-suspmod.c |    9 +++------
 1 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kernel/cpu/cpufreq/gx-suspmod.c b/arch/x86/kernel/cpu/cpufreq/gx-suspmod.c
index 16e3483..a7867ee 100644
--- a/arch/x86/kernel/cpu/cpufreq/gx-suspmod.c
+++ b/arch/x86/kernel/cpu/cpufreq/gx-suspmod.c
@@ -169,12 +169,9 @@ static int gx_freq_mult[16] = {
  *	Low Level chipset interface				*
  ****************************************************************/
 static struct pci_device_id gx_chipset_tbl[] __initdata = {
-	{ PCI_VENDOR_ID_CYRIX, PCI_DEVICE_ID_CYRIX_5530_LEGACY,
-		PCI_ANY_ID, PCI_ANY_ID },
-	{ PCI_VENDOR_ID_CYRIX, PCI_DEVICE_ID_CYRIX_5520,
-		PCI_ANY_ID, PCI_ANY_ID },
-	{ PCI_VENDOR_ID_CYRIX, PCI_DEVICE_ID_CYRIX_5510,
-		PCI_ANY_ID, PCI_ANY_ID },
+	{ PCI_VDEVICE(CYRIX, PCI_DEVICE_ID_CYRIX_5530_LEGACY), },
+	{ PCI_VDEVICE(CYRIX, PCI_DEVICE_ID_CYRIX_5520), },
+	{ PCI_VDEVICE(CYRIX, PCI_DEVICE_ID_CYRIX_5510), },
 	{ 0, },
 };
 
-- 
1.7.1

