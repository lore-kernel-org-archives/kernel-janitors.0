From: Colin King <colin.king@canonical.com>
Date: Tue, 13 Nov 2018 11:50:57 +0000
Subject: [PATCH][net-next] net: hns3: fix spelling mistake "failded" -> "failed"
Message-Id: <20181113115057.13237-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181031.123329.534080519656916446.davem@davemloft.net>
In-Reply-To: <20181031.123329.534080519656916446.davem@davemloft.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yisen Zhuang <yisen.zhuang@huawei.com>, Salil Mehta <salil.mehta@huawei.com>, "David S . Miller" <davem@davemloft.net>, Peng Li <lipeng321@huawei.com>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix, the spelling of "failded" is incorrect in dev_err and
dev_warn messages. Fix this.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c b/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c
index 43bfc730a62d..1b97a1bdbd2f 100644
--- a/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c
+++ b/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c
@@ -2440,7 +2440,7 @@ int hclge_set_all_vf_rst(struct hclge_dev *hdev, bool reset)
 		ret = hclge_set_vf_rst(hdev, vport->vport_id, reset);
 		if (ret) {
 			dev_err(&hdev->pdev->dev,
-				"set vf(%d) rst failded %d!\n",
+				"set vf(%d) rst failed %d!\n",
 				vport->vport_id, ret);
 			return ret;
 		}
@@ -2455,7 +2455,7 @@ int hclge_set_all_vf_rst(struct hclge_dev *hdev, bool reset)
 		ret = hclge_inform_reset_assert_to_vf(vport);
 		if (ret)
 			dev_warn(&hdev->pdev->dev,
-				 "inform reset to vf(%d) failded %d!\n",
+				 "inform reset to vf(%d) failed %d!\n",
 				 vport->vport_id, ret);
 	}
 
-- 
2.19.1
