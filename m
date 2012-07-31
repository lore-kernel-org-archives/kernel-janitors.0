From: walter harms <wharms@bfs.de>
Date: Tue, 31 Jul 2012 15:37:00 +0000
Subject: Re: [mac80211-next:wip 48/49] net/mac80211/tx.c:1930:21: warning: 'chanctx_conf' may be used uniniti
Message-Id: <5017FB9C.8050707@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120731151350.GA21002@localhost>
In-Reply-To: <20120731151350.GA21002@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org



Am 31.07.2012 17:13, schrieb Fengguang Wu:
> Hi Johannes,
> 
> There are new compile warnings show up in
> 
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/jberg/mac80211-next.git wip
> head:   161206c4a3427bfb364e924454d5267e175e9b9b
> commit: 71e414d5d526fec40144af3e8c4c25b08ae52dd6 [48/49] mac80211: use channel contexts
> 
> All error/warnings:
> 
> net/mac80211/tx.c: In function 'ieee80211_subif_start_xmit':
> net/mac80211/tx.c:1930:21: warning: 'chanctx_conf' may be used uninitialized in this function [-Wmaybe-uninitialized]
> 
> It's conditionally assigned to in this chunk:
> 
>         case NL80211_IFTYPE_AP:
>                 fc |= cpu_to_le16(IEEE80211_FCTL_FROMDS);
>                 /* DA BSSID SA */
>                 memcpy(hdr.addr1, skb->data, ETH_ALEN);
>                 memcpy(hdr.addr2, sdata->vif.addr, ETH_ALEN);
>                 memcpy(hdr.addr3, skb->data + ETH_ALEN, ETH_ALEN);
>                 hdrlen = 24;
> +               if (sdata->vif.type = NL80211_IFTYPE_AP)
> +                       chanctx_conf = rcu_dereference(sdata->vif.chanctx_conf);
>                 break;
> 

mmh, i see a magic number ...
hdrlen = 24; i assume that means /* ETH_ALEN + ETH_ALEN + ETH_ALEN */

if that is correct would some please add a comment ?

re,
 wh

