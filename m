From: Colin King <colin.king@canonical.com>
Date: Wed, 03 Jul 2019 08:14:34 +0000
Subject: [PATCH][next] staging: rtl8723bs: hal: remove redundant assignment to packetType
Message-Id: <20190703081434.17489-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Himadri Pandya <himadri18.07@gmail.com>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Local variable packetType is being assigned a value that is never
read just before a return statement. The assignment is redundant
and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/rtl8723bs/hal/hal_btcoex.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_btcoex.c b/drivers/staging/rtl8723bs/hal/hal_btcoex.c
index 66caf34..2579ac3 100644
--- a/drivers/staging/rtl8723bs/hal/hal_btcoex.c
+++ b/drivers/staging/rtl8723bs/hal/hal_btcoex.c
@@ -1196,7 +1196,6 @@ void EXhalbtcoutsrc_SpecialPacketNotify(PBTC_COEXIST pBtCoexist, u8 pktType)
 	} else if (PACKET_ARP = pktType) {
 		packetType = BTC_PACKET_ARP;
 	} else {
-		packetType = BTC_PACKET_UNKNOWN;
 		return;
 	}
 
-- 
2.7.4
