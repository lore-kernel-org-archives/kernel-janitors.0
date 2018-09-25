From: Michal Simek <michal.simek@xilinx.com>
Date: Tue, 25 Sep 2018 15:19:56 +0000
Subject: Re: [PATCH -next] serial: uartps: Fix missing unlock on error in cdns_get_id()
Message-Id: <138f0ca2-7e84-faa8-2105-1e49e96cea14@xilinx.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1537885401-18605-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1537885401-18605-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

On 25.9.2018 16:23, Wei Yongjun wrote:
> Add the missing unlock before return from function cdns_get_id()
> in the error handling case.
> 
> Fixes: ae1cca3fa347 ("serial: uartps: Change uart ID port allocation")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/tty/serial/xilinx_uartps.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/tty/serial/xilinx_uartps.c b/drivers/tty/serial/xilinx_uartps.c
> index f77200a..0e3dae4 100644
> --- a/drivers/tty/serial/xilinx_uartps.c
> +++ b/drivers/tty/serial/xilinx_uartps.c
> @@ -1394,8 +1394,10 @@ static int cdns_get_id(struct platform_device *pdev)
>  	if (!alias_bitmap_initialized) {
>  		ret = of_alias_get_alias_list(cdns_uart_of_match, "serial",
>  					      alias_bitmap, MAX_UART_INSTANCES);
> -		if (ret)
> +		if (ret) {
> +			mutex_unlock(&bitmap_lock);
>  			return ret;
> +		}
>  
>  		alias_bitmap_initialized++;
>  	}
> 

Thanks for the fix.

Reviewed-by: Michal Simek <michal.simek@xilinx.com>

Thanks,
Michal
