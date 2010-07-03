From: Kulikov Vasiliy <segooon@gmail.com>
Date: Sat, 03 Jul 2010 16:03:59 +0000
Subject: [PATCH 07/19] arch/x86/kernel: use for_each_pci_dev()
Message-Id: <1278173040-11643-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kernel Janitors <kernel-janitors@vger.kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Borislav Petkov <borislav.petkov@amd.com>, Tejun Heo <tj@kernel.org>, linux-kernel@vger.kernel.org

Use for_each_pci_dev() to simplify the code.

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
---
 arch/x86/kernel/k8.c |    7 +++----
 1 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kernel/k8.c b/arch/x86/kernel/k8.c
index 0f7bc20..0ea4b35 100644
--- a/arch/x86/kernel/k8.c
+++ b/arch/x86/kernel/k8.c
@@ -27,11 +27,10 @@ EXPORT_SYMBOL(k8_northbridges);
 
 static struct pci_dev *next_k8_northbridge(struct pci_dev *dev)
 {
-	do {
-		dev = pci_get_device(PCI_ANY_ID, PCI_ANY_ID, dev);
-		if (!dev)
+	for_each_pci_dev(dev) {
+		if (pci_match_id(&k8_nb_ids[0], dev))
 			break;
-	} while (!pci_match_id(&k8_nb_ids[0], dev));
+	}
 	return dev;
 }
 
-- 
1.7.0.4

