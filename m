From: Peter Chen <peter.chen@nxp.com>
Date: Wed, 30 Oct 2019 08:11:12 +0000
Subject: Re: [PATCH -next] usb: gadget: configfs: Fix missing spin_lock_init()
Message-Id: <20191030081101.GF26815@b29397-desktop>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191030034046.188808-1-weiyongjun1@huawei.com>
In-Reply-To: <20191030034046.188808-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

On 19-10-30 03:40:46, Wei Yongjun wrote:
> The driver allocates the spinlock but not initialize it.
> Use spin_lock_init() on it to initialize it correctly.
> 
> This is detected by Coccinelle semantic patch.
> 
> Fixes: 1a1c851bbd70 ("usb: gadget: configfs: fix concurrent issue between composite APIs")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/usb/gadget/configfs.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/usb/gadget/configfs.c b/drivers/usb/gadget/configfs.c
> index 33852c2b29d1..ab9ac48a751a 100644
> --- a/drivers/usb/gadget/configfs.c
> +++ b/drivers/usb/gadget/configfs.c
> @@ -1544,6 +1544,7 @@ static struct config_group *gadgets_make(
>  	gi->composite.resume = NULL;
>  	gi->composite.max_speed = USB_SPEED_SUPER;
>  
> +	spin_lock_init(&gi->spinlock);
>  	mutex_init(&gi->lock);
>  	INIT_LIST_HEAD(&gi->string_list);
>  	INIT_LIST_HEAD(&gi->available_func);
> 

Reviewed-by: Peter Chen <peter.chen@nxp.com>

-- 

Thanks,
Peter Chen
