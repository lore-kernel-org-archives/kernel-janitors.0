From: Colin King <colin.king@canonical.com>
Date: Thu, 04 Apr 2019 09:32:57 +0000
Subject: [PATCH] staging: rtl8192u: remove redundant null check on array 'data'
Message-Id: <20190404093257.18757-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170209110643.22590-1-colin.king@canonical.com>
In-Reply-To: <20170209110643.22590-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, John Whitmore <johnfwhitmore@gmail.com>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The NULL check on ram->u.wpa_ie.data is redudant as data is
zero-length array and is not a pointer, so it can't be null.
Remove the check.

Addresses-Coverity: ("Array compared against 0")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/rtl8192u/ieee80211/ieee80211_softmac.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8192u/ieee80211/ieee80211_softmac.c b/drivers/staging/rtl8192u/ieee80211/ieee80211_softmac.c
index 944c8894f9ff..c4a4f118f547 100644
--- a/drivers/staging/rtl8192u/ieee80211/ieee80211_softmac.c
+++ b/drivers/staging/rtl8192u/ieee80211/ieee80211_softmac.c
@@ -2659,8 +2659,7 @@ static int ieee80211_wpa_set_wpa_ie(struct ieee80211_device *ieee,
 {
 	u8 *buf;
 
-	if (param->u.wpa_ie.len > MAX_WPA_IE_LEN ||
-	    (param->u.wpa_ie.len && param->u.wpa_ie.data = NULL))
+	if (param->u.wpa_ie.len > MAX_WPA_IE_LEN || param->u.wpa_ie.len)
 		return -EINVAL;
 
 	if (param->u.wpa_ie.len) {
-- 
2.20.1
