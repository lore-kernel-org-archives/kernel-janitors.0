From: Nicolas Kaiser <nikai@nikai.net>
Date: Wed, 11 May 2011 23:52:37 +0000
Subject: Re: [PATCH net-next-2.6] net/bonding: adjust codingstyle for
Message-Id: <20110512015237.32d6d92b@absol.kitzblitz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110511225208.GA18851@x61.tchesoft.com>
In-Reply-To: <20110511225208.GA18851@x61.tchesoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rafael Aquini <aquini@linux.com>
Cc: Jay Vosburgh <fubar@us.ibm.com>, Joe Perches <joe@perches.com>, kernel-janitors@vger.kernel.org, David Miller <davem@davemloft.net>, Andy Gospodarek <andy@greyhouse.net>, shemminger@vyatta.com, netdev@vger.kernel.org

* Rafael Aquini <aquini@linux.com>:
>         * switched all comments from C99-style to C89-style;

> diff --git a/drivers/net/bonding/bond_3ad.h b/drivers/net/bonding/bond_3ad.h
> index 291dbd4..bc437c3 100644
> --- a/drivers/net/bonding/bond_3ad.h
> +++ b/drivers/net/bonding/bond_3ad.h

> @@ -246,30 +257,32 @@ struct ad_system {
>  #pragma pack()
>  #endif
>  
> -// ========= AD Exported structures to the main bonding code =========
> +/* ====== AD Exported structures to the main bonding code ====== */
>  #define BOND_AD_INFO(bond)   ((bond)->ad_info)
>  #define SLAVE_AD_INFO(slave) ((slave)->ad_info)

> -// ========= AD Exported functions to the main bonding code =========
> -void bond_3ad_initialize(struct bonding *bond, u16 tick_resolution, int lacp_fast);
> +// ======= AD Exported functions to the main bonding code ====== */
   ^^
   /*

Cheers,
Nicolas Kaiser
