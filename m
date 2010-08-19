From: Mike Isely <isely@isely.net>
Date: Thu, 19 Aug 2010 14:07:42 +0000
Subject: Re: [patch] V4L/DVB: pvrusb2: remove unneeded NULL checks
Message-Id: <alpine.DEB.1.10.1008190905480.17258@cnc.isely.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100819095004.GN645@bicker>
In-Reply-To: <20100819095004.GN645@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@infradead.org>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org, Mike Isely <isely@isely.net>


Based on the surrounding code (the unconditional dereference), I agree 
that this particular bit of coding paranoia is not doing much good.

Acked-by: Mike Isely <isely@pobox.com>

On Thu, 19 Aug 2010, Dan Carpenter wrote:

> We dereference "maskptr" unconditionally at the start of the function
> and also inside the call to parse_tlist() towards the end of the
> function.  This function is called from store_val_any() and it always
> passes a non-NULL pointer. 
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> 
> diff --git a/drivers/media/video/pvrusb2/pvrusb2-ctrl.c b/drivers/media/video/pvrusb2/pvrusb2-ctrl.c
> index 1b992b8..55ea914 100644
> --- a/drivers/media/video/pvrusb2/pvrusb2-ctrl.c
> +++ b/drivers/media/video/pvrusb2/pvrusb2-ctrl.c
> @@ -513,7 +513,7 @@ int pvr2_ctrl_sym_to_value(struct pvr2_ctrl *cptr,
>  			if (ret >= 0) {
>  				ret = pvr2_ctrl_range_check(cptr,*valptr);
>  			}
> -			if (maskptr) *maskptr = ~0;
> +			*maskptr = ~0;
>  		} else if (cptr->info->type = pvr2_ctl_bool) {
>  			ret = parse_token(ptr,len,valptr,boolNames,
>  					  ARRAY_SIZE(boolNames));
> @@ -522,7 +522,7 @@ int pvr2_ctrl_sym_to_value(struct pvr2_ctrl *cptr,
>  			} else if (ret = 0) {
>  				*valptr = (*valptr & 1) ? !0 : 0;
>  			}
> -			if (maskptr) *maskptr = 1;
> +			*maskptr = 1;
>  		} else if (cptr->info->type = pvr2_ctl_enum) {
>  			ret = parse_token(
>  				ptr,len,valptr,
> @@ -531,7 +531,7 @@ int pvr2_ctrl_sym_to_value(struct pvr2_ctrl *cptr,
>  			if (ret >= 0) {
>  				ret = pvr2_ctrl_range_check(cptr,*valptr);
>  			}
> -			if (maskptr) *maskptr = ~0;
> +			*maskptr = ~0;
>  		} else if (cptr->info->type = pvr2_ctl_bitmask) {
>  			ret = parse_tlist(
>  				ptr,len,maskptr,valptr,
> 

-- 

Mike Isely
isely @ isely (dot) net
PGP: 03 54 43 4D 75 E5 CC 92 71 16 01 E2 B5 F5 C1 E8
