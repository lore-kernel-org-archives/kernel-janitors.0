From: "Berg, Johannes" <johannes.berg@intel.com>
Date: Tue, 10 Jul 2012 07:19:43 +0000
Subject: RE: [mac80211-next:wip 98/99] net/mac80211/rx.c:2896:30: warning: unused variable 'status'
Message-Id: <1DC40B07CD6EC041A66726C271A73AE619582666@IRSMSX102.ger.corp.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120710005634.GA7486@localhost>
In-Reply-To: <20120710005634.GA7486@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/jberg/mac80211-next.git
> wip
> head:   55c0f091d91c63016d252ab84ec17b65d47e18cd
> commit: 7f83fb5aa41a1b7d1b11a3a996d9a06b7909697d [98/99] mac80211:
> redesign scan RX
> 
> All warnings:
> 
> net/mac80211/rx.c: In function '__ieee80211_rx_handle_packet':
> net/mac80211/rx.c:2896:30: warning: unused variable 'status' [-Wunused-
> variable]
> 
> vim +2896 net/mac80211/rx.c
>   2893	static void __ieee80211_rx_handle_packet(struct ieee80211_hw
> *hw,
>   2894						 struct sk_buff *skb)
>   2895	{
> > 2896		struct ieee80211_rx_status *status > IEEE80211_SKB_RXCB(skb);
>   2897		struct ieee80211_local *local = hw_to_local(hw);
>   2898		struct ieee80211_sub_if_data *sdata;
>   2899		struct ieee80211_hdr *hdr;
> 
> The reference to 'status' is removed by
> 
> @@ -2940,11 +2911,6 @@ static void __ieee80211_rx_handle_packet(struct
> ieee80211_hw *hw,
>         if (ieee80211_is_data(fc) || ieee80211_is_mgmt(fc))
>                 local->dot11ReceivedFragmentCount++;
> 
> -       if (unlikely(test_bit(SCAN_HW_SCANNING, &local->scanning) ||
> -                    test_bit(SCAN_ONCHANNEL_SCANNING, &local->scanning) ||
> -                    test_bit(SCAN_SW_SCANNING, &local->scanning)))
> -               status->rx_flags |= IEEE80211_RX_IN_SCAN;
> -

Cool, thanks, I'll kill the status variable.

johannes
Intel GmbH
Dornacher Strasse 1
85622 Feldkirchen/Muenchen, Deutschland
Sitz der Gesellschaft: Feldkirchen bei Muenchen
Geschaeftsfuehrer: Douglas Lusk, Peter Gleissner, Hannes Schwaderer, Christian Lamprechter
Registergericht: Muenchen HRB 47456
Ust.-IdNr./VAT Registration No.: DE129385895
Citibank Frankfurt a.M. (BLZ 502 109 00) 600119052

