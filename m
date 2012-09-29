From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sat, 29 Sep 2012 01:32:59 +0000
Subject: [wireless-testing:master 229/238] drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c:2724:21: spa
Message-Id: <20120929013259.GA11675@localhost>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="1yeeQ81UyVL57Vl7"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120929012055.GF29576@yliu-dev.sh.intel.com>
In-Reply-To: <20120929012055.GF29576@yliu-dev.sh.intel.com>
To: Hante Meuleman <meuleman@broadcom.com>
Cc: kernel-janitors@vger.kernel.org, "John W. Linville" <linville@tuxdriver.com>, Arend van Spriel <arend@broadcom.com>, linux-wireless@vger.kernel.org


--1yeeQ81UyVL57Vl7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Hante,

FYI, there are new sparse warnings show up in

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/linville/wireless-testing.git master
head:   96df9f3dca2428ac1e0b46d378b6f68ff64db67b
commit: 1a87334239757b69eb9885979c32bbf871b3ec88 [229/238] brcmfmac: add hostap supoort.

+ drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c:2724:21: sparse: symbol 'brcmf_find_wpaie' was not declared. Should it be static?
+ drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c:4022:28: sparse: Using plain integer as NULL pointer
+ drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c:4013:1: sparse: symbol 'brcmf_set_management_ie' was not declared. Should it be static?

Please consider folding the attached diff :-)

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu, Yuanhan Liu                              Intel Corporation

--1yeeQ81UyVL57Vl7
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="make-it-static-1a87334.diff"

diff --git a/drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c b/drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c
index 0ecd0df..b42ccb1 100644
--- a/drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c
+++ b/drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c
@@ -2721,7 +2721,7 @@ brcmf_tlv_has_ie(u8 *ie, u8 **tlvs, u32 *tlvs_len,
 	return false;
 }
 
-struct brcmf_vs_tlv *
+static struct brcmf_vs_tlv *
 brcmf_find_wpaie(u8 *parse, u32 len)
 {
 	struct brcmf_tlv *ie;
@@ -4009,7 +4009,7 @@ brcmf_vndr_ie(u8 *iebuf, s32 pktflag, u8 *ie_ptr, u32 ie_len, s8 *add_del_cmd)
 	return ie_len + VNDR_IE_HDR_SIZE;
 }
 
-s32
+static s32
 brcmf_set_management_ie(struct brcmf_cfg80211_priv *cfg_priv,
 			struct net_device *ndev, s32 bssidx, s32 pktflag,
 			u8 *vndr_ie_buf, u32 vndr_ie_len)

--1yeeQ81UyVL57Vl7--
