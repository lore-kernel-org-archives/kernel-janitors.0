From: Markus Elfring <Markus.Elfring@web.de>
Date: Fri, 27 Sep 2019 12:12:42 +0000
Subject: Re: [PATCH v3] nfp: abm: fix memory leak in nfp_abm_u32_knode_replace
Message-Id: <1cde6417-5942-598b-3670-c0a7227ffe25@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190927015157.20070-1-navid.emamdoost@gmail.com>
In-Reply-To: <20190927015157.20070-1-navid.emamdoost@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Navid Emamdoost <navid.emamdoost@gmail.com>, Jakub Kicinski <jakub.kicinski@netronome.com>, netdev@vger.kernel.org, oss-drivers@netronome.com
Cc: Navid Emamdoost <emamd001@umn.edu>, Kangjie Lu <kjlu@umn.edu>, Stephen A McCamant <smccaman@umn.edu>, Colin Ian King <colin.king@canonical.com>, "David S. Miller" <davem@davemloft.net>, John Hurley <john.hurley@netronome.com>, Pablo Neira <pablo@netfilter.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

> Updated other gotos to have correct errno returned, too.

How do you think about to add a jump target here?


> +++ b/drivers/net/ethernet/netronome/nfp/abm/cls.c
> @@ -176,8 +176,10 @@ nfp_abm_u32_knode_replace(struct nfp_abm_link *alink,
>  	u8 mask, val;
>  	int err;
>
> -	if (!nfp_abm_u32_check_knode(alink->abm, knode, proto, extack))
> +	if (!nfp_abm_u32_check_knode(alink->abm, knode, proto, extack)) {
> +		err = -EOPNOTSUPP;
>  		goto err_delete;
> +	}
>
>  	tos_off = proto == htons(ETH_P_IP) ? 16 : 20;

-		goto err_delete;
+		goto e_opnotsupp;


> @@ -221,7 +227,7 @@ nfp_abm_u32_knode_replace(struct nfp_abm_link *alink,
>

+e_opnotsupp:
+	err = -EOPNOTSUPP;

>  err_delete:
>  	nfp_abm_u32_knode_delete(alink, knode);
> -	return -EOPNOTSUPP;
> +	return err;
>  }
>
>  static int nfp_abm_setup_tc_block_cb(enum tc_setup_type type,


Can such a change variant be a bit nicer?

Regards,
Markus
