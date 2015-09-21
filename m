From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 21 Sep 2015 16:21:51 +0000
Subject: [patch] devres: fix a for loop bounds check
Message-Id: <20150921162151.GA5648@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20150916171000.GD3243@mtj.duckdns.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, htejun@gmail.com
Cc: Catalin Marinas <catalin.marinas@arm.com>, Cristian Stoica <cristian.stoica@freescale.com>, Dan Williams <dan.j.williams@intel.com>, Abhilash Kesavan <a.kesavan@samsung.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The iomap[] array has PCIM_IOMAP_MAX (6) elements and not
DEVICE_COUNT_RESOURCE (16).  This bug was found using a static checker.
It may be that the "if (!(mask & (1 << i)))" check means we never
actually go past the end of the array in real life.

Fixes: ec04b075843d ('iomap: implement pcim_iounmap_regions()')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/lib/devres.c b/lib/devres.c
index f13a246..8c85672 100644
--- a/lib/devres.c
+++ b/lib/devres.c
@@ -418,7 +418,7 @@ void pcim_iounmap_regions(struct pci_dev *pdev, int mask)
 	if (!iomap)
 		return;
 
-	for (i = 0; i < DEVICE_COUNT_RESOURCE; i++) {
+	for (i = 0; i < PCIM_IOMAP_MAX; i++) {
 		if (!(mask & (1 << i)))
 			continue;
 
