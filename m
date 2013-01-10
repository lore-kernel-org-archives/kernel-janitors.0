From: "Ariel Elior" <ariele@broadcom.com>
Date: Thu, 10 Jan 2013 09:53:36 +0000
Subject: RE: [patch] bnx2x: move debugging code before the return
Message-Id: <6AE768456CEC4B4A9B2248CB6B87EB3E1BCC893D@SJEXCHMB05.corp.ad.broadcom.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130110085807.GB23063@elgon.mountain>
In-Reply-To: <20130110085807.GB23063@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Eilon Greenstein <eilong@broadcom.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

> -----Original Message-----
> From: netdev-owner@vger.kernel.org [mailto:netdev-
> owner@vger.kernel.org] On Behalf Of Dan Carpenter
> Sent: Thursday, January 10, 2013 10:58 AM
> To: Eilon Greenstein
> Cc: netdev@vger.kernel.org; kernel-janitors@vger.kernel.org
> Subject: [patch] bnx2x: move debugging code before the return
> 
> I move the return down a line after the debugging printk.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_ethtool.c
> b/drivers/net/ethernet/broadcom/bnx2x/bnx2x_ethtool.c
> index 292634f..d7029c8 100644
> --- a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_ethtool.c
> +++ b/drivers/net/ethernet/broadcom/bnx2x/bnx2x_ethtool.c
> @@ -2768,10 +2768,10 @@ static int bnx2x_set_rss_flags(struct bnx2x *bp,
> struct ethtool_rxnfc *info)
>  		} else if ((info->flow_type = UDP_V6_FLOW) &&
>  			   (bp->rss_conf_obj.udp_rss_v6 !> udp_rss_requested)) {
>  			bp->rss_conf_obj.udp_rss_v6 = udp_rss_requested;
> -			return bnx2x_config_rss_pf(bp, &bp->rss_conf_obj,
> 0);
>  			DP(BNX2X_MSG_ETHTOOL,
>  			   "rss re-configured, UDP 4-tupple %s\n",
>  			   udp_rss_requested ? "enabled" : "disabled");
> +			return bnx2x_config_rss_pf(bp, &bp->rss_conf_obj,
> 0);
>  		} else {
>  			return 0;
>  		}
> --
> To unsubscribe from this list: send the line "unsubscribe netdev" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

Thanks Dan.
Acked-by: Ariel Elior <ariele@broadcom.com>


