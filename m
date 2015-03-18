From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 18 Mar 2015 08:22:35 +0000
Subject: [patch] mwifiex: missing curly braces in mwifiex_write_data_complete()
Message-Id: <20150318082235.GC10434@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Amitkumar Karwar <akarwar@marvell.com>, Zhaoyang Liu <liuzy@marvell.com>
Cc: Avinash Patil <patila@marvell.com>, Kalle Valo <kvalo@codeaurora.org>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

It's clear from the indenting that curly braces were intended here.

Fixes: e35000ead491 ('mwifiex: preprocess packets from TX queue')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/wireless/mwifiex/txrx.c b/drivers/net/wireless/mwifiex/txrx.c
index 4d43371..a245f44 100644
--- a/drivers/net/wireless/mwifiex/txrx.c
+++ b/drivers/net/wireless/mwifiex/txrx.c
@@ -302,10 +302,11 @@ int mwifiex_write_data_complete(struct mwifiex_adapter *adapter,
 		priv->stats.tx_errors++;
 	}
 
-	if (tx_info->flags & MWIFIEX_BUF_FLAG_BRIDGED_PKT)
+	if (tx_info->flags & MWIFIEX_BUF_FLAG_BRIDGED_PKT) {
 		atomic_dec_return(&adapter->pending_bridged_pkts);
 		if (tx_info->flags & MWIFIEX_BUF_FLAG_AGGR_PKT)
 			goto done;
+	}
 
 	if (aggr)
 		/* For skb_aggr, do not wake up tx queue */
