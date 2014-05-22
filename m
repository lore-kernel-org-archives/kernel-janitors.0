From: Andrzej Pietrasiewicz <andrzej.p@samsung.com>
Date: Thu, 22 May 2014 05:16:13 +0000
Subject: Re: [patch] usb: gadget: f_rndis: fix an error code on allocation failure
Message-Id: <537D881D.6050408@samsung.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140521122655.GC23396@mwanda>
In-Reply-To: <20140521122655.GC23396@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

W dniu 21.05.2014 14:26, Dan Carpenter pisze:
> This should be return -ENOMEM.  The current code returns successs.
>
> Fixes: de7a8d2d534f ('usb: gadget: f_rndis: OS descriptors support')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>

Acked-by: Andrzej Pietrasiewicz <andrzej.p@samsung.com>

> diff --git a/drivers/usb/gadget/f_rndis.c b/drivers/usb/gadget/f_rndis.c
> index eed3ad8..31274f7 100644
> --- a/drivers/usb/gadget/f_rndis.c
> +++ b/drivers/usb/gadget/f_rndis.c
> @@ -687,7 +687,7 @@ rndis_bind(struct usb_configuration *c, struct usb_function *f)
>   		f->os_desc_table = kzalloc(sizeof(*f->os_desc_table),
>   					   GFP_KERNEL);
>   		if (!f->os_desc_table)
> -			return PTR_ERR(f->os_desc_table);
> +			return -ENOMEM;
>   		f->os_desc_n = 1;
>   		f->os_desc_table[0].os_desc = &rndis_opts->rndis_os_desc;
>   	}
> --
> To unsubscribe from this list: send the line "unsubscribe linux-usb" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

