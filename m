From: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Date: Thu, 19 Nov 2015 20:48:09 +0000
Subject: Re: [PATCH 3/7] phy: berlin-sata: add missing of_node_put
Message-Id: <564E3589.30806@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1447673600-8881-1-git-send-email-Julia.Lawall@lip6.fr>
 <1447673600-8881-4-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1447673600-8881-4-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>, Kishon Vijay Abraham I <kishon@ti.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Russell King - ARM Linux <linux@arm.linux.org.uk>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Andrew Lunn <andrew@lunn.ch>, Bjorn Helgaas <bhelgaas@google.com>, Jason Cooper <jason@lakedaemon.net>

On 16.11.2015 12:33, Julia Lawall wrote:
> for_each_available_child_of_node performs an of_node_get on each iteration,
> so a return from the middle of the loop requires an of_node_put.
> 
> A simplified version of the semantic patch that finds this problem is as
> follows (http://coccinelle.lip6.fr):
> 
> // <smpl>
> @@
> expression root,e;
> local idexpression child;
> @@
> 
>  for_each_available_child_of_node(root, child) {
>    ... when != of_node_put(child)
>        when != e = child
> (
>    return child;
> |
> *  return ...;
> )
>    ...
>  }
> // </smpl>
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Acked-by: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>

Thanks!

> ---
>  drivers/phy/phy-berlin-sata.c |   20 ++++++++++++++------
>  1 file changed, 14 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/phy/phy-berlin-sata.c b/drivers/phy/phy-berlin-sata.c
> index 77a2e05..f84a33a 100644
> --- a/drivers/phy/phy-berlin-sata.c
> +++ b/drivers/phy/phy-berlin-sata.c
> @@ -195,7 +195,7 @@ static int phy_berlin_sata_probe(struct platform_device *pdev)
>  	struct phy_provider *phy_provider;
>  	struct phy_berlin_priv *priv;
>  	struct resource *res;
> -	int i = 0;
> +	int ret, i = 0;
>  	u32 phy_id;
>  
>  	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> @@ -237,22 +237,27 @@ static int phy_berlin_sata_probe(struct platform_device *pdev)
>  		if (of_property_read_u32(child, "reg", &phy_id)) {
>  			dev_err(dev, "missing reg property in node %s\n",
>  				child->name);
> -			return -EINVAL;
> +			ret = -EINVAL;
> +			goto put_child;
>  		}
>  
>  		if (phy_id >= ARRAY_SIZE(phy_berlin_power_down_bits)) {
>  			dev_err(dev, "invalid reg in node %s\n", child->name);
> -			return -EINVAL;
> +			ret = -EINVAL;
> +			goto put_child;
>  		}
>  
>  		phy_desc = devm_kzalloc(dev, sizeof(*phy_desc), GFP_KERNEL);
> -		if (!phy_desc)
> -			return -ENOMEM;
> +		if (!phy_desc) {
> +			ret = -ENOMEM;
> +			goto put_child;
> +		}
>  
>  		phy = devm_phy_create(dev, NULL, &phy_berlin_sata_ops);
>  		if (IS_ERR(phy)) {
>  			dev_err(dev, "failed to create PHY %d\n", phy_id);
> -			return PTR_ERR(phy);
> +			ret = PTR_ERR(phy);
> +			goto put_child;
>  		}
>  
>  		phy_desc->phy = phy;
> @@ -269,6 +274,9 @@ static int phy_berlin_sata_probe(struct platform_device *pdev)
>  	phy_provider >  		devm_of_phy_provider_register(dev, phy_berlin_sata_phy_xlate);
>  	return PTR_ERR_OR_ZERO(phy_provider);
> +put_child:
> +	of_node_put(child);
> +	return ret;
>  }
>  
>  static const struct of_device_id phy_berlin_sata_of_match[] = {
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
> 

