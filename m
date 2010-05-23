From: walter harms <wharms@bfs.de>
Date: Sun, 23 May 2010 08:27:42 +0000
Subject: Re: [patch] caif: cleanup: remove duplicate checks
Message-Id: <4BF8E6FE.9000303@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100522204519.GW22515@bicker>
In-Reply-To: <20100522204519.GW22515@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: netdev@vger.kernel.org, Sjur Braendeland <sjur.brandeland@stericsson.com>, Stephen Rothwell <sfr@canb.auug.org.au>, kernel-janitors@vger.kernel.org, "David S. Miller" <davem@davemloft.net>



Dan Carpenter schrieb:
> These checks merely duplicate the things we've asserted already.  In the
> case of the checks for null we've already dereferenced those variables
> as well.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> 
> diff --git a/net/caif/cfcnfg.c b/net/caif/cfcnfg.c
> index df43f26..cc2f072 100644
> --- a/net/caif/cfcnfg.c
> +++ b/net/caif/cfcnfg.c
> @@ -313,14 +313,10 @@ cfcnfg_linkup_rsp(struct cflayer *layer, u8 channel_id, enum cfctrl_srv serv,
>  	caif_assert(phyinfo->phy_layer != NULL);
>  	caif_assert(phyinfo->phy_layer->id = phyid);
>  
> -	if (phyinfo != NULL &&
> -	    phyinfo->phy_ref_count++ = 0 &&
> -	    phyinfo->phy_layer != NULL &&
> +	if (phyinfo->phy_ref_count++ = 0 &&
>  	    phyinfo->phy_layer->modemcmd != NULL) {
> -		caif_assert(phyinfo->phy_layer->id = phyid);
>  		phyinfo->phy_layer->modemcmd(phyinfo->phy_layer,
>  					     _CAIF_MODEMCMD_PHYIF_USEFULL);
> -
>  	}
>  	adapt_layer->id = channel_id;
>  


hi Dan,
the phyinfo->phy_ref_count++  is very hidden, perhaps in terms of readability
it is better to move the phyinfo->phy_ref_count++ inside.

just my 2 cents,

re,
 wh
