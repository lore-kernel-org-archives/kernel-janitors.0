From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 18 Oct 2011 06:26:45 +0000
Subject: [patch 2/2] gpio-pch: using zero instead of NULL
Message-Id: <20111018062645.GO27732@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Grant Likely <grant.likely@secretlab.ca>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Sparse gets cross if you use zero instead of NULL.
drivers/gpio/gpio-pch.c:379:27: warning: Using plain integer as NULL pointer

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpio/gpio-pch.c b/drivers/gpio/gpio-pch.c
index 4068084..7ddac42 100644
--- a/drivers/gpio/gpio-pch.c
+++ b/drivers/gpio/gpio-pch.c
@@ -376,7 +376,7 @@ static int __devinit pch_gpio_probe(struct pci_dev *pdev,
 	}
 
 	chip->base = pci_iomap(pdev, 1, 0);
-	if (chip->base = 0) {
+	if (chip->base = NULL) {
 		dev_err(&pdev->dev, "%s : pci_iomap FAILED", __func__);
 		ret = -ENOMEM;
 		goto err_iomap;
