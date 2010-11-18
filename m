From: Vasiliy Kulikov <segoon@openwall.com>
Date: Thu, 18 Nov 2010 18:16:54 +0000
Subject: [PATCH 2/4] x86: platform: olpc: fix potential NULL pointer dereference
Message-Id: <1290104216-31326-1-git-send-email-segoon@openwall.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, linux-kernel@vger.kernel.org

pdev is never NULL here, instead we should check pcidev as
it is returned from pci_get_device() and may be NULL.
This code dereferences NULL in pci_enable_device_io() call.

Signed-off-by: Vasiliy Kulikov <segoon@openwall.com>
---
 Compile tested.

 arch/x86/platform/olpc/olpc-xo1.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/x86/platform/olpc/olpc-xo1.c b/arch/x86/platform/olpc/olpc-xo1.c
index f5442c0..c35d03a 100644
--- a/arch/x86/platform/olpc/olpc-xo1.c
+++ b/arch/x86/platform/olpc/olpc-xo1.c
@@ -94,7 +94,7 @@ static int __devinit olpc_xo1_probe(struct platform_device *pdev)
 
 	pcidev = pci_get_device(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_CS5536_ISA,
 				NULL);
-	if (!pdev)
+	if (!pcidev)
 		return -ENODEV;
 
 	r = setup_bases(pcidev);
-- 
1.7.0.4

