From: Colin King <colin.king@canonical.com>
Date: Wed, 26 Sep 2018 12:26:08 +0000
Subject: [PATCH] IB/mthca: remove redundant inner check of mdev->mthca_flags
Message-Id: <20180926122608.29853-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>, Bart Van Assche <bvanassche@acm.org>, linux-rdma@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The inner check for mdev->mthca_flags & MTHCA_FLAG_MSI_X is redundant
as this is already true because of the previous identical check in
an outer if statement.  Remove it

Detected by cppcheck:
(warning) Identical inner 'if' condition is always true.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/infiniband/hw/mthca/mthca_main.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/infiniband/hw/mthca/mthca_main.c b/drivers/infiniband/hw/mthca/mthca_main.c
index f3e80dec1334..f99c7e0b234c 100644
--- a/drivers/infiniband/hw/mthca/mthca_main.c
+++ b/drivers/infiniband/hw/mthca/mthca_main.c
@@ -1014,8 +1014,7 @@ static int __mthca_init_one(struct pci_dev *pdev, int hca_type)
 
 	err = mthca_setup_hca(mdev);
 	if (err = -EBUSY && (mdev->mthca_flags & MTHCA_FLAG_MSI_X)) {
-		if (mdev->mthca_flags & MTHCA_FLAG_MSI_X)
-			pci_free_irq_vectors(pdev);
+		pci_free_irq_vectors(pdev);
 		mdev->mthca_flags &= ~MTHCA_FLAG_MSI_X;
 
 		err = mthca_setup_hca(mdev);
-- 
2.17.1
