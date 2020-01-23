From: Colin King <colin.king@canonical.com>
Date: Thu, 23 Jan 2020 00:07:07 +0000
Subject: [PATCH] staging: qlge: fix spelling mistake "to" -> "too"
Message-Id: <20200123000707.2831321-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Manish Chopra <manishc@marvell.com>, GR-Linux-NIC-Dev@marvell.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, netdev@vger.kernel.org, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a netif_printk message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/qlge/qlge_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/qlge/qlge_main.c b/drivers/staging/qlge/qlge_main.c
index ef8037d0b52e..115dfa2ffabd 100644
--- a/drivers/staging/qlge/qlge_main.c
+++ b/drivers/staging/qlge/qlge_main.c
@@ -1758,7 +1758,7 @@ static struct sk_buff *ql_build_rx_skb(struct ql_adapter *qdev,
 	} else if (ib_mac_rsp->flags3 & IB_MAC_IOCB_RSP_DL) {
 		if (ib_mac_rsp->flags4 & IB_MAC_IOCB_RSP_HS) {
 			netif_printk(qdev, rx_status, KERN_DEBUG, qdev->ndev,
-				     "Header in small, %d bytes in large. Chain large to small!\n",
+				     "Header in small, %d bytes in large. Chain large too small!\n",
 				     length);
 			/*
 			 * The data is in a single large buffer.  We
-- 
2.24.0
