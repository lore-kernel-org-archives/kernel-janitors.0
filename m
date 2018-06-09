From: thtlwlsmsgkfla@gmail.com
Date: Sat, 09 Jun 2018 06:07:51 +0000
Subject: [PATCH 2/2] staging: rtl8192e: fix line over 80 characters
Message-Id: <1667235.oI4jP7xdTe@os-virtualbox>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gregkh@linuxfoundation.org
Cc: davem@davemloft.net, colin.king@canonical.com, johannes.berg@intel.com, Linyu.Yuan@alcatel-sbell.com.cn, keescook@chromium.org, tvboxspy@gmail.com, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

*fix checkpatch.pl warnings:
 WARNING: line over 80 characters

Signed-off-by: Hyunil Kim <thtlwlsmsgkfla@gmail.com>
---
 drivers/staging/rtl8192e/rtllib_softmac.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index d172e87..3c5def2 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -2596,7 +2596,8 @@ static void rtllib_start_ibss_wq(void *data)
 
 	if (ieee->current_network.ssid_len = 0) {
 		strcpy(ieee->current_network.ssid, RTLLIB_DEFAULT_TX_ESSID);
-		ieee->current_network.ssid_len = strlen(RTLLIB_DEFAULT_TX_ESSID);
+		ieee->current_network.ssid_len +			strlen(RTLLIB_DEFAULT_TX_ESSID);
 		ieee->ssid_set = 1;
 	}
 
-- 
2.7.4


