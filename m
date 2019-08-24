From: Corey Minyard <minyard@acm.org>
Date: Sat, 24 Aug 2019 20:51:00 +0000
Subject: Re: [PATCH] ipmi_ssif: Fix locking on probe error path
Message-Id: <20190824205059.GB14083@minyard.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190824145147.GB5337@mwanda>
In-Reply-To: <20190824145147.GB5337@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, Aug 24, 2019 at 05:51:47PM +0300, Dan Carpenter wrote:
> If the allocations failed then we returned with the lock held.  This
> patch moves the allocations infront of the locking.

This had already been fixed, but thanks for the heads up.

-corey

> 
> Fixes: 714acbc6cc39 ("ipmi_ssif: avoid registering duplicate ssif interface")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/char/ipmi/ipmi_ssif.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/char/ipmi/ipmi_ssif.c b/drivers/char/ipmi/ipmi_ssif.c
> index 205726926bd3..9cf2efd33f19 100644
> --- a/drivers/char/ipmi/ipmi_ssif.c
> +++ b/drivers/char/ipmi/ipmi_ssif.c
> @@ -1683,7 +1683,6 @@ static int ssif_probe(struct i2c_client *client, const struct i2c_device_id *id)
>  	u8		  slave_addr = 0;
>  	struct ssif_addr_info *addr_info = NULL;
>  
> -	mutex_lock(&ssif_infos_mutex);
>  	resp = kmalloc(IPMI_MAX_MSG_LENGTH, GFP_KERNEL);
>  	if (!resp)
>  		return -ENOMEM;
> @@ -1694,6 +1693,8 @@ static int ssif_probe(struct i2c_client *client, const struct i2c_device_id *id)
>  		return -ENOMEM;
>  	}
>  
> +	mutex_lock(&ssif_infos_mutex);
> +
>  	if (!check_acpi(ssif_info, &client->dev)) {
>  		addr_info = ssif_info_find(client->addr, client->adapter->name,
>  					   true);
> -- 
> 2.20.1
> 
