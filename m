From: Colin King <colin.king@canonical.com>
Date: Fri, 25 Aug 2017 16:12:57 +0000
Subject: [PATCH][net-next] net: hns3: fix typo in function name qcn_fb_invaild_cnt
Message-Id: <20170825161257.22789-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The function name qcn_fb_invaild_cnt has as typo, it should
be qcn_fb_invalid_cnt. Fix this

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c | 4 ++--
 drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.h | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c b/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c
index bb45365fb817..4ec122a442ce 100644
--- a/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c
+++ b/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c
@@ -130,8 +130,8 @@ static const struct hclge_comm_stats_str g_all_32bit_stats_string[] = {
 		HCLGE_32BIT_STATS_FIELD_OFF(qcn_fb_rcv_cnt)},
 	{"qcn_fb_drop_cnt",
 		HCLGE_32BIT_STATS_FIELD_OFF(qcn_fb_drop_cnt)},
-	{"qcn_fb_invaild_cnt",
-		HCLGE_32BIT_STATS_FIELD_OFF(qcn_fb_invaild_cnt)},
+	{"qcn_fb_invalid_cnt",
+		HCLGE_32BIT_STATS_FIELD_OFF(qcn_fb_invalid_cnt)},
 	{"rx_packet_tc0_in_cnt",
 		HCLGE_32BIT_STATS_FIELD_OFF(rx_packet_tc0_in_cnt)},
 	{"rx_packet_tc1_in_cnt",
diff --git a/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.h b/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.h
index edb10ad075eb..744df4b6d2b8 100644
--- a/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.h
+++ b/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.h
@@ -254,7 +254,7 @@ struct hclge_32_bit_stats {
 	u64 pkt_curr_buf_cnt;
 	u64 qcn_fb_rcv_cnt;
 	u64 qcn_fb_drop_cnt;
-	u64 qcn_fb_invaild_cnt;
+	u64 qcn_fb_invalid_cnt;
 	u64 rsv0;
 	u64 rx_packet_tc0_in_cnt;
 	u64 rx_packet_tc1_in_cnt;
-- 
2.14.1

