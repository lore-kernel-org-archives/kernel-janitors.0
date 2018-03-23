From: Colin King <colin.king@canonical.com>
Date: Fri, 23 Mar 2018 09:54:44 +0000
Subject: [PATCH][next] net: hns3: make function hclge_inform_reset_assert_to_vf static
Message-Id: <20180323095444.26271-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yisen Zhuang <yisen.zhuang@huawei.com>, Salil Mehta <salil.mehta@huawei.com>, "David S . Miller" <davem@davemloft.net>, Peng Li <lipeng321@huawei.com>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The function hclge_inform_reset_assert_to_vf is local to the source and
does not need to be in global scope, so make it static.

Cleans up sparse warning:
drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_mbx.c:82:5: warning:
symbol 'hclge_inform_reset_assert_to_vf' was not declared. Should it
be static?

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_mbx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_mbx.c b/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_mbx.c
index 39013334a613..a6f7ffa9c259 100644
--- a/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_mbx.c
+++ b/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_mbx.c
@@ -79,7 +79,7 @@ static int hclge_send_mbx_msg(struct hclge_vport *vport, u8 *msg, u16 msg_len,
 	return status;
 }
 
-int hclge_inform_reset_assert_to_vf(struct hclge_vport *vport)
+static int hclge_inform_reset_assert_to_vf(struct hclge_vport *vport)
 {
 	u8 msg_data[2];
 	u8 dest_vfid;
-- 
2.15.1

