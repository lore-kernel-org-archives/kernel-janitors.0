From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 11 Apr 2019 08:59:50 +0000
Subject: [PATCH] cfg80211: don't pass pointer to pointer unnecessarily
Message-Id: <20190411085950.GA27567@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Johannes Berg <johannes@sipsolutions.net>, Sara Sharon <sara.sharon@intel.com>
Cc: linux-wireless@vger.kernel.org, Luca Coelho <luciano.coelho@intel.com>, kernel-janitors@vger.kernel.org

The cfg80211_merge_profile() and ieee802_11_find_bssid_profile() are
a bit cleaner if we just pass the merged_ie pointer instead of a pointer
to the pointer.

This isn't a functional change, it's just a clean up.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 include/net/cfg80211.h | 2 +-
 net/mac80211/util.c    | 8 ++++----
 net/wireless/scan.c    | 8 ++++----
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/include/net/cfg80211.h b/include/net/cfg80211.h
index e42604533c99..7c01a5fe2300 100644
--- a/include/net/cfg80211.h
+++ b/include/net/cfg80211.h
@@ -5556,7 +5556,7 @@ bool cfg80211_is_element_inherited(const struct element *element,
 size_t cfg80211_merge_profile(const u8 *ie, size_t ielen,
 			      const struct element *mbssid_elem,
 			      const struct element *sub_elem,
-			      u8 **merged_ie, size_t max_copy_len);
+			      u8 *merged_ie, size_t max_copy_len);
 
 /**
  * enum cfg80211_bss_frame_type - frame type that the BSS data came from
diff --git a/net/mac80211/util.c b/net/mac80211/util.c
index da93f6898bb6..d63b6f4937fb 100644
--- a/net/mac80211/util.c
+++ b/net/mac80211/util.c
@@ -1258,7 +1258,7 @@ static size_t ieee802_11_find_bssid_profile(const u8 *start, size_t len,
 					    struct ieee802_11_elems *elems,
 					    u8 *transmitter_bssid,
 					    u8 *bss_bssid,
-					    u8 **nontransmitted_profile)
+					    u8 *nontransmitted_profile)
 {
 	const struct element *elem, *sub;
 	size_t profile_len = 0;
@@ -1290,7 +1290,7 @@ static size_t ieee802_11_find_bssid_profile(const u8 *start, size_t len,
 				continue;
 			}
 
-			memset(*nontransmitted_profile, 0, len);
+			memset(nontransmitted_profile, 0, len);
 			profile_len = cfg80211_merge_profile(start, len,
 							     elem,
 							     sub,
@@ -1299,7 +1299,7 @@ static size_t ieee802_11_find_bssid_profile(const u8 *start, size_t len,
 
 			/* found a Nontransmitted BSSID Profile */
 			index = cfg80211_find_ie(WLAN_EID_MULTI_BSSID_IDX,
-						 *nontransmitted_profile,
+						 nontransmitted_profile,
 						 profile_len);
 			if (!index || index[1] < 1 || index[2] = 0) {
 				/* Invalid MBSSID Index element */
@@ -1341,7 +1341,7 @@ u32 ieee802_11_parse_elems_crc(const u8 *start, size_t len, bool action,
 			ieee802_11_find_bssid_profile(start, len, elems,
 						      transmitter_bssid,
 						      bss_bssid,
-						      &nontransmitted_profile);
+						      nontransmitted_profile);
 		non_inherit  			cfg80211_find_ext_elem(WLAN_EID_EXT_NON_INHERITANCE,
 					       nontransmitted_profile,
diff --git a/net/wireless/scan.c b/net/wireless/scan.c
index 6956eb4bf917..c04f5451f89b 100644
--- a/net/wireless/scan.c
+++ b/net/wireless/scan.c
@@ -1501,7 +1501,7 @@ static const struct element
 size_t cfg80211_merge_profile(const u8 *ie, size_t ielen,
 			      const struct element *mbssid_elem,
 			      const struct element *sub_elem,
-			      u8 **merged_ie, size_t max_copy_len)
+			      u8 *merged_ie, size_t max_copy_len)
 {
 	size_t copied_len = sub_elem->datalen;
 	const struct element *next_mbssid;
@@ -1509,7 +1509,7 @@ size_t cfg80211_merge_profile(const u8 *ie, size_t ielen,
 	if (sub_elem->datalen > max_copy_len)
 		return 0;
 
-	memcpy(*merged_ie, sub_elem->data, sub_elem->datalen);
+	memcpy(merged_ie, sub_elem->data, sub_elem->datalen);
 
 	while ((next_mbssid = cfg80211_get_profile_continuation(ie, ielen,
 								mbssid_elem,
@@ -1518,7 +1518,7 @@ size_t cfg80211_merge_profile(const u8 *ie, size_t ielen,
 
 		if (copied_len + next_sub->datalen > max_copy_len)
 			break;
-		memcpy(*merged_ie + copied_len, next_sub->data,
+		memcpy(merged_ie + copied_len, next_sub->data,
 		       next_sub->datalen);
 		copied_len += next_sub->datalen;
 	}
@@ -1587,7 +1587,7 @@ static void cfg80211_parse_mbssid_data(struct wiphy *wiphy,
 			profile_len = cfg80211_merge_profile(ie, ielen,
 							     elem,
 							     sub,
-							     &profile,
+							     profile,
 							     ielen);
 
 			/* found a Nontransmitted BSSID Profile */
-- 
2.17.1
