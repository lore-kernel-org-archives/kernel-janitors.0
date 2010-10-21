From: "Koul, Vinod" <vinod.koul@intel.com>
Date: Thu, 21 Oct 2010 14:27:45 +0000
Subject: RE: [patch 2/3] Staging: sst: more dereferencing user pointers
Message-Id: <438BB0150E931F4B9CE701519A44630104BE8125B6@bgsmsx502.gar.corp.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20101019055704.GD5839@bicker>
In-Reply-To: <20101019055704.GD5839@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

>  	case _IOC_NR(SNDRV_SST_STREAM_SET_PARAMS): {
> -		struct snd_sst_params *str_param = (struct snd_sst_params *)arg;
> +		struct snd_sst_params str_param;
Now this is a struct...
> 
[snip]
> +
>  		if (!str_id) {
So this becomes bogus check, can be removed :-)
> 
> +				retval = copy_to_user(dest, &retval, sizeof(__u32));
>  				if (retval)
>  					retval = -EFAULT;
Trivial but this can be changed to 
				if (copy_to_user())
					retval = -EFAULT;	

Overall its good, tested it as well,
just bogus if() needs to be removed

~Vinod















