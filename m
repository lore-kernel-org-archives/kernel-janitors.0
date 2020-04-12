From: Joe Perches <joe@perches.com>
Date: Sun, 12 Apr 2020 21:35:29 +0000
Subject: Re: [PATCH] net: mvneta: Fix a typo
Message-Id: <6ecfa6cb686af1452101c0b727c9eb34d5582610.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200412212034.4532-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200412212034.4532-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, thomas.petazzoni@bootlin.com, davem@davemloft.net
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sun, 2020-04-12 at 23:20 +0200, Christophe JAILLET wrote:
> s/mvmeta/mvneta/

nice. how did you find this?

> diff --git a/drivers/net/ethernet/marvell/mvneta.c b/drivers/net/ethernet/marvell/mvneta.c
[]
> @@ -5383,7 +5383,7 @@ static int __init mvneta_driver_init(void)
>  {
>  	int ret;
>  
> -	ret = cpuhp_setup_state_multi(CPUHP_AP_ONLINE_DYN, "net/mvmeta:online",
> +	ret = cpuhp_setup_state_multi(CPUHP_AP_ONLINE_DYN, "net/mvneta:online",
