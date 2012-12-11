From: Evgeniy Polyakov <zbr@ioremap.net>
Date: Tue, 11 Dec 2012 21:25:56 +0000
Subject: Re: [PATCH 1/2] drivers/w1/masters/mxc_w1.c: use devm_ functions
Message-Id: <20121211212555.GA15333@ioremap.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1354835724-26945-2-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1354835724-26945-2-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Hi

On Fri, Dec 07, 2012 at 12:15:24AM +0100, Julia Lawall (Julia.Lawall@lip6.fr) wrote:
> +	mdev = devm_kzalloc(&pdev->dev, sizeof(struct mxc_w1_device),
> +			    GFP_KERNEL);
>  	if (!mdev)
>  		return -ENOMEM;
>  
> -	mdev->clk = clk_get(&pdev->dev, NULL);
> -	if (IS_ERR(mdev->clk)) {
> -		err = PTR_ERR(mdev->clk);
> -		goto failed_clk;
> -	}
> +	mdev->clk = devm_clk_get(&pdev->dev, NULL);
> +	if (IS_ERR(mdev->clk))
> +		return PTR_ERR(mdev->clk);
>  
>  	mdev->clkdiv = (clk_get_rate(mdev->clk) / 1000000) - 1;
>  
> -	res = request_mem_region(res->start, resource_size(res),
> -				"mxc_w1");
> -	if (!res) {
> -		err = -EBUSY;
> -		goto failed_req;
> -	}
> -
> -	mdev->regs = ioremap(res->start, resource_size(res));
> -	if (!mdev->regs) {
> -		dev_err(&pdev->dev, "Cannot map mxc_w1 registers\n");
> -		goto failed_ioremap;
> -	}
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	mdev->regs = devm_request_and_ioremap(&pdev->dev, res);
> +	if (!mdev->regs)
> +		return -EBUSY;

I suppose mdev will be automatically freed, but who will release
mdev->clk and other private members of mdev structure?

-- 
	Evgeniy Polyakov
