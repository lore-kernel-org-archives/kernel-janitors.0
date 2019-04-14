From: Markus Elfring <Markus.Elfring@web.de>
Date: Sun, 14 Apr 2019 14:45:11 +0000
Subject: Re: [PATCH 01/12] arm-cci: add missing of_node_put after of_device_is_available
Message-Id: <2c56bdcb-9354-c719-13df-38b5f1974f10@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1550928043-14889-2-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1550928043-14889-2-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>, Robin Murphy <robin.murphy@arm.com>, linux@arm.linux.org.uk
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

> @@ -538,8 +538,10 @@  static int cci_probe(void)
>  	struct resource res;
>
>  	np = of_find_matching_node(NULL, arm_cci_matches);
> -	if (!of_device_is_available(np))
> +	if (!of_device_is_available(np)) {
> +		of_node_put(np);
>  		return -ENODEV;
> +	}
>
>  	ret = of_address_to_resource(np, 0, &res);
>  	if (!ret) {

How do you think about to move this function call to an additional jump target
for the desired exception handling?

Regards,
Markus
