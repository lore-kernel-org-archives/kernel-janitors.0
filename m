From: Walter Harms <wharms@bfs.de>
Date: Wed, 02 May 2018 12:23:42 +0000
Subject: Re: [PATCH][media-next][V2] media: davinci_vpfe: fix memory leaks of params
Message-Id: <1316619188.31616.1525263822505@ox-groupware.bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180502114800.28004-1-colin.king@canonical.com>
In-Reply-To: <20180502114800.28004-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Am 02.05.2018 13:48, schrieb Colin King:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There are memory leaks of params; when copy_to_user fails and also
> the exit via the label 'error'. Also, there is a bogos memory allocation
> check on pointer 'to' when memory allocation fails on params.
> 
> Fix this by kfree'ing params in error exit path and jumping to this on
> the copy_to_user failure path.  Also check the to see if the allocation
> of params fails and remove the bogus null pointer checks on pointer 'to'.
> 
> Also explicitly return 0 on success rather than rval.
> 
> Detected by CoverityScan, CID#1467966 ("Resource leak")
> 
> Fixes: da43b6ccadcf ("[media] davinci: vpfe: dm365: add IPIPE support for
> media controller driver")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
> 
> V2: Add checks on allocation of params.  Remove bogus checks on
>     pointer 'to'. Explicitly return 0 on success. Thanks to
>     Dan Carpenter for the suggested improvements.
> 

Hi Colin,
the code made me thinking a bit as it seems bit complicated. 
I did not dive into the full code only the patch so i may have
some false assumptions.

> ---
>  drivers/staging/media/davinci_vpfe/dm365_ipipe.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/media/davinci_vpfe/dm365_ipipe.c
> b/drivers/staging/media/davinci_vpfe/dm365_ipipe.c
> index 95942768639c..b135e38a18b3 100644
> --- a/drivers/staging/media/davinci_vpfe/dm365_ipipe.c
> +++ b/drivers/staging/media/davinci_vpfe/dm365_ipipe.c
> @@ -1252,12 +1252,12 @@ static const struct ipipe_module_if
> ipipe_modules[VPFE_IPIPE_MAX_MODULES] = {
>  static int ipipe_s_config(struct v4l2_subdev *sd, struct vpfe_ipipe_config
> *cfg)
>  {
>  	struct vpfe_ipipe_device *ipipe = v4l2_get_subdevdata(sd);
> +	struct ipipe_module_params *params;
>  	unsigned int i;
>  	int rval = 0;
>  
>  	for (i = 0; i < ARRAY_SIZE(ipipe_modules); i++) {
>  		const struct ipipe_module_if *module_if;
> -		struct ipipe_module_params *params;
>  		void *from, *to;
>  		size_t size;
>  
> @@ -1269,25 +1269,31 @@ static int ipipe_s_config(struct v4l2_subdev *sd,
> struct vpfe_ipipe_config *cfg)
>  
>  		params = kmalloc(sizeof(struct ipipe_module_params),
>  				 GFP_KERNEL);
> +		if (!params) {
> +			rval = -ENOMEM;
> +			goto error;
> +		}

A single exit is nice but maybe a 
  return -ENOMEM;

is ok here.

>  		to = (void *)params + module_if->param_offset;
>  		size = module_if->param_size;
>  
  the if (from) make no sense if size = 0
                if (size = 0) {
                      rval = 0;
                      goto error;
                 }

the following code reduces to
                  if (from)
                      ....
                  else
                      ....

sorry for beeing late,
 re,
 wh

> -		if (to && from && size) {
> +		if (from && size) {
>  			if (copy_from_user(to, (void __user *)from, size)) {
>  				rval = -EFAULT;
> -				break;
> +				goto error;
>  			}
>  			rval = module_if->set(ipipe, to);
>  			if (rval)
>  				goto error;
> -		} else if (to && !from && size) {
> +		} else if (!from && size) {
>  			rval = module_if->set(ipipe, NULL);
>  			if (rval)
>  				goto error;
>  		}
>  		kfree(params);
>  	}
> +	return 0;
>  error:
> +	kfree(params);
>  	return rval;
>  }
>  
