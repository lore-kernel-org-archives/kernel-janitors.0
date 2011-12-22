From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 22 Dec 2011 06:29:34 +0000
Subject: [patch 2/2] [media] Staging: dt3155v4l: probe() always fails
Message-Id: <20111222062934.GB19975@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: Greg Kroah-Hartman <gregkh@suse.de>, H Hartley Sweeten <hsweeten@visionengravers.com>, Paul Gortmaker <paul.gortmaker@windriver.com>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

There were some curly braces missing so the probe() function always
failed.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/media/dt3155v4l/dt3155v4l.c b/drivers/staging/media/dt3155v4l/dt3155v4l.c
index 25c6025..280c84e 100644
--- a/drivers/staging/media/dt3155v4l/dt3155v4l.c
+++ b/drivers/staging/media/dt3155v4l/dt3155v4l.c
@@ -908,9 +908,10 @@ dt3155_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	if (err)
 		goto err_req_region;
 	pd->regs = pci_iomap(pdev, 0, pci_resource_len(pd->pdev, 0));
-	if (!pd->regs)
+	if (!pd->regs) {
 		err = -ENOMEM;
 		goto err_pci_iomap;
+	}
 	err = dt3155_init_board(pdev);
 	if (err)
 		goto err_init_board;
