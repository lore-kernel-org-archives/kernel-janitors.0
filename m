From: Andrzej Pietrasiewicz <andrzej.p@samsung.com>
Date: Fri, 16 Jan 2015 11:19:30 +0000
Subject: Re: [patch 6/6] usb: gadget: uvc: cleanup UVCG_FRAME_ATTR macro
Message-Id: <54B8F3C2.6080408@samsung.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150114210635.GF23203@mwanda>
In-Reply-To: <20150114210635.GF23203@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

W dniu 14.01.2015 o 22:06, Dan Carpenter pisze:
> 1) Change "conv" an "vnoc" to "to_cpu_endian" to "to_little_endian".
> 2) No need to check the "limit" because that is already handled in
>     kstrtoXX so delete that parameter along with the check.
> 3) By using a "bits" parameter, we can combine the "uxx" parameter and
>     the "str2u" parameters.
> 4) The kstrtou##bits() conversion does not need to be done under the
>     mutex so move it to the start of the function.
> 5) Change the name of "identity_conv" to "noop_conversion".
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>

Acked-by: Andrzej Pietrasiewicz <andrzej.p@samsung.com>

  ---
> This file has a couple pages of Sparse endian warnings.
> http://lwn.net/Articles/205624/
> It's hard to review the static checker warnings when there are so many.
>
> diff --git a/drivers/usb/gadget/function/uvc_configfs.c b/drivers/usb/gadget/function/uvc_configfs.c
> index a0443a2..87beb8c 100644
> --- a/drivers/usb/gadget/function/uvc_configfs.c
> +++ b/drivers/usb/gadget/function/uvc_configfs.c
> @@ -1032,7 +1032,7 @@ static struct configfs_item_operations uvcg_frame_item_ops = {
>   	.store_attribute	= uvcg_frame_attr_store,
>   };
>
> -#define UVCG_FRAME_ATTR(cname, aname, conv, str2u, uxx, vnoc, limit)	\
> +#define UVCG_FRAME_ATTR(cname, aname, to_cpu_endian, to_little_endian, bits) \
>   static ssize_t uvcg_frame_##cname##_show(struct uvcg_frame *f, char *page)\
>   {									\
>   	struct f_uvc_opts *opts;					\
> @@ -1046,7 +1046,7 @@ static ssize_t uvcg_frame_##cname##_show(struct uvcg_frame *f, char *page)\
>   	opts = to_f_uvc_opts(opts_item);				\
>   									\
>   	mutex_lock(&opts->lock);					\
> -	result = sprintf(page, "%d\n", conv(f->frame.cname));		\
> +	result = sprintf(page, "%d\n", to_cpu_endian(f->frame.cname));	\
>   	mutex_unlock(&opts->lock);					\
>   									\
>   	mutex_unlock(su_mutex);						\
> @@ -1061,7 +1061,11 @@ static ssize_t  uvcg_frame_##cname##_store(struct uvcg_frame *f,	\
>   	struct uvcg_format *fmt;					\
>   	struct mutex *su_mutex = &f->item.ci_group->cg_subsys->su_mutex;\
>   	int ret;							\
> -	uxx num;							\
> +	u##bits num;							\
> +									\
> +	ret = kstrtou##bits(page, 0, &num);				\
> +	if (ret)							\
> +		return ret;						\
>   									\
>   	mutex_lock(su_mutex); /* for navigating configfs hierarchy */	\
>   									\
> @@ -1075,15 +1079,7 @@ static ssize_t  uvcg_frame_##cname##_store(struct uvcg_frame *f,	\
>   		goto end;						\
>   	}								\
>   									\
> -	ret = str2u(page, 0, &num);					\
> -	if (ret)							\
> -		goto end;						\
> -									\
> -	if (num > limit) {						\
> -		ret = -EINVAL;						\
> -		goto end;						\
> -	}								\
> -	f->frame.cname = vnoc(num);					\
> +	f->frame.cname = to_little_endian(num);				\
>   	ret = len;							\
>   end:									\
>   	mutex_unlock(&opts->lock);					\
> @@ -1097,24 +1093,20 @@ static struct uvcg_frame_attribute					\
>   			uvcg_frame_##cname##_show,			\
>   			uvcg_frame_##cname##_store)
>
> -#define identity_conv(x) (x)
> +#define noop_conversion(x) (x)
>
> -UVCG_FRAME_ATTR(bm_capabilities, bmCapabilities, identity_conv, kstrtou8, u8,
> -		identity_conv, 0xFF);
> -UVCG_FRAME_ATTR(w_width, wWidth, le16_to_cpu, kstrtou16, u16, cpu_to_le16,
> -		0xFFFF);
> -UVCG_FRAME_ATTR(w_height, wHeight, le16_to_cpu, kstrtou16, u16, cpu_to_le16,
> -		0xFFFF);
> -UVCG_FRAME_ATTR(dw_min_bit_rate, dwMinBitRate, le32_to_cpu, kstrtou32, u32,
> -		cpu_to_le32, 0xFFFFFFFF);
> -UVCG_FRAME_ATTR(dw_max_bit_rate, dwMaxBitRate, le32_to_cpu, kstrtou32, u32,
> -		cpu_to_le32, 0xFFFFFFFF);
> +UVCG_FRAME_ATTR(bm_capabilities, bmCapabilities, noop_conversion,
> +		noop_conversion, 8);
> +UVCG_FRAME_ATTR(w_width, wWidth, le16_to_cpu, cpu_to_le16, 16);
> +UVCG_FRAME_ATTR(w_height, wHeight, le16_to_cpu, cpu_to_le16, 16);
> +UVCG_FRAME_ATTR(dw_min_bit_rate, dwMinBitRate, le32_to_cpu, cpu_to_le32, 32);
> +UVCG_FRAME_ATTR(dw_max_bit_rate, dwMaxBitRate, le32_to_cpu, cpu_to_le32, 32);
>   UVCG_FRAME_ATTR(dw_max_video_frame_buffer_size, dwMaxVideoFrameBufferSize,
> -		le32_to_cpu, kstrtou32, u32, cpu_to_le32, 0xFFFFFFFF);
> +		le32_to_cpu, cpu_to_le32, 32);
>   UVCG_FRAME_ATTR(dw_default_frame_interval, dwDefaultFrameInterval,
> -		le32_to_cpu, kstrtou32, u32, cpu_to_le32, 0xFFFFFFFF);
> +		le32_to_cpu, cpu_to_le32, 32);
>
> -#undef identity_conv
> +#undef noop_conversion
>
>   #undef UVCG_FRAME_ATTR
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-usb" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

