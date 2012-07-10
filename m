From: wfg@linux.intel.com
Date: Tue, 10 Jul 2012 00:56:34 +0000
Subject: [mac80211-next:wip 98/99] net/mac80211/rx.c:2896:30: warning: unused variable 'status'
Message-Id: <20120710005634.GA7486@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Johannes,

There are new compile warnings show up in

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/jberg/mac80211-next.git wip
head:   55c0f091d91c63016d252ab84ec17b65d47e18cd
commit: 7f83fb5aa41a1b7d1b11a3a996d9a06b7909697d [98/99] mac80211: redesign scan RX

All warnings:

net/mac80211/rx.c: In function '__ieee80211_rx_handle_packet':
net/mac80211/rx.c:2896:30: warning: unused variable 'status' [-Wunused-variable]

vim +2896 net/mac80211/rx.c
  2893	static void __ieee80211_rx_handle_packet(struct ieee80211_hw *hw,
  2894						 struct sk_buff *skb)
  2895	{
> 2896		struct ieee80211_rx_status *status = IEEE80211_SKB_RXCB(skb);
  2897		struct ieee80211_local *local = hw_to_local(hw);
  2898		struct ieee80211_sub_if_data *sdata;
  2899		struct ieee80211_hdr *hdr;

The reference to 'status' is removed by

@@ -2940,11 +2911,6 @@ static void __ieee80211_rx_handle_packet(struct ieee80211_hw *hw,
        if (ieee80211_is_data(fc) || ieee80211_is_mgmt(fc))
                local->dot11ReceivedFragmentCount++;
 
-       if (unlikely(test_bit(SCAN_HW_SCANNING, &local->scanning) ||
-                    test_bit(SCAN_ONCHANNEL_SCANNING, &local->scanning) ||
-                    test_bit(SCAN_SW_SCANNING, &local->scanning)))
-               status->rx_flags |= IEEE80211_RX_IN_SCAN;
-
        if (ieee80211_is_mgmt(fc))
                err = skb_linearize(skb);
        else

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu <wfg@linux.intel.com>                     Intel Corporation
