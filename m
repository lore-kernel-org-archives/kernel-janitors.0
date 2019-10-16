From: maowenan <maowenan@huawei.com>
Date: Wed, 16 Oct 2019 00:54:53 +0000
Subject: Re: [PATCH -next] usb: typec: add dependency for TYPEC_HD3SS3220
Message-Id: <ff1837bd-d6eb-a296-f7d9-f2988d5d2256@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191009014707.38716-1-maowenan@huawei.com>
In-Reply-To: <20191009014707.38716-1-maowenan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org, biju.das@bp.renesas.com
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Hulk Robot <hulkci@huawei.com>

kindly ping.

On 2019/10/9 9:47, Mao Wenan wrote:
> If CONFIG_TYPEC_HD3SS3220=y, CONFIG_USB_ROLE_SWITCH=m, below errors
> can be found:
> drivers/usb/typec/hd3ss3220.o: In function `hd3ss3220_remove':
> hd3ss3220.c:(.text+0x64): undefined reference to `usb_role_switch_put'
> drivers/usb/typec/hd3ss3220.o: In function `hd3ss3220_dr_set':
> hd3ss3220.c:(.text+0x154): undefined reference to `usb_role_switch_set_role'
> drivers/usb/typec/hd3ss3220.o: In function `hd3ss3220_set_role':
> hd3ss3220.c:(.text+0x294): undefined reference to `usb_role_switch_set_role'
> hd3ss3220.c:(.text+0x2f4): undefined reference to `usb_role_switch_set_role'
> hd3ss3220.c:(.text+0x348): undefined reference to `usb_role_switch_set_role'
> hd3ss3220.c:(.text+0x390): undefined reference to `usb_role_switch_set_role'
> drivers/usb/typec/hd3ss3220.o: In function `hd3ss3220_probe':
> hd3ss3220.c:(.text+0x5e8): undefined reference to `fwnode_usb_role_switch_get'
> hd3ss3220.c:(.text+0x8a4): undefined reference to `usb_role_switch_put'
> make: *** [vmlinux] Error 1
> 
> This patch add dependency USB_ROLE_SWITCH for TYPEC_HD3SS3220.
> 
> Fixes: 1c48c759ef4b ("usb: typec: driver for TI HD3SS3220 USB Type-C DRP port controller")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Mao Wenan <maowenan@huawei.com>
> ---
>  drivers/usb/typec/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/usb/typec/Kconfig b/drivers/usb/typec/Kconfig
> index aceb2af..b4f2aac 100644
> --- a/drivers/usb/typec/Kconfig
> +++ b/drivers/usb/typec/Kconfig
> @@ -53,6 +53,7 @@ source "drivers/usb/typec/ucsi/Kconfig"
>  config TYPEC_HD3SS3220
>  	tristate "TI HD3SS3220 Type-C DRP Port controller driver"
>  	depends on I2C
> +	depends on USB_ROLE_SWITCH
>  	help
>  	  Say Y or M here if your system has TI HD3SS3220 Type-C DRP Port
>  	  controller driver.
> 
