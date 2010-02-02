From: Mauro Carvalho Chehab <mchehab@infradead.org>
Date: Tue, 02 Feb 2010 15:19:15 +0000
Subject: Re: [PATCH 3/8] drivers/media/video/hdpvr: introduce missing kfree
Message-Id: <4B684273.6040500@infradead.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0909111821180.10552@pc-004.diku.dk> <20090916111325.GA14900@aniel.lan>
In-Reply-To: <20090916111325.GA14900@aniel.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Janne Grunau <j@jannau.net>
Cc: Julia Lawall <julia@diku.dk>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi Janne,

Janne Grunau wrote:
> On Fri, Sep 11, 2009 at 06:21:35PM +0200, Julia Lawall wrote:
>> Error handling code following a kzalloc should free the allocated data.
> 
> Thanks for the report. I'll commit a different patch which adds the buffer
> to the buffer list as soon it is allocated. The hdpvr_free_buffers() in the
> error handling code will clean it up then. See below:

Any news about this subject? The current upstream code still misses the change bellow

> 
> diff --git a/linux/drivers/media/video/hdpvr/hdpvr-video.c b/linux/drivers/media/video/hdpvr/hdpvr-video.c
> --- a/linux/drivers/media/video/hdpvr/hdpvr-video.c
> +++ b/linux/drivers/media/video/hdpvr/hdpvr-video.c
> @@ -134,6 +134,8 @@
>                         v4l2_err(&dev->v4l2_dev, "cannot allocate buffer\n");
>                         goto exit;
>                 }
> +               list_add_tail(&buf->buff_list, &dev->free_buff_list);
> +
>                 buf->dev = dev;
> 
>                 urb = usb_alloc_urb(0, GFP_KERNEL);
> @@ -158,7 +160,6 @@
>                                   hdpvr_read_bulk_callback, buf);
> 
>                 buf->status = BUFSTAT_AVAILABLE;
> -               list_add_tail(&buf->buff_list, &dev->free_buff_list);
>         }
>         return 0;
>  exit:
> --
> To unsubscribe from this list: send the line "unsubscribe linux-media" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


-- 

Cheers,
Mauro
