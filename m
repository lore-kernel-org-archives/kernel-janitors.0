From: Markus Elfring <Markus.Elfring@web.de>
Date: Mon, 05 Aug 2019 12:30:55 +0000
Subject: Re: [PATCH] regulator: core: Add of_node_put() before return
Message-Id: <127231a4-f181-e172-2262-eb2604cacb0b@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190804162023.5673-1-nishkadg.linux@gmail.com>
In-Reply-To: <20190804162023.5673-1-nishkadg.linux@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Nishka Dasgupta <nishkadg.linux@gmail.com>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

> +++ b/drivers/regulator/core.c
> @@ -380,9 +380,12 @@ static struct device_node *of_get_child_regulator(struct device_node *parent,
>
>  		if (!regnode) {
>  			regnode = of_get_child_regulator(child, prop_name);
> -			if (regnode)
> +			if (regnode) {
> +				of_node_put(child);
>  				return regnode;
> +			}
>  		} else {
> +			of_node_put(child);
>  			return regnode;
>  		}
>  	}

I suggest to move common exception handling code to the end of
this function implementation.
Would you like to add a jump target like “put_node”?

Regards,
Markus
