From: Alan Stern <stern@rowland.harvard.edu>
Date: Wed, 06 May 2020 14:12:08 +0000
Subject: Re: [PATCH -next] USB: ohci-sm501: fix error return code in ohci_hcd_sm501_drv_probe()
Message-Id: <Pine.LNX.4.44L0.2005061010480.13334-100000@netrider.rowland.org>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20200506135625.106910-1-weiyongjun1@huawei.com>
References: <20200506135625.106910-1-weiyongjun1@huawei.com>
In-Reply-To: <20200506135625.106910-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Laurentiu Tudor <laurentiu.tudor@nxp.com>, linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, 6 May 2020, Wei Yongjun wrote:

> Fix to return a negative error code from the error handling
> case instead of 0, as done elsewhere in this function.
> 
> Fixes: 7d9e6f5aebe8 ("usb: host: ohci-sm501: init genalloc for local memory")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/usb/host/ohci-sm501.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/host/ohci-sm501.c b/drivers/usb/host/ohci-sm501.c
> index c158cda9e4b9..cff965240327 100644
> --- a/drivers/usb/host/ohci-sm501.c
> +++ b/drivers/usb/host/ohci-sm501.c
> @@ -157,9 +157,10 @@ static int ohci_hcd_sm501_drv_probe(struct platform_device *pdev)
>  	 * the call to usb_hcd_setup_local_mem() below does just that.
>  	 */
>  
> -	if (usb_hcd_setup_local_mem(hcd, mem->start,
> -				    mem->start - mem->parent->start,
> -				    resource_size(mem)) < 0)
> +	retval = usb_hcd_setup_local_mem(hcd, mem->start,
> +					 mem->start - mem->parent->start,
> +					 resource_size(mem));
> +	if (retval < 0)
>  		goto err5;
>  	retval = usb_add_hcd(hcd, irq, IRQF_SHARED);
>  	if (retval)

Acked-by: Alan Stern <stern@rowland.harvard.edu>

Thanks for noticing and fixing this.

Alan Stern
