From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sat, 20 Oct 2012 11:10:50 +0000
Subject: [mac80211-next:master 38/38] net/mac80211/tx.c:2753 ieee80211_get_buffered_bc() error: we previously
Message-Id: <20121020111050.GA6315@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Marco,

FYI, there are new smatch warnings show up in

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/jberg/mac80211-next.git master
head:   4e36459d0471786a90b7c77b35645a1df8f6760f
commit: 4e36459d0471786a90b7c77b35645a1df8f6760f [38/38] mac80211: make client powersave independent of interface type

  net/mac80211/tx.c:1361 invoke_tx_handlers() warn: variable dereferenced before check 'tx->skb' (see line 1359)
+ net/mac80211/tx.c:2753 ieee80211_get_buffered_bc() error: we previously assumed 'chanctx_conf' could be null (see line 2714)

vim +2753 net/mac80211/tx.c

e2ebc74d Johannes Berg 2007-07-27  2708  
32bfd35d Johannes Berg 2007-12-19  2709  	sdata = vif_to_sdata(vif);
5dfdaf58 Johannes Berg 2007-12-19  2710  
5dfdaf58 Johannes Berg 2007-12-19  2711  	rcu_read_lock();
55de908a Johannes Berg 2012-07-26  2712  	chanctx_conf = rcu_dereference(sdata->vif.chanctx_conf);
5dfdaf58 Johannes Berg 2007-12-19  2713  
4e36459d Marco Porsch  2012-10-10 @2714  	if (sdata->vif.type = NL80211_IFTYPE_AP || !chanctx_conf) {
4e36459d Marco Porsch  2012-10-10  2715  		struct beacon_data *beacon 4e36459d Marco Porsch  2012-10-10  2716  				rcu_dereference(sdata->u.ap.beacon);
4e36459d Marco Porsch  2012-10-10  2717  
4e36459d Marco Porsch  2012-10-10  2718  		if (!beacon || !beacon->head)
4e36459d Marco Porsch  2012-10-10  2719  			goto out;
4e36459d Marco Porsch  2012-10-10  2720  
4e36459d Marco Porsch  2012-10-10  2721  		ps = &sdata->u.ap.ps;
4e36459d Marco Porsch  2012-10-10  2722  	} else {
747cf5e9 Tomas Winkler 2008-05-27  2723  		goto out;
4e36459d Marco Porsch  2012-10-10  2724  	}
5dfdaf58 Johannes Berg 2007-12-19  2725  
4e36459d Marco Porsch  2012-10-10  2726  	if (ps->dtim_count != 0 || !ps->dtim_bc_mc)
747cf5e9 Tomas Winkler 2008-05-27  2727  		goto out; /* send buffered bc/mc only after DTIM beacon */
e039fa4a Johannes Berg 2008-05-15  2728  
e2ebc74d Johannes Berg 2007-07-27  2729  	while (1) {
4e36459d Marco Porsch  2012-10-10  2730  		skb = skb_dequeue(&ps->bc_buf);
e2ebc74d Johannes Berg 2007-07-27  2731  		if (!skb)
747cf5e9 Tomas Winkler 2008-05-27  2732  			goto out;
e2ebc74d Johannes Berg 2007-07-27  2733  		local->total_ps_buffered--;
e2ebc74d Johannes Berg 2007-07-27  2734  
4e36459d Marco Porsch  2012-10-10  2735  		if (!skb_queue_empty(&ps->bc_buf) && skb->len >= 2) {
e2ebc74d Johannes Berg 2007-07-27  2736  			struct ieee80211_hdr *hdr e2ebc74d Johannes Berg 2007-07-27  2737  				(struct ieee80211_hdr *) skb->data;
e2ebc74d Johannes Berg 2007-07-27  2738  			/* more buffered multicast/broadcast frames => set
e2ebc74d Johannes Berg 2007-07-27  2739  			 * MoreData flag in IEEE 802.11 header to inform PS
e2ebc74d Johannes Berg 2007-07-27  2740  			 * STAs */
e2ebc74d Johannes Berg 2007-07-27  2741  			hdr->frame_control |e2ebc74d Johannes Berg 2007-07-27  2742  				cpu_to_le16(IEEE80211_FCTL_MOREDATA);
e2ebc74d Johannes Berg 2007-07-27  2743  		}
e2ebc74d Johannes Berg 2007-07-27  2744  
3b8d81e0 Johannes Berg 2009-06-17  2745  		if (!ieee80211_tx_prepare(sdata, &tx, skb))
e2ebc74d Johannes Berg 2007-07-27  2746  			break;
e2ebc74d Johannes Berg 2007-07-27  2747  		dev_kfree_skb_any(skb);
e2ebc74d Johannes Berg 2007-07-27  2748  	}
e039fa4a Johannes Berg 2008-05-15  2749  
e039fa4a Johannes Berg 2008-05-15  2750  	info = IEEE80211_SKB_CB(skb);
e039fa4a Johannes Berg 2008-05-15  2751  
5cf121c3 Johannes Berg 2008-02-25  2752  	tx.flags |= IEEE80211_TX_PS_BUFFERED;
55de908a Johannes Berg 2012-07-26 @2753  	info->band = chanctx_conf->channel->band;
e2ebc74d Johannes Berg 2007-07-27  2754  
97b045d6 Johannes Berg 2008-06-20  2755  	if (invoke_tx_handlers(&tx))
e2ebc74d Johannes Berg 2007-07-27  2756  		skb = NULL;

The code at line 2753 was first introduced by commit:
55de908 mac80211: use channel contexts


---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
