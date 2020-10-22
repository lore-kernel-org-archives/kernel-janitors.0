From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 22 Oct 2020 07:07:39 +0000
Subject: [PATCH net] mISDN: hfcpci: Fix a use after free in hfcmulti_tx()
Message-Id: <20201022070739.GB2817762@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Karsten Keil <isdn@linux-pingi.de>
Cc: Petr Mladek <pmladek@suse.com>, Sergey Senozhatsky <sergey.senozhatsky@gmail.com>, Kefeng Wang <wangkefeng.wang@huawei.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

This frees "*sp" before dereferencing it to get "len = (*sp)->len;".

Fixes: af69fb3a8ffa ("Add mISDN HFC multiport driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/isdn/hardware/mISDN/hfcmulti.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/isdn/hardware/mISDN/hfcmulti.c b/drivers/isdn/hardware/mISDN/hfcmulti.c
index 7013a3f08429..ce6c160e0df4 100644
--- a/drivers/isdn/hardware/mISDN/hfcmulti.c
+++ b/drivers/isdn/hardware/mISDN/hfcmulti.c
@@ -2152,16 +2152,14 @@ hfcmulti_tx(struct hfc_multi *hc, int ch)
 		HFC_wait_nodebug(hc);
 	}
 
+	len = (*sp)->len;
 	dev_kfree_skb(*sp);
 	/* check for next frame */
-	if (bch && get_next_bframe(bch)) {
-		len = (*sp)->len;
+	if (bch && get_next_bframe(bch))
 		goto next_frame;
-	}
-	if (dch && get_next_dframe(dch)) {
-		len = (*sp)->len;
+
+	if (dch && get_next_dframe(dch))
 		goto next_frame;
-	}
 
 	/*
 	 * now we have no more data, so in case of transparent,
-- 
2.28.0
