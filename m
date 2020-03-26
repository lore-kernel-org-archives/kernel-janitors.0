From: Peter Chen <peter.chen@nxp.com>
Date: Thu, 26 Mar 2020 11:46:42 +0000
Subject: Re: [PATCH] usb: cdns3: make signed 1 bit bitfields unsigned
Message-Id: <20200326114703.GC23632@b29397-desktop>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200325125041.94769-1-colin.king@canonical.com>
In-Reply-To: <20200325125041.94769-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sekhar Nori <nsekhar@ti.com>, Roger Quadros <rogerq@ti.com>, Felipe Balbi <felipe.balbi@linux.intel.com>, Pawel Laszczak <pawell@cadence.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On 20-03-25 12:50:41, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The signed 1 bit bitfields should be unsigned, so make them unsigned.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/usb/cdns3/cdns3-ti.c | 4 ++--
>  drivers/usb/cdns3/gadget.h   | 6 +++---
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/usb/cdns3/cdns3-ti.c b/drivers/usb/cdns3/cdns3-ti.c
> index c6a79ca15858..5685ba11480b 100644
> --- a/drivers/usb/cdns3/cdns3-ti.c
> +++ b/drivers/usb/cdns3/cdns3-ti.c
> @@ -52,8 +52,8 @@ enum modestrap_mode { USBSS_MODESTRAP_MODE_NONE,
>  struct cdns_ti {
>  	struct device *dev;
>  	void __iomem *usbss;
> -	int usb2_only:1;
> -	int vbus_divider:1;
> +	unsigned usb2_only:1;
> +	unsigned vbus_divider:1;
>  	struct clk *usb2_refclk;
>  	struct clk *lpm_clk;
>  };
> diff --git a/drivers/usb/cdns3/gadget.h b/drivers/usb/cdns3/gadget.h
> index f003a7801872..bf2828e4df2c 100644
> --- a/drivers/usb/cdns3/gadget.h
> +++ b/drivers/usb/cdns3/gadget.h
> @@ -1199,7 +1199,7 @@ struct cdns3_aligned_buf {
>  	void			*buf;
>  	dma_addr_t		dma;
>  	u32			size;
> -	int			in_use:1;
> +	unsigned		in_use:1;
>  	struct list_head	list;
>  };
>  
> @@ -1308,8 +1308,8 @@ struct cdns3_device {
>  	unsigned			u2_allowed:1;
>  	unsigned			is_selfpowered:1;
>  	unsigned			setup_pending:1;
> -	int				hw_configured_flag:1;
> -	int				wake_up_flag:1;
> +	unsigned			hw_configured_flag:1;
> +	unsigned			wake_up_flag:1;
>  	unsigned			status_completion_no_call:1;
>  	unsigned			using_streams:1;
>  	int				out_mem_is_allocated;
> -- 

Reviewed-by: Peter Chen <peter.chen@nxp.com>

-- 

Thanks,
Peter Chen
