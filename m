From: Kulikov Vasiliy <segooon@gmail.com>
Date: Tue, 03 Aug 2010 15:44:23 +0000
Subject: [PATCH 10/11] uio: do not use PCI resources before pci_enable_device()
Message-Id: <1280850264-6258-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100803154252.GA6511@redhat.com>
In-Reply-To: <20100803154252.GA6511@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, "Hans J. Koch" <hjk@linutronix.de>, Greg Kroah-Hartman <gregkh@suse.de>, Jesse Barnes <jbarnes@virtuousgeek.org>, Tejun Heo <tj@kernel.org>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org

IRQ and resource[] may not have correct values until
after PCI hotplug setup occurs at pci_enable_device() time.

The semantic match that finds this problem is as follows:

// <smpl>
@@
identifier x;
identifier request ~= "pci_request.*|pci_resource.*";
@@

(
* x->irq
|
* x->resource
|
* request(x, ...)
)
 ...
*pci_enable_device(x)
// </smpl>

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
---
 drivers/uio/uio_pci_generic.c |   13 +++++++------
 1 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/uio/uio_pci_generic.c b/drivers/uio/uio_pci_generic.c
index 85c9884..fc22e1e 100644
--- a/drivers/uio/uio_pci_generic.c
+++ b/drivers/uio/uio_pci_generic.c
@@ -128,12 +128,6 @@ static int __devinit probe(struct pci_dev *pdev,
 	struct uio_pci_generic_dev *gdev;
 	int err;
 
-	if (!pdev->irq) {
-		dev_warn(&pdev->dev, "No IRQ assigned to device: "
-			 "no support for interrupts?\n");
-		return -ENODEV;
-	}
-
 	err = pci_enable_device(pdev);
 	if (err) {
 		dev_err(&pdev->dev, "%s: pci_enable_device failed: %d\n",
@@ -141,6 +135,13 @@ static int __devinit probe(struct pci_dev *pdev,
 		return err;
 	}
 
+	if (!pdev->irq) {
+		dev_warn(&pdev->dev, "No IRQ assigned to device: "
+			 "no support for interrupts?\n");
+		pci_disable_device(pdev);
+		return -ENODEV;
+	}
+
 	err = verify_pci_2_3(pdev);
 	if (err)
 		goto err_verify;
-- 
1.7.0.4

