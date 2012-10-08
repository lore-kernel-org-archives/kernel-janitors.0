From: Stephen Hemminger <shemminger@vyatta.com>
Date: Mon, 08 Oct 2012 16:51:14 +0000
Subject: Re: drivers/net/vxlan.c:676:53: sparse: incorrect type in argument 5 (different base types)
Message-Id: <20121008095114.1f21a07e@nehalam.linuxnetplumber.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121007123635.GB24374@localhost>
In-Reply-To: <20121007123635.GB24374@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sun, 7 Oct 2012 20:36:35 +0800
Fengguang Wu <fengguang.wu@intel.com> wrote:

> Hi stephen,
> 
> FYI, there are new sparse warnings show up in
> 
> commit: d342894c5d2f8c7df194c793ec4059656e09ca31  vxlan: virtual extensible lan
> 
> + drivers/net/vxlan.c:676:53: sparse: incorrect type in argument 5 (different base types)
>   drivers/net/vxlan.c:676:53:    expected restricted __be32 [usertype] gre_key
>   drivers/net/vxlan.c:676:53:    got unsigned int [unsigned] [usertype] vni
> + drivers/net/vxlan.c:706:20: sparse: incorrect type in assignment (different base types)
>   drivers/net/vxlan.c:706:20:    expected restricted __be16 [usertype] source
>   drivers/net/vxlan.c:706:20:    got unsigned int
>   drivers/net/vxlan.c:1087:69: sparse: incorrect type in argument 3 (different base types)
>   drivers/net/vxlan.c:1087:69:    expected unsigned int [unsigned] [usertype] value
>   drivers/net/vxlan.c:1087:69:    got restricted __be32 const [usertype] gaddr
>   drivers/net/vxlan.c:1093:69: sparse: incorrect type in argument 3 (different base types)
>   drivers/net/vxlan.c:1093:69:    expected unsigned int [unsigned] [usertype] value
>   drivers/net/vxlan.c:1093:69:    got restricted __be32 const [usertype] saddr
> 
> vim +676 drivers/net/vxlan.c
> 
> d342894c stephen hemminger 2012-10-01  660  	else if (vxlan->gaddr) {
> d342894c stephen hemminger 2012-10-01  661  		dst = vxlan->gaddr;
> d342894c stephen hemminger 2012-10-01  662  	} else
> d342894c stephen hemminger 2012-10-01  663  		goto drop;
> d342894c stephen hemminger 2012-10-01  664  
> d342894c stephen hemminger 2012-10-01  665  	ttl = vxlan->ttl;
> d342894c stephen hemminger 2012-10-01  666  	if (!ttl && IN_MULTICAST(ntohl(dst)))
> d342894c stephen hemminger 2012-10-01  667  		ttl = 1;
> d342894c stephen hemminger 2012-10-01  668  
> d342894c stephen hemminger 2012-10-01  669  	tos = vxlan->tos;
> d342894c stephen hemminger 2012-10-01  670  	if (tos = 1)
> d342894c stephen hemminger 2012-10-01  671  		tos = vxlan_get_dsfield(old_iph, skb);
> d342894c stephen hemminger 2012-10-01  672  
> d342894c stephen hemminger 2012-10-01  673  	hash = skb_get_rxhash(skb);
> d342894c stephen hemminger 2012-10-01  674  
> d342894c stephen hemminger 2012-10-01  675  	rt = ip_route_output_gre(dev_net(dev), &fl4, dst,
> d342894c stephen hemminger 2012-10-01 @676  				 vxlan->saddr, vxlan->vni,
> d342894c stephen hemminger 2012-10-01  677  				 RT_TOS(tos), vxlan->link);
> d342894c stephen hemminger 2012-10-01  678  	if (IS_ERR(rt)) {
> d342894c stephen hemminger 2012-10-01  679  		netdev_dbg(dev, "no route to %pI4\n", &dst);
> d342894c stephen hemminger 2012-10-01  680  		dev->stats.tx_carrier_errors++;
> d342894c stephen hemminger 2012-10-01  681  		goto tx_error;
> d342894c stephen hemminger 2012-10-01  682  	}
> d342894c stephen hemminger 2012-10-01  683  
> d342894c stephen hemminger 2012-10-01  684  	if (rt->dst.dev = dev) {
> 
> ---
> 0-DAY kernel build testing backend         Open Source Technology Center
> Fengguang Wu, Yuanhan Liu                              Intel Corporation


Which version of sparse is this? I see no errors with the current version 4.4.
