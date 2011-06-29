From: Dan Carpenter <error27@gmail.com>
Date: Wed, 29 Jun 2011 06:31:49 +0000
Subject: [patch] rtlwifi: potential forever loop in rtl92de_hw_init()
Message-Id: <20110629063149.GE14591@shale.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Larry Finger <Larry.Finger@lwfinger.net>
Cc: Chaoming Li <chaoming_li@realsil.com.cn>, "John W. Linville" <linville@tuxdriver.com>, "open list:RTL8192CE WIRELES..." <linux-wireless@vger.kernel.org>, kernel-janitors@vger.kernel.org

"i" should be an int here because we are trying to use it to count
to 10000.  The original code looks like it could hang in a forever
loop.

Signed-off-by: Dan Carpenter <error27@gmail.com>
---
If we exit the loop via a timeout, that error isn't handled.  Should
we limp along, or return an error?

diff --git a/drivers/net/wireless/rtlwifi/rtl8192de/hw.c b/drivers/net/wireless/rtlwifi/rtl8192de/hw.c
index eedfb38..cbc0f40 100644
--- a/drivers/net/wireless/rtlwifi/rtl8192de/hw.c
+++ b/drivers/net/wireless/rtlwifi/rtl8192de/hw.c
@@ -908,7 +908,8 @@ int rtl92de_hw_init(struct ieee80211_hw *hw)
 	struct rtl_pci *rtlpci = rtl_pcidev(rtl_pcipriv(hw));
 	struct rtl_ps_ctl *ppsc = rtl_psc(rtl_priv(hw));
 	bool rtstatus = true;
-	u8 tmp_u1b, i;
+	u8 tmp_u1b;
+	int i;
 	int err;
 	unsigned long flags;
 
