From: Colin King <colin.king@canonical.com>
Date: Thu, 26 Sep 2019 11:22:52 +0000
Subject: [PATCH] net: ena: clean up indentation issue
Message-Id: <20190926112252.21498-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Netanel Belgazal <netanel@amazon.com>, Saeed Bishara <saeedb@amazon.com>, Zorik Machulsky <zorik@amazon.com>, "David S . Miller" <davem@davemloft.net>, Arthur Kiyanovski <akiyano@amazon.com>, Sameeh Jubran <sameehj@amazon.com>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There memset is indented incorrectly, remove the extraneous tabs.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/amazon/ena/ena_eth_com.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/amazon/ena/ena_eth_com.c b/drivers/net/ethernet/amazon/ena/ena_eth_com.c
index 38046bf0ff44..2845ac277724 100644
--- a/drivers/net/ethernet/amazon/ena/ena_eth_com.c
+++ b/drivers/net/ethernet/amazon/ena/ena_eth_com.c
@@ -211,8 +211,8 @@ static int ena_com_sq_update_llq_tail(struct ena_com_io_sq *io_sq)
 
 		pkt_ctrl->curr_bounce_buf  			ena_com_get_next_bounce_buffer(&io_sq->bounce_buf_ctrl);
-			memset(io_sq->llq_buf_ctrl.curr_bounce_buf,
-			       0x0, llq_info->desc_list_entry_size);
+		memset(io_sq->llq_buf_ctrl.curr_bounce_buf,
+		       0x0, llq_info->desc_list_entry_size);
 
 		pkt_ctrl->idx = 0;
 		if (unlikely(llq_info->desc_stride_ctrl = ENA_ADMIN_SINGLE_DESC_PER_ENTRY))
-- 
2.20.1
