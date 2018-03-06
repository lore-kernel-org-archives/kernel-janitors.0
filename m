From: Julia Lawall <julia.lawall@lip6.fr>
Date: Tue, 06 Mar 2018 10:26:19 +0000
Subject: Re: [PATCH] ipmi: missing error code in try_smi_init()
Message-Id: <alpine.DEB.2.20.1803061126040.3318@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180306095803.GA10474@mwanda>
In-Reply-To: <20180306095803.GA10474@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org



On Tue, 6 Mar 2018, Dan Carpenter wrote:

> If platform_device_alloc() then we should return -ENOMEM instead of
> returning success.

It looks like the word "fails" got lost here.

julia

>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> diff --git a/drivers/char/ipmi/ipmi_si_intf.c b/drivers/char/ipmi/ipmi_si_intf.c
> index f2a294f78892..ff870aa91cfe 100644
> --- a/drivers/char/ipmi/ipmi_si_intf.c
> +++ b/drivers/char/ipmi/ipmi_si_intf.c
> @@ -2071,6 +2071,7 @@ static int try_smi_init(struct smi_info *new_smi)
>  						      new_smi->intf_num);
>  		if (!new_smi->pdev) {
>  			pr_err(PFX "Unable to allocate platform device\n");
> +			rv = -ENOMEM;
>  			goto out_err;
>  		}
>  		new_smi->io.dev = &new_smi->pdev->dev;
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
