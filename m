From: Kishon Vijay Abraham I <kishon@ti.com>
Date: Mon, 11 Nov 2013 14:49:19 +0000
Subject: Re: [patch] drivers: phy: tweaks to phy_create()
Message-Id: <5280EB9F.1050003@ti.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20131106075412.GB13475@elgon.mountain>
In-Reply-To: <20131106075412.GB13475@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Tomasz Figa <t.figa@samsung.com>, Felipe Balbi <balbi@ti.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>

Hi Dan,

On Wednesday 06 November 2013 01:24 PM, Dan Carpenter wrote:
> If this was called with a NULL "dev" then it lead to a NULL dereference
> when we called dev_WARN().  I have changed it to WARN_ON() so that we
> get a stack dump and can fix the caller.
> 
> If ida_simple_get() failed then there was a missing call to kfree(phy).
> 
> The rest of this patch is just cleanup like returning directly instead
> of having do-nothing gotos.  Using descriptive labels instead of
> GW-BASIC style "err0" and "err1".  I also flipped the order of
> put_device() and ida_remove() so they are a mirror reflection of the
> order they were allocated.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Can you create this patch on top of
git://git.kernel.org/pub/scm/linux/kernel/git/kishon/linux-phy.git fixes ?

Thanks
Kishon

> 
> diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
> index 03cf8fb..18b9de7 100644
> --- a/drivers/phy/phy-core.c
> +++ b/drivers/phy/phy-core.c
> @@ -437,23 +437,18 @@ struct phy *phy_create(struct device *dev, const struct phy_ops *ops,
>  	int id;
>  	struct phy *phy;
>  
> -	if (!dev) {
> -		dev_WARN(dev, "no device provided for PHY\n");
> -		ret = -EINVAL;
> -		goto err0;
> -	}
> +	if (WARN_ON(!dev))
> +		return ERR_PTR(-EINVAL);
>  
>  	phy = kzalloc(sizeof(*phy), GFP_KERNEL);
> -	if (!phy) {
> -		ret = -ENOMEM;
> -		goto err0;
> -	}
> +	if (!phy)
> +		return ERR_PTR(-ENOMEM);
>  
>  	id = ida_simple_get(&phy_ida, 0, 0, GFP_KERNEL);
>  	if (id < 0) {
>  		dev_err(dev, "unable to get id\n");
>  		ret = id;
> -		goto err0;
> +		goto free_phy;
>  	}
>  
>  	device_initialize(&phy->dev);
> @@ -468,11 +463,11 @@ struct phy *phy_create(struct device *dev, const struct phy_ops *ops,
>  
>  	ret = dev_set_name(&phy->dev, "phy-%s.%d", dev_name(dev), id);
>  	if (ret)
> -		goto err1;
> +		goto put_dev;
>  
>  	ret = device_add(&phy->dev);
>  	if (ret)
> -		goto err1;
> +		goto put_dev;
>  
>  	if (pm_runtime_enabled(dev)) {
>  		pm_runtime_enable(&phy->dev);
> @@ -481,12 +476,12 @@ struct phy *phy_create(struct device *dev, const struct phy_ops *ops,
>  
>  	return phy;
>  
> -err1:
> -	ida_remove(&phy_ida, phy->id);
> +put_dev:
>  	put_device(&phy->dev);
> +	ida_remove(&phy_ida, phy->id);
> +free_phy:
>  	kfree(phy);
>  
> -err0:
>  	return ERR_PTR(ret);
>  }
>  EXPORT_SYMBOL_GPL(phy_create);
> 

