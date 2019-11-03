From: Colin King <colin.king@canonical.com>
Date: Sun, 03 Nov 2019 13:15:38 +0000
Subject: [PATCH] net: hns3: remove unused macros
Message-Id: <20191103131538.25234-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yisen Zhuang <yisen.zhuang@huawei.com>, Salil Mehta <salil.mehta@huawei.com>, "David S . Miller" <davem@davemloft.net>, Huazhong Tan <tanhuazhong@huawei.com>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The macros HCLGE_MPF_ENBALE and HCLGEVF_MPF_ENBALE are defined but never
used.  I was going to fix the spelling mistake "ENBALE" -> "ENABLE" but
found these macros are not used, so they can be removed.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.h   | 2 --
 drivers/net/ethernet/hisilicon/hns3/hns3vf/hclgevf_main.h | 2 --
 2 files changed, 4 deletions(-)

diff --git a/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.h b/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.h
index 9e59f0e074be..0b20b42f8ceb 100644
--- a/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.h
+++ b/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.h
@@ -226,8 +226,6 @@ enum hclge_evt_cause {
 	HCLGE_VECTOR0_EVENT_OTHER,
 };
 
-#define HCLGE_MPF_ENBALE 1
-
 enum HCLGE_MAC_SPEED {
 	HCLGE_MAC_SPEED_UNKNOWN = 0,		/* unknown */
 	HCLGE_MAC_SPEED_10M	= 10,		/* 10 Mbps */
diff --git a/drivers/net/ethernet/hisilicon/hns3/hns3vf/hclgevf_main.h b/drivers/net/ethernet/hisilicon/hns3/hns3vf/hclgevf_main.h
index ef86155de9e0..2f4c81bf4169 100644
--- a/drivers/net/ethernet/hisilicon/hns3/hns3vf/hclgevf_main.h
+++ b/drivers/net/ethernet/hisilicon/hns3/hns3vf/hclgevf_main.h
@@ -150,8 +150,6 @@ enum hclgevf_states {
 	HCLGEVF_STATE_CMD_DISABLE,
 };
 
-#define HCLGEVF_MPF_ENBALE 1
-
 struct hclgevf_mac {
 	u8 media_type;
 	u8 module_type;
-- 
2.20.1
