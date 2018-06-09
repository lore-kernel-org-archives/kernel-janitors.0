From: thtlwlsmsgkfla@gmail.com
Date: Sat, 09 Jun 2018 06:05:56 +0000
Subject: [PATCH 1/2] staging: rtl8192e: remove brace for single statement
Message-Id: <1986308.HpuS17FQ0J@os-virtualbox>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gregkh@linuxfoundation.org
Cc: davem@davemloft.net, colin.king@canonical.com, johannes.berg@intel.com, Linyu.Yuan@alcatel-sbell.com.cn, keescook@chromium.org, tvboxspy@gmail.com, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

* fix checkpatch.pl warning:
  WARNING: braces { are not necessary for single statement blocks

Signed-off-by: Hyunil Kim <thtlwlsmsgkfla@gmail.com>
---
 drivers/staging/rtl8192e/rtllib_softmac.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index 919231f..d172e87 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -1355,9 +1355,8 @@ rtllib_association_req(struct rtllib_network *beacon,
 		rtllib_WMM_Info(ieee, &tag);
 	}
 
-	if (wps_ie_len && ieee->wps_ie) {
+	if (wps_ie_len && ieee->wps_ie)
 		skb_put_data(skb, ieee->wps_ie, wps_ie_len);
-	}
 
 	if (turbo_info_len) {
 		tag = skb_put(skb, turbo_info_len);
-- 
2.7.4


