From: Julia Lawall <julia.lawall@lip6.fr>
Date: Thu, 05 Mar 2015 10:28:37 +0000
Subject: Re: [PATCH 1/1] staging: io: Remove unnecessary OOM message
Message-Id: <alpine.DEB.2.10.1503050528080.2601@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150305102316.GA4389@sloth>
In-Reply-To: <20150305102316.GA4389@sloth>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Quentin Lambert <lambert.quentin@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel-janitors@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

It's i2o, not io, and it is on the way out of the kernel.

julia

On Thu, 5 Mar 2015, Quentin Lambert wrote:

> This patch reduces the kernel size by removing error messages that duplicate
> the normal OOM message.
>
> Signed-off-by: Quentin Lambert <lambert.quentin@gmail.com>
> ---
>  drivers/staging/i2o/i2o_block.c  |  1 -
>  drivers/staging/i2o/i2o_config.c |  7 +------
>  drivers/staging/i2o/iop.c        | 10 ++--------
>  3 files changed, 3 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/staging/i2o/i2o_block.c b/drivers/staging/i2o/i2o_block.c
> index 0a13c64..a26e2a0 100644
> --- a/drivers/staging/i2o/i2o_block.c
> +++ b/drivers/staging/i2o/i2o_block.c
> @@ -965,7 +965,6 @@ static struct i2o_block_device *i2o_block_device_alloc(void)
>
>  	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
>  	if (!dev) {
> -		osm_err("Insufficient memory to allocate I2O Block disk.\n");
>  		rc = -ENOMEM;
>  		goto exit;
>  	}
> diff --git a/drivers/staging/i2o/i2o_config.c b/drivers/staging/i2o/i2o_config.c
> index 5748663..29e90e2 100644
> --- a/drivers/staging/i2o/i2o_config.c
> +++ b/drivers/staging/i2o/i2o_config.c
> @@ -591,11 +591,8 @@ static int i2o_cfg_passthru32(struct file *file, unsigned cmnd,
>
>  	rcode = -ENOMEM;
>  	reply = kzalloc(reply_size, GFP_KERNEL);
> -	if (!reply) {
> -		printk(KERN_WARNING "%s: Could not allocate reply buffer\n",
> -		       c->name);
> +	if (!reply)
>  		goto out;
> -	}
>
>  	sg_offset = (msg->u.head[0] >> 4) & 0x0f;
>
> @@ -833,8 +830,6 @@ static int i2o_cfg_passthru(unsigned long arg)
>
>  	reply = kzalloc(reply_size, GFP_KERNEL);
>  	if (!reply) {
> -		printk(KERN_WARNING "%s: Could not allocate reply buffer\n",
> -		       c->name);
>  		rcode = -ENOMEM;
>  		goto out;
>  	}
> diff --git a/drivers/staging/i2o/iop.c b/drivers/staging/i2o/iop.c
> index 52334fc..47c785c 100644
> --- a/drivers/staging/i2o/iop.c
> +++ b/drivers/staging/i2o/iop.c
> @@ -99,11 +99,8 @@ u32 i2o_cntxt_list_add(struct i2o_controller * c, void *ptr)
>  			c->name);
>
>  	entry = kmalloc(sizeof(*entry), GFP_ATOMIC);
> -	if (!entry) {
> -		osm_err("%s: Could not allocate memory for context list element"
> -			"\n", c->name);
> +	if (!entry)
>  		return 0;
> -	}
>
>  	entry->ptr = ptr;
>  	entry->timestamp = jiffies;
> @@ -1047,11 +1044,8 @@ struct i2o_controller *i2o_iop_alloc(void)
>  	char poolname[32];
>
>  	c = kzalloc(sizeof(*c), GFP_KERNEL);
> -	if (!c) {
> -		osm_err("i2o: Insufficient memory to allocate a I2O controller."
> -			"\n");
> +	if (!c)
>  		return ERR_PTR(-ENOMEM);
> -	}
>
>  	c->unit = unit++;
>  	sprintf(c->name, "iop%d", c->unit);
> --
> 1.9.1
>
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
