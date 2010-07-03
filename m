From: Kulikov Vasiliy <segooon@gmail.com>
Date: Sat, 03 Jul 2010 16:03:55 +0000
Subject: [PATCH 06/19] arch/x86/kernel/cpu/cpufreq: use for_each_pci_dev()
Message-Id: <1278173036-11609-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kernel Janitors <kernel-janitors@vger.kernel.org>
Cc: Dave Jones <davej@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Tejun Heo <tj@kernel.org>, cpufreq@vger.kernel.org, linux-kernel@vger.kernel.org

Use for_each_pci_dev() to simplify the code.

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
---
 arch/x86/kernel/cpu/cpufreq/gx-suspmod.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/x86/kernel/cpu/cpufreq/gx-suspmod.c b/arch/x86/kernel/cpu/cpufreq/gx-suspmod.c
index 16e3483..8c3325f 100644
--- a/arch/x86/kernel/cpu/cpufreq/gx-suspmod.c
+++ b/arch/x86/kernel/cpu/cpufreq/gx-suspmod.c
@@ -199,7 +199,7 @@ static __init struct pci_dev *gx_detect_chipset(void)
 	}
 
 	/* detect which companion chip is used */
-	while ((gx_pci = pci_get_device(PCI_ANY_ID, PCI_ANY_ID, gx_pci)) != NULL) {
+	for_each_pci_dev(gx_pci) {
 		if ((pci_match_id(gx_chipset_tbl, gx_pci)) != NULL)
 			return gx_pci;
 	}
-- 
1.7.0.4

