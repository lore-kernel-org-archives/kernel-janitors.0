From: Colin King <colin.king@canonical.com>
Date: Sat, 20 Jan 2018 22:21:40 +0000
Subject: [PATCH] staging: rtl8192e: remove two redundant assignments
Message-Id: <20180120222140.22282-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "David S . Miller" <davem@davemloft.net>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Clang detected two redundant assignments that can be safely removed.
The first is the removal of the duplicated assignment to pointer 'hdr',
this has already been initialized with the same value.  The second is
the removal of the redundant initialization of variable 'timeout', this
assigned value is never read and the variable is reassigned a new value
a little later.

Remove both redundant assignments, cleans up clang warnings:
drivers/staging/rtl8192e/rtllib_rx.c:1305:27: warning: Value stored to
'hdr' during its initialization is never read
drivers/staging/rtl8192e/rtllib_softmac.c:1971:6: warning: Value stored
to 'timeout' during its initialization is never read

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/rtl8192e/rtllib_rx.c      | 1 -
 drivers/staging/rtl8192e/rtllib_softmac.c | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
index 7bc9cb131bcc..30f72d220af1 100644
--- a/drivers/staging/rtl8192e/rtllib_rx.c
+++ b/drivers/staging/rtl8192e/rtllib_rx.c
@@ -1317,7 +1317,6 @@ static int rtllib_rx_InfraAdhoc(struct rtllib_device *ieee, struct sk_buff *skb,
 	bool bToOtherSTA = false;
 	int ret = 0, i = 0;
 
-	hdr = (struct rtllib_hdr_4addr *)skb->data;
 	fc = le16_to_cpu(hdr->frame_ctl);
 	type = WLAN_FC_GET_TYPE(fc);
 	stype = WLAN_FC_GET_STYPE(fc);
diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index c2b9ffba354a..919231fec09c 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -1968,7 +1968,7 @@ void rtllib_sta_ps_send_pspoll_frame(struct rtllib_device *ieee)
 
 static short rtllib_sta_ps_sleep(struct rtllib_device *ieee, u64 *time)
 {
-	int timeout = ieee->ps_timeout;
+	int timeout;
 	u8 dtim;
 	struct rt_pwr_save_ctrl *pPSC = &(ieee->PowerSaveControl);
 
-- 
2.15.1

