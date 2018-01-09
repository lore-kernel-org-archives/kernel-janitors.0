From: Mathias Nyman <mathias.nyman@linux.intel.com>
Date: Tue, 09 Jan 2018 12:55:08 +0000
Subject: Re: [PATCH] usb: xhci: Clean up error code in xhci_dbc_tty_register_device()
Message-Id: <d1820126-fe02-8097-09fa-c343377c9102@linux.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180109094105.l3dtv4jy36syu55s@mwanda>
In-Reply-To: <20180109094105.l3dtv4jy36syu55s@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Mathias Nyman <mathias.nyman@intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org

On 09.01.2018 11:41, Dan Carpenter wrote:
> tty_port_register_device() returns error pointers on error, never NULL.
> The IS_ERR_OR_NULL() function returns either 1 or 0 so it means we
> return 1 on error instead of a proper error code.  The caller only
> checks for zero vs non-zero so this doesn't affect runtime.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/usb/host/xhci-dbgtty.c b/drivers/usb/host/xhci-dbgtty.c
> index 8d47b6fbf973..6f534b6decef 100644
> --- a/drivers/usb/host/xhci-dbgtty.c
> +++ b/drivers/usb/host/xhci-dbgtty.c
> @@ -443,9 +443,10 @@ int xhci_dbc_tty_register_device(struct xhci_hcd *xhci)
>   	xhci_dbc_tty_init_port(xhci, port);
>   	tty_dev = tty_port_register_device(&port->port,
>   					   dbc_tty_driver, 0, NULL);
> -	ret = IS_ERR_OR_NULL(tty_dev);
> -	if (ret)
> +	if (IS_ERR(tty_dev)) {
> +		ret = PTR_ERR(tty_dev);
>   		goto register_fail;
> +	}
>   
>   	ret = kfifo_alloc(&port->write_fifo, DBC_WRITE_BUF_SIZE, GFP_KERNEL);
>   	if (ret)
> --
> To unsubscribe from this list: send the line "unsubscribe linux-usb" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

Thanks, adding to queue, I'll send it forward after 4.16-rc1

-Mathias
