From: Vasiliy Kulikov <segooon@gmail.com>
Date: Sun, 17 Oct 2010 14:51:46 +0000
Subject: [PATCH] x86: kernel: olpc-xo1: fix error handling code
Message-Id: <1287327106-9111-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Daniel Drake <dsd@laptop.org>, linux-kernel@vger.kernel.org

If anything failed during initialization then setup_bases() should
call pci_disable_device().  Also reference got from pci_get_device()
should be freed with pci_dev_put().

Signed-off-by: Vasiliy Kulikov <segooon@gmail.com>
---
 arch/x86/kernel/olpc-xo1.c |   12 +++++++++---
 1 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kernel/olpc-xo1.c b/arch/x86/kernel/olpc-xo1.c
index f5442c0..05331cf 100644
--- a/arch/x86/kernel/olpc-xo1.c
+++ b/arch/x86/kernel/olpc-xo1.c
@@ -71,20 +71,25 @@ static int __devinit setup_bases(struct pci_dev *pdev)
 	r = pci_request_region(pdev, ACPI_BAR, DRV_NAME);
 	if (r) {
 		dev_err(&pdev->dev, "can't alloc PCI BAR #%d\n", ACPI_BAR);
-		return r;
+		goto err_disable;
 	}
 
 	r = pci_request_region(pdev, PMS_BAR, DRV_NAME);
 	if (r) {
 		dev_err(&pdev->dev, "can't alloc PCI BAR #%d\n", PMS_BAR);
-		pci_release_region(pdev, ACPI_BAR);
-		return r;
+		goto err_region1;
 	}
 
 	acpi_base = pci_resource_start(pdev, ACPI_BAR);
 	pms_base = pci_resource_start(pdev, PMS_BAR);
 
 	return 0;
+
+err_region1:
+	pci_release_region(pdev, ACPI_BAR);
+err_disable:
+	pci_disable_device(pdev);
+	return r;
 }
 
 static int __devinit olpc_xo1_probe(struct platform_device *pdev)
@@ -98,6 +103,7 @@ static int __devinit olpc_xo1_probe(struct platform_device *pdev)
 		return -ENODEV;
 
 	r = setup_bases(pcidev);
+	pci_dev_put(pcidev);
 	if (r)
 		return r;
 
-- 
1.7.0.4

