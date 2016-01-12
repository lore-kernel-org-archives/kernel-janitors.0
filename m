From: Andrew Lunn <andrew@lunn.ch>
Date: Tue, 12 Jan 2016 14:09:30 +0000
Subject: Re: [patch 1/2 -next] mdio: remove an unneed condition
Message-Id: <20160112140930.GB5527@lunn.ch>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160112093534.GE29804@mwanda>
In-Reply-To: <20160112093534.GE29804@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Tue, Jan 12, 2016 at 12:35:34PM +0300, Dan Carpenter wrote:
> It used to be that mdio->irq was a pointer but after e7f4dc3536a4
> ('mdio: Move allocation of interrupts into core') it's an array inside
> the mdio struct so it can never be NULL.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

For both patches:

Reviewd-by: Andrew Lunn <andrew@lunn.ch>

Thanks
	Andrew

> 
> diff --git a/drivers/of/of_mdio.c b/drivers/of/of_mdio.c
> index c0a8f84..86829f8 100644
> --- a/drivers/of/of_mdio.c
> +++ b/drivers/of/of_mdio.c
> @@ -62,11 +62,9 @@ static int of_mdiobus_register_phy(struct mii_bus *mdio, struct device_node *chi
>  	rc = irq_of_parse_and_map(child, 0);
>  	if (rc > 0) {
>  		phy->irq = rc;
> -		if (mdio->irq)
> -			mdio->irq[addr] = rc;
> +		mdio->irq[addr] = rc;
>  	} else {
> -		if (mdio->irq)
> -			phy->irq = mdio->irq[addr];
> +		phy->irq = mdio->irq[addr];
>  	}
>  
>  	if (of_property_read_bool(child, "broken-turn-around"))
