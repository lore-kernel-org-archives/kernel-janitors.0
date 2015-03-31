From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 31 Mar 2015 08:58:55 +0000
Subject: [patch] Staging: rtl8192u: use correct array for debug output
Message-Id: <20150331085855.GA13460@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

This is supposed to be ->rates_ex[] instead of ->rates[].  I found this
because static checkers complain than ->rates is too small so we're
reading beyond the end of the array.  It has 12 elements instead of 15.

This bug was apparently copy and pasted from ipw2x00.  I fixed it before
in that driver 428e3cf5f98c ('ipw2x00: printing the wrong array in
debug code')

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/rtl8192u/ieee80211/ieee80211_rx.c b/drivers/staging/rtl8192u/ieee80211/ieee80211_rx.c
index 0a90450..cbed8e6 100644
--- a/drivers/staging/rtl8192u/ieee80211/ieee80211_rx.c
+++ b/drivers/staging/rtl8192u/ieee80211/ieee80211_rx.c
@@ -1704,7 +1704,7 @@ int ieee80211_parse_info_param(struct ieee80211_device *ieee,
 #ifdef CONFIG_IEEE80211_DEBUG
 				p += snprintf(p, sizeof(rates_str) -
 					      (p - rates_str), "%02X ",
-					      network->rates[i]);
+					      network->rates_ex[i]);
 #endif
 				if (ieee80211_is_ofdm_rate
 				    (info_element->data[i])) {
