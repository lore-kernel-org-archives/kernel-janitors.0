From: Neil Armstrong <narmstrong@baylibre.com>
Date: Tue, 25 Apr 2017 09:42:44 +0000
Subject: Re: [PATCH] mtd: oxnas_nand: Allocating more than necessary in probe()
Message-Id: <26f3dff2-274c-0b5f-cbfb-a95a23a2131a@baylibre.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170425091949.uindhaxmbtsksqc7@mwanda>
In-Reply-To: <20170425091949.uindhaxmbtsksqc7@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org, linux-oxnas@lists.tuxfamily.org, kernel-janitors@vger.kernel.org

On 04/25/2017 11:19 AM, Dan Carpenter wrote:
> We only need to allocate sizeof(struct oxnas_nand_ctrl) which is 192
> bytes and not sizeof(struct nand_chip) which is a much larger 3056
> bytes.
> 
> Fixes: 668592492409 ("mtd: nand: Add OX820 NAND Support")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/mtd/nand/oxnas_nand.c b/drivers/mtd/nand/oxnas_nand.c
> index 3e3bf3b364d2..1b207aac840c 100644
> --- a/drivers/mtd/nand/oxnas_nand.c
> +++ b/drivers/mtd/nand/oxnas_nand.c
> @@ -91,7 +91,7 @@ static int oxnas_nand_probe(struct platform_device *pdev)
>  	int err = 0;
>  
>  	/* Allocate memory for the device structure (and zero it) */
> -	oxnas = devm_kzalloc(&pdev->dev, sizeof(struct nand_chip),
> +	oxnas = devm_kzalloc(&pdev->dev, sizeof(*oxnas),
>  			     GFP_KERNEL);
>  	if (!oxnas)
>  		return -ENOMEM;
> 

Acked-by: Neil Armstrong <narmstrong@baylibre.com>
