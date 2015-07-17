From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 17 Jul 2015 09:24:25 +0000
Subject: [patch 2/2] Staging: rtl8192e: pointer math bug in rtllib_rx_DELBA()
Message-Id: <20150717092425.GA3060@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The "delba" variable is a pointer to struct rtllib_hdr_3addr so this
pointer math bug means that we read nonsense data from beyond the end of
the buffer.  It could result in a oops if the memory is not mapped.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/rtl8192e/rtl819x_BAProc.c b/drivers/staging/rtl8192e/rtl819x_BAProc.c
index 60f536c..98e6c4e 100644
--- a/drivers/staging/rtl8192e/rtl819x_BAProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_BAProc.c
@@ -453,7 +453,7 @@ int rtllib_rx_DELBA(struct rtllib_device *ieee, struct sk_buff *skb)
 #endif
 	delba = (struct rtllib_hdr_3addr *)skb->data;
 	dst = (u8 *)(&delba->addr2[0]);
-	delba += sizeof(struct rtllib_hdr_3addr);
+	delba++;
 	pDelBaParamSet = (union delba_param_set *)(delba+2);
 	pReasonCode = (u16 *)(delba+4);
 
