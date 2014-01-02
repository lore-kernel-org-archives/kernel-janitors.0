From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Thu, 02 Jan 2014 22:45:34 +0000
Subject: [PATCH 1/3] mfd: sta2x11-mfd: use named constants for pci_power_t values
Message-Id: <1388706031-22180-2-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1388706031-22180-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1388706031-22180-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Samuel Ortiz <sameo@linux.intel.com>
Cc: kernel-janitors@vger.kernel.org, Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

The semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
expression pdev;
@@

pci_set_power_state(pdev,
- 0
+ PCI_D0
 )
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/mfd/sta2x11-mfd.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/sta2x11-mfd.c b/drivers/mfd/sta2x11-mfd.c
index 0d42e40..5b72db0 100644
--- a/drivers/mfd/sta2x11-mfd.c
+++ b/drivers/mfd/sta2x11-mfd.c
@@ -529,7 +529,7 @@ static int sta2x11_mfd_resume(struct pci_dev *pdev)
 {
 	int err;
 
-	pci_set_power_state(pdev, 0);
+	pci_set_power_state(pdev, PCI_D0);
 	err = pci_enable_device(pdev);
 	if (err)
 		return err;

