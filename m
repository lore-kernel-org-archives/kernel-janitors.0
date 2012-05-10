From: walter harms <wharms@bfs.de>
Date: Thu, 10 May 2012 15:33:55 +0000
Subject: Re: [patch 1/2] Staging: ipack: returning a freed pointer
Message-Id: <4FABDFE3.9060300@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120510151836.GA31515@elgon.mountain>
In-Reply-To: <20120510151836.GA31515@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org



Am 10.05.2012 17:18, schrieb Dan Carpenter:
> If ipack_device_register() returns an error, then we returned a freed
> pointer.  The caller doesn't use it, but it means we return success to
> the user instead of returning an error code.
> 
> I kind of rewrote the error handling in this function as a cleanup.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/staging/ipack/bridges/tpci200.c b/drivers/staging/ipack/bridges/tpci200.c
> index 6aeb660..ab6ea0a 100644
> --- a/drivers/staging/ipack/bridges/tpci200.c
> +++ b/drivers/staging/ipack/bridges/tpci200.c
> @@ -372,7 +372,7 @@ static struct ipack_device *tpci200_slot_register(const char *board_name,
>  						  unsigned int slot_position)
>  {
>  	int found = 0;
> -	struct ipack_device  *dev = NULL;
> +	struct ipack_device  *dev;
>  	struct tpci200_board *tpci200;
>  
>  	list_for_each_entry(tpci200, &tpci200_list, list) {
> @@ -390,16 +390,16 @@ static struct ipack_device *tpci200_slot_register(const char *board_name,
>  	if (slot_position >= TPCI200_NB_SLOT) {
>  		pr_info("Slot [%s %d:%d] doesn't exist!\n",
>  			TPCI200_SHORTNAME, tpci200_number, slot_position);
> -		goto out;
> +		return NULL;
>  	}
>  
>  	if (mutex_lock_interruptible(&tpci200->mutex))
> -		goto out;
> +		return NULL;
>  
>  	if (tpci200->slots[slot_position].dev != NULL) {
>  		pr_err("Slot [%s %d:%d] already installed !\n",
>  		       TPCI200_SHORTNAME, tpci200_number, slot_position);
> -		goto out_unlock;
> +		goto err_unlock;
>  	}
>  
>  	dev = kzalloc(sizeof(struct ipack_device), GFP_KERNEL);
> @@ -407,7 +407,7 @@ static struct ipack_device *tpci200_slot_register(const char *board_name,
>  		pr_info("Slot [%s %d:%d] Unable to allocate memory for new slot !\n",
>  			TPCI200_SHORTNAME,
>  			tpci200_number, slot_position);
> -		goto out_unlock;
> +		goto err_unlock;
>  	}
>  
>  	if (size > IPACK_BOARD_NAME_SIZE) {

I can not see the rest, is "size" handelt correct here ?
or is size >= IPACK_BOARD_NAME_SIZE intended ?

re,
 wh


> @@ -440,15 +440,18 @@ static struct ipack_device *tpci200_slot_register(const char *board_name,
>  	dev->ops = &tpci200_bus_ops;
>  	tpci200->slots[slot_position].dev = dev;
>  
> -	if (ipack_device_register(dev) < 0) {
> -		tpci200_slot_unregister(dev);
> -		kfree(dev);
> -	}
> +	if (ipack_device_register(dev) < 0)
> +		goto err_unregister;
>  
> -out_unlock:
>  	mutex_unlock(&tpci200->mutex);
> -out:
>  	return dev;
> +
> +err_unregister:
> +	tpci200_slot_unregister(dev);
> +	kfree(dev);
> +err_unlock:
> +	mutex_unlock(&tpci200->mutex);
> +	return NULL;
>  }
>  
>  static ssize_t tpci200_store_board(struct device *pdev, const char *buf,
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> 
