From: =?ISO-8859-1?Q?Svenning_S=F8rensen?= <sss@secomea.dk>
Date: Mon, 19 Aug 2013 11:17:39 +0000
Subject: Re: [PATCH 4/6] usb: musb: dsps: simplify platform_get_resource_byname/devm_ioremap_resource
Message-Id: <5211FED3.4090102@secomea.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1376902316-18520-1-git-send-email-Julia.Lawall@lip6.fr> <1376902316-18520-5-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1376902316-18520-5-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Felipe Balbi <balbi@ti.com>, kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org

On 19-08-2013 10:51, Julia Lawall wrote:
> diff --git a/drivers/usb/musb/musb_dsps.c b/drivers/usb/musb/musb_dsps.c
> index 4ffbaac..f2f9710 100644
> --- a/drivers/usb/musb/musb_dsps.c
> +++ b/drivers/usb/musb/musb_dsps.c
> @@ -357,9 +357,6 @@ static int dsps_musb_init(struct musb *musb)
>   	u32 rev, val;
>   
>   	r = platform_get_resource_byname(parent, IORESOURCE_MEM, "control");
> -	if (!r)
> -		return -EINVAL;
> -
>   	reg_base = devm_ioremap_resource(dev, r);
>   	if (!musb->ctrl_base)
>   		return -EINVAL;
Not really related to Julia's patch, apart from making it more obvious 
that there's a bug here.
I believe it is reg_base that needs to be checked, right?

Svenning
