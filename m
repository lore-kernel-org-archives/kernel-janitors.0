From: Markus Elfring <Markus.Elfring@web.de>
Date: Sun, 14 Apr 2019 15:25:24 +0000
Subject: Re: [PATCH 03/12] PowerPC-83xx: add missing of_node_put after of_device_is_available
Message-Id: <7643aab3-e16c-20ba-6949-f2dea2dfa2f0@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1550928043-14889-4-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1550928043-14889-4-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>, Mukesh Ojha <mojha@codeaurora.org>, Scott Wood <oss@buserror.net>, linuxppc-dev@lists.ozlabs.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>

> @@ -221,8 +221,10 @@ int mpc837x_usb_cfg(void)
>  	int ret = 0;
>
>  	np = of_find_compatible_node(NULL, NULL, "fsl-usb2-dr");
> -	if (!np || !of_device_is_available(np))
> +	if (!np || !of_device_is_available(np)) {
> +		of_node_put(np);
>  		return -ENODEV;
> +	}
>  	prop = of_get_property(np, "phy_type", NULL);
>
>  	if (!prop || (strcmp(prop, "ulpi") && strcmp(prop, "serial"))) {

How do you think about to adjust the exception handling in this function
implementation a bit more according to the Linux coding style?

Regards,
Markus
