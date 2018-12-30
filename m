From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 30 Dec 2018 15:53:09 +0000
Subject: [PATCH 2/8] net: ena: reduce indentation
Message-Id: <1546185195-25676-3-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1546185195-25676-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1546185195-25676-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Netanel Belgazal <netanel@amazon.com>
Cc: kernel-janitors@vger.kernel.org, Saeed Bishara <saeedb@amazon.com>, Zorik Machulsky <zorik@amazon.com>, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

Delete tab aligning a statement with the right hand side of a
preceding assignment rather than the left hand side.

Found with the help of Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/net/ethernet/amazon/ena/ena_eth_com.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/amazon/ena/ena_eth_com.c b/drivers/net/ethernet/amazon/ena/ena_eth_com.c
index f6c2d3855be8..f7b4e359a2ff 100644
--- a/drivers/net/ethernet/amazon/ena/ena_eth_com.c
+++ b/drivers/net/ethernet/amazon/ena/ena_eth_com.c
@@ -200,8 +200,8 @@ static inline int ena_com_sq_update_llq_tail(struct ena_com_io_sq *io_sq)
 
 		pkt_ctrl->curr_bounce_buf  			ena_com_get_next_bounce_buffer(&io_sq->bounce_buf_ctrl);
-			memset(io_sq->llq_buf_ctrl.curr_bounce_buf,
-			       0x0, llq_info->desc_list_entry_size);
+		memset(io_sq->llq_buf_ctrl.curr_bounce_buf,
+		       0x0, llq_info->desc_list_entry_size);
 
 		pkt_ctrl->idx = 0;
 		if (unlikely(llq_info->desc_stride_ctrl = ENA_ADMIN_SINGLE_DESC_PER_ENTRY))
