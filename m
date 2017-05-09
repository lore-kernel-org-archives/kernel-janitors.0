From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 09 May 2017 14:22:23 +0000
Subject: [PATCH 1/4] hamradio: Combine two seq_printf() calls into one in yam_seq_show()
Message-Id: <c2866b46-28c9-f17f-dce7-96425a17a43a@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4c5c939a-bd55-7b88-8e41-49f5544b7658@users.sourceforge.net>
In-Reply-To: <4c5c939a-bd55-7b88-8e41-49f5544b7658@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-hams@vger.kernel.org, netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Javier Martinez Canillas <javier@osg.samsung.com>, Jean-Paul Roubelat <jpr@f6fbb.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 9 May 2017 14:16:45 +0200

A bit of data was put into a sequence by two separate function calls.
Print the same data by a single function call instead.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/net/hamradio/yam.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/hamradio/yam.c b/drivers/net/hamradio/yam.c
index b6891ada1d7b..542f1e511df1 100644
--- a/drivers/net/hamradio/yam.c
+++ b/drivers/net/hamradio/yam.c
@@ -830,8 +830,7 @@ static int yam_seq_show(struct seq_file *seq, void *v)
 	seq_printf(seq, "  RxFrames %lu\n", dev->stats.rx_packets);
 	seq_printf(seq, "  TxInt    %u\n", yp->nb_mdint);
 	seq_printf(seq, "  RxInt    %u\n", yp->nb_rxint);
-	seq_printf(seq, "  RxOver   %lu\n", dev->stats.rx_fifo_errors);
-	seq_printf(seq, "\n");
+	seq_printf(seq, "  RxOver   %lu\n\n", dev->stats.rx_fifo_errors);
 	return 0;
 }
 
-- 
2.12.2

