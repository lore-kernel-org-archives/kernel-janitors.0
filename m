From: Dan Carpenter <error27@gmail.com>
Date: Wed, 06 Oct 2010 04:48:47 +0000
Subject: Re: [PATCH 07/28] Staging: comedi: drivers.c: Edit file so that
Message-Id: <20101006044847.GC5409@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1286326843-6170-1-git-send-email-tdent48227@gmail.com> <1286326843-6170-7-git-send-email-tdent48227@gmail.com>
In-Reply-To: <1286326843-6170-7-git-send-email-tdent48227@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tracey Dent <tdent48227@gmail.com>
Cc: greg@kroah.com, abbotti@mev.co.uk, fmhess@users.sourceforge.net, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Oct 05, 2010 at 09:00:22PM -0400, Tracey Dent wrote:
> @@ -118,7 +118,8 @@ int comedi_device_attach(struct comedi_device *dev, struct comedi_devconfig *it)
>  	for (driv = comedi_drivers; driv; driv = driv->next) {
>  		if (!try_module_get(driv->module)) {
>  			printk
> -			    (KERN_INFO "comedi: failed to increment module count, skipping\n");
> +			    (KERN_INFO "comedi: failed to increment	\
> +					module count, skipping\n");

This screws up the output that gets printed for the user.  It happens
again below several times.

Also it's best to not break up string literals across lines because then
someone can't do a:  grep "failed to increment module count".  For these
cases it's better to go over 80 characters and make grep work.

regards,
dan carpenter

>  			continue;
>  		}
>  		if (driv->num_names) {
> @@ -206,8 +207,9 @@ int comedi_driver_unregister(struct comedi_driver *driver)
>  		if (dev->attached && dev->driver = driver) {
>  			if (dev->use_count)
>  				printk
> -				    (KERN_WARNING "BUG! detaching device with use_count=%d\n",
> -				     dev->use_count);
> +				    (KERN_WARNING "BUG! detaching device     \
> +							with use_count=%d\n",
> +							dev->use_count);
>  			comedi_device_detach(dev);
>  		}
>  		mutex_unlock(&dev->mutex);
> @@ -647,7 +649,8 @@ unsigned comedi_buf_write_free(struct comedi_async *async, unsigned int nbytes)
>  	if ((int)(async->buf_write_count + nbytes -
>  		  async->buf_write_alloc_count) > 0) {
>  		printk
> -		    (KERN_INFO "comedi: attempted to write-free more bytes than have been write-allocated.\n");
> +		    (KERN_INFO "comedi: attempted to write-free more	\
> +				bytes than have been write-allocated.\n");
>  		nbytes = async->buf_write_alloc_count - async->buf_write_count;
>  	}
>  	async->buf_write_count += nbytes;
> -- 
> 1.7.3.1.50.g1e633
> 
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
