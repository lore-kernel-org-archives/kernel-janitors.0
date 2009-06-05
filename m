From: Julia Lawall <julia@diku.dk>
Date: Fri, 05 Jun 2009 15:07:38 +0000
Subject: [PATCH] drivers/staging/rtl8192su: Correct use of.and &
Message-Id: <Pine.LNX.4.64.0906051706450.3477@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gregkh@suse.de, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Correct priority problem in the use of ! and &.

The semantic patch that makes this change is as follows:
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@@ expression E; constant C; @@
- !E & C
+ !(E & C)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/staging/rtl8192su/ieee80211/ieee80211_wx.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff -u -p a/drivers/staging/rtl8192su/ieee80211/ieee80211_wx.c b/drivers/staging/rtl8192su/ieee80211/ieee80211_wx.c
--- a/drivers/staging/rtl8192su/ieee80211/ieee80211_wx.c
+++ b/drivers/staging/rtl8192su/ieee80211/ieee80211_wx.c
@@ -843,7 +843,7 @@ int ieee80211_wx_get_encode_ext(struct i
 	} else
 		idx = ieee->tx_keyidx;
 
-	if (!ext->ext_flags & IW_ENCODE_EXT_GROUP_KEY &&
+	if (!(ext->ext_flags & IW_ENCODE_EXT_GROUP_KEY) &&
 	    ext->alg != IW_ENCODE_ALG_WEP)
 		if (idx != 0 || ieee->iw_mode != IW_MODE_INFRA)
 			return -EINVAL;
