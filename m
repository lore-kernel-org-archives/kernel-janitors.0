From: walter harms <wharms@bfs.de>
Date: Wed, 03 Jul 2019 07:47:49 +0000
Subject: Re: [PATCH -next] serial: 8250: 8250_core: Fix missing unlock on error in serial8250_register_8250_p
Message-Id: <5D1C5DA5.9030907@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190703055908.141294-1-weiyongjun1@huawei.com>
In-Reply-To: <20190703055908.141294-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org



Am 03.07.2019 07:59, schrieb Wei Yongjun:
> Add the missing unlock before return from function serial8250_register_8250_port()
> in the error handling case.
> 
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/tty/serial/8250/8250_core.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/tty/serial/8250/8250_core.c b/drivers/tty/serial/8250/8250_core.c
> index a4470771005f..df3bcc0b2d74 100644
> --- a/drivers/tty/serial/8250/8250_core.c
> +++ b/drivers/tty/serial/8250/8250_core.c
> @@ -1026,8 +1026,10 @@ int serial8250_register_8250_port(struct uart_8250_port *up)
>  		if (!has_acpi_companion(uart->port.dev)) {
>  			gpios = mctrl_gpio_init(&uart->port, 0);
>  			if (IS_ERR(gpios)) {
> -				if (PTR_ERR(gpios) != -ENOSYS)
> -					return PTR_ERR(gpios);
> +				if (PTR_ERR(gpios) != -ENOSYS) {
> +					ret = PTR_ERR(gpios);
> +					goto out_unlock;
> +				}
>  			} else {
>  				uart->gpios = gpios;
>  			}
> @@ -1099,6 +1101,7 @@ int serial8250_register_8250_port(struct uart_8250_port *up)
>  		}
>  	}
>  
> +out_unlock:
>  	mutex_unlock(&serial_mutex);
>  
>  	return ret;
> 


i am sorry but i do not understand these ENOSYS path.
So far i can see uart->gpios will be uninitialized, is that really intended ?

re,
 wh
