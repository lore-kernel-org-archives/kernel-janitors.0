From: Tony Lindgren <tony@atomide.com>
Date: Wed, 28 Jun 2017 14:55:09 +0000
Subject: Re: [PATCH] phy: cpcap-usb: remove a stray tab
Message-Id: <20170628145508.GD3730@atomide.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170628121936.mjupfdpqh7tl3bnk@mwanda>
In-Reply-To: <20170628121936.mjupfdpqh7tl3bnk@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

* Dan Carpenter <dan.carpenter@oracle.com> [170628 05:20]:
> This line was indented further that it should have been.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks for fixing it:

Acked-by: Tony Lindgren <tony@atomide.com>

> diff --git a/drivers/phy/motorola/phy-cpcap-usb.c b/drivers/phy/motorola/phy-cpcap-usb.c
> index 9b63efa5ae4d..accaaaccb662 100644
> --- a/drivers/phy/motorola/phy-cpcap-usb.c
> +++ b/drivers/phy/motorola/phy-cpcap-usb.c
> @@ -506,7 +506,7 @@ static void cpcap_usb_init_optional_gpios(struct cpcap_phy_ddata *ddata)
>  		if (IS_ERR(ddata->gpio[i])) {
>  			dev_info(ddata->dev, "no mode change GPIO%i: %li\n",
>  				 i, PTR_ERR(ddata->gpio[i]));
> -				 ddata->gpio[i] = NULL;
> +			ddata->gpio[i] = NULL;
>  		}
>  	}
>  }
