From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 28 Jan 2014 14:00:52 +0000
Subject: [patch] staging: r8821ae: a couple macro expansion bugs
Message-Id: <20140128140052.GA15759@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

These macros need parentheses, otherwise it causes a macro expansion bug
when they are used like this:

	ch->flags &= ~IEEE80211_CHAN_NO_IBSS;

This was found using Smatch:
drivers/staging/rtl8821ae/regd.c:200 _rtl_reg_apply_beaconing_flags()
	warn: the 'IEEE80211_CHAN_NO_IBSS' macro might need parens

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/rtl8821ae/regd.h b/drivers/staging/rtl8821ae/regd.h
index abc60ab8165c..dceb3f18200b 100644
--- a/drivers/staging/rtl8821ae/regd.h
+++ b/drivers/staging/rtl8821ae/regd.h
@@ -30,8 +30,8 @@
 #ifndef __RTL_REGD_H__
 #define __RTL_REGD_H__
 
-#define IEEE80211_CHAN_NO_IBSS		1<<2
-#define IEEE80211_CHAN_PASSIVE_SCAN	1<<1
+#define IEEE80211_CHAN_NO_IBSS		(1 << 2)
+#define IEEE80211_CHAN_PASSIVE_SCAN	(1 << 1)
 #define WIPHY_FLAG_CUSTOM_REGULATORY	BIT(0)
 #define WIPHY_FLAG_STRICT_REGULATORY	BIT(1)
 #define WIPHY_FLAG_DISABLE_BEACON_HINTS	BIT(2)
