From: Colin King <colin.king@canonical.com>
Date: Wed, 05 Aug 2020 14:11:11 +0000
Subject: [PATCH] RDMA/hns: fix spelling mistake "epmty" -> "empty"
Message-Id: <20200805141111.22804-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lijun Ou <oulijun@huawei.com>, Wei Hu <huwei87@hisilicon.com>, Weihang Li <liweihang@huawei.com>, Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>, linux-rdma@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a dev_dbg message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/infiniband/hw/hns/hns_roce_hw_v1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/infiniband/hw/hns/hns_roce_hw_v1.c b/drivers/infiniband/hw/hns/hns_roce_hw_v1.c
index 07b4c85d341d..aeb3a6fa7d47 100644
--- a/drivers/infiniband/hw/hns/hns_roce_hw_v1.c
+++ b/drivers/infiniband/hw/hns/hns_roce_hw_v1.c
@@ -535,7 +535,7 @@ static void hns_roce_set_sdb_ext(struct hns_roce_dev *hr_dev, u32 ext_sdb_alept,
 	roce_write(hr_dev, ROCEE_EXT_DB_SQ_H_REG, val);
 
 	dev_dbg(dev, "ext SDB depth: 0x%x\n", db->ext_db->esdb_dep);
-	dev_dbg(dev, "ext SDB threshold: epmty: 0x%x, ful: 0x%x\n",
+	dev_dbg(dev, "ext SDB threshold: empty: 0x%x, ful: 0x%x\n",
 		ext_sdb_alept, ext_sdb_alful);
 }
 
-- 
2.27.0
