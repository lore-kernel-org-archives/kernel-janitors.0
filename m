From: "Koul, Vinod" <vinod.koul@intel.com>
Date: Fri, 15 Oct 2010 04:35:57 +0000
Subject: RE: [patch 1/2] Staging: intel_sst: return -EFAULT if
Message-Id: <438BB0150E931F4B9CE701519A44630104BE763340@bgsmsx502.gar.corp.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20101015034407.GI6614@bicker>
In-Reply-To: <20101015034407.GI6614@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

 
> copy_to_user() returns the number of bytes remaining to be copied but we
> want to return an error code.  And that error code is -EFAULT not -EIO.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> 
> diff --git a/drivers/staging/intel_sst/intel_sst_app_interface.c
> b/drivers/staging/intel_sst/intel_sst_app_interface.c
> index baf0ddc..5ead4d1 100644
> --- a/drivers/staging/intel_sst/intel_sst_app_interface.c
> +++ b/drivers/staging/intel_sst/intel_sst_app_interface.c
> @@ -865,6 +865,8 @@ long intel_sst_ioctl(struct file *file_ptr, unsigned int cmd,
> unsigned long arg)
>  				str_info->src = SST_DRV;
>  				retval = copy_to_user(&str_param->stream_id,
>  						&retval, sizeof(__u32));
> +				if (retval)
> +					retval = -EFAULT;
>  			} else {
>  				if (retval = -SST_ERR_INVALID_PARAMS)
>  					retval = -EINVAL;
> @@ -938,7 +940,7 @@ long intel_sst_ioctl(struct file *file_ptr, unsigned int cmd,
> unsigned long arg)
>  		retval = copy_to_user((struct snd_sst_vol *)arg,
>  						&get_vol, sizeof(get_vol));
>  		if (retval) {
> -			retval = -EIO;
> +			retval = -EFAULT;
>  			break;
>  		}
>  		/*sst_print_get_vol_info(str_id, &get_vol);*/
Since retval is not used and value assigned is supposed to be -EFAULT,
how about this?
	if(copy_to_user())
			return -EIO;

~Vinod
