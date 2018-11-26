From: Colin King <colin.king@canonical.com>
Date: Mon, 26 Nov 2018 16:23:20 +0000
Subject: [PATCH] IB/qib: fix spelling mistake "colescing" -> "coalescing"
Message-Id: <20181126162320.27889-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dennis Dalessandro <dennis.dalessandro@intel.com>, Mike Marciniszyn <mike.marciniszyn@intel.com>, Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>, linux-rdma@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in the module description text, fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/infiniband/hw/qib/qib_pcie.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/infiniband/hw/qib/qib_pcie.c b/drivers/infiniband/hw/qib/qib_pcie.c
index 30595b358d8f..864f2af171f7 100644
--- a/drivers/infiniband/hw/qib/qib_pcie.c
+++ b/drivers/infiniband/hw/qib/qib_pcie.c
@@ -387,7 +387,7 @@ void qib_pcie_reenable(struct qib_devdata *dd, u16 cmd, u8 iline, u8 cline)
 
 static int qib_pcie_coalesce;
 module_param_named(pcie_coalesce, qib_pcie_coalesce, int, S_IRUGO);
-MODULE_PARM_DESC(pcie_coalesce, "tune PCIe colescing on some Intel chipsets");
+MODULE_PARM_DESC(pcie_coalesce, "tune PCIe coalescing on some Intel chipsets");
 
 /*
  * Enable PCIe completion and data coalescing, on Intel 5x00 and 7300
-- 
2.19.1
