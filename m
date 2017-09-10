From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 10 Sep 2017 11:53:22 +0000
Subject: [PATCH] media: v4l2-pci-skeleton: Fix error handling path in 'skeleton_probe()'
Message-Id: <20170910115322.15482-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mchehab@kernel.org, hans.verkuil@cisco.com, Julia.Lawall@lip6.fr
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

If this memory allocation fails, we must release some resources, as
already done in the code below and above.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 samples/v4l/v4l2-pci-skeleton.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/samples/v4l/v4l2-pci-skeleton.c b/samples/v4l/v4l2-pci-skeleton.c
index 483e9bca9444..f520e3aef9c6 100644
--- a/samples/v4l/v4l2-pci-skeleton.c
+++ b/samples/v4l/v4l2-pci-skeleton.c
@@ -772,8 +772,10 @@ static int skeleton_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 
 	/* Allocate a new instance */
 	skel = devm_kzalloc(&pdev->dev, sizeof(struct skeleton), GFP_KERNEL);
-	if (!skel)
-		return -ENOMEM;
+	if (!skel) {
+		ret = -ENOMEM;
+		goto disable_pci;
+	}
 
 	/* Allocate the interrupt */
 	ret = devm_request_irq(&pdev->dev, pdev->irq,
-- 
2.11.0

