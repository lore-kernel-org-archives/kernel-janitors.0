From: Julia Lawall <julia@diku.dk>
Date: Sat, 28 Aug 2010 15:41:00 +0000
Subject: [PATCH 1/7] drivers/staging: Remove double test
Message-Id: <1283010066-20935-2-git-send-email-julia@diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1283010066-20935-1-git-send-email-julia@diku.dk>
In-Reply-To: <1283010066-20935-1-git-send-email-julia@diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@suse.de>
Cc: kernel-janitors@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

The 1 element of the array is tested twice.  Change the code so that the
remaining 3 element of the array is tested instead of testing the 1 element
a second time.

The sematic match that finds this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@expression@
expression E;
@@

(
* E
  || ... || E
|
* E
  && ... && E
)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
This is just as guess as to what the correct code should be.

 drivers/staging/rtl8192e/ieee80211/ieee80211_rx.c  |    2 +-
 drivers/staging/rtl8192su/ieee80211/ieee80211_rx.c |    2 +-
 drivers/staging/rtl8192u/ieee80211/ieee80211_rx.c  |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8192e/ieee80211/ieee80211_rx.c b/drivers/staging/rtl8192e/ieee80211/ieee80211_rx.c
index aaf9b9d..9318695 100644
--- a/drivers/staging/rtl8192e/ieee80211/ieee80211_rx.c
+++ b/drivers/staging/rtl8192e/ieee80211/ieee80211_rx.c
@@ -2579,7 +2579,7 @@ static inline void update_network(struct ieee80211_network *dst,
 	if(src->wmm_param[0].ac_aci_acm_aifsn|| \
 	   src->wmm_param[1].ac_aci_acm_aifsn|| \
 	   src->wmm_param[2].ac_aci_acm_aifsn|| \
-	   src->wmm_param[1].ac_aci_acm_aifsn) {
+	   src->wmm_param[3].ac_aci_acm_aifsn) {
 	  memcpy(dst->wmm_param, src->wmm_param, WME_AC_PRAM_LEN);
 	}
 	//dst->QoS_Enable = src->QoS_Enable;
diff --git a/drivers/staging/rtl8192su/ieee80211/ieee80211_rx.c b/drivers/staging/rtl8192su/ieee80211/ieee80211_rx.c
index 09a02f7..7230cf5 100644
--- a/drivers/staging/rtl8192su/ieee80211/ieee80211_rx.c
+++ b/drivers/staging/rtl8192su/ieee80211/ieee80211_rx.c
@@ -2298,7 +2298,7 @@ static inline void update_network(struct ieee80211_network *dst,
 	if(src->wmm_param[0].ac_aci_acm_aifsn|| \
 	   src->wmm_param[1].ac_aci_acm_aifsn|| \
 	   src->wmm_param[2].ac_aci_acm_aifsn|| \
-	   src->wmm_param[1].ac_aci_acm_aifsn) {
+	   src->wmm_param[3].ac_aci_acm_aifsn) {
 	  memcpy(dst->wmm_param, src->wmm_param, WME_AC_PRAM_LEN);
 	}
 	//dst->QoS_Enable = src->QoS_Enable;
diff --git a/drivers/staging/rtl8192u/ieee80211/ieee80211_rx.c b/drivers/staging/rtl8192u/ieee80211/ieee80211_rx.c
index 192123f..c8ca9d8 100644
--- a/drivers/staging/rtl8192u/ieee80211/ieee80211_rx.c
+++ b/drivers/staging/rtl8192u/ieee80211/ieee80211_rx.c
@@ -2391,7 +2391,7 @@ static inline void update_network(struct ieee80211_network *dst,
 	if(src->wmm_param[0].ac_aci_acm_aifsn|| \
 	   src->wmm_param[1].ac_aci_acm_aifsn|| \
 	   src->wmm_param[2].ac_aci_acm_aifsn|| \
-	   src->wmm_param[1].ac_aci_acm_aifsn) {
+	   src->wmm_param[3].ac_aci_acm_aifsn) {
 	  memcpy(dst->wmm_param, src->wmm_param, WME_AC_PRAM_LEN);
 	}
 	//dst->QoS_Enable = src->QoS_Enable;

