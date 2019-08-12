From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Date: Mon, 12 Aug 2019 15:05:15 +0000
Subject: Re: [PATCH] tty/serial: atmel: remove redundant assignment to ret
Message-Id: <20190812150515.GQ3600@piout.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190809174042.6276-1-colin.king@canonical.com>
In-Reply-To: <20190809174042.6276-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Richard Genoud <richard.genoud@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Ludovic Desroches <ludovic.desroches@microchip.com>, linux-serial@vger.kernel.org, Jiri Slaby <jslaby@suse.com>, linux-arm-kernel@lists.infradead.org

On 09/08/2019 18:40:42+0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Variable ret is initialized to a value that is never read and it
> is re-assigned later. The initialization is redundant and can be
> removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

> ---
>  drivers/tty/serial/atmel_serial.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/tty/serial/atmel_serial.c b/drivers/tty/serial/atmel_serial.c
> index 0b4f36905321..19a85d6fe3d2 100644
> --- a/drivers/tty/serial/atmel_serial.c
> +++ b/drivers/tty/serial/atmel_serial.c
> @@ -2888,7 +2888,7 @@ static int atmel_serial_probe(struct platform_device *pdev)
>  	struct atmel_uart_port *atmel_port;
>  	struct device_node *np = pdev->dev.parent->of_node;
>  	void *data;
> -	int ret = -ENODEV;
> +	int ret;
>  	bool rs485_enabled;
>  
>  	BUILD_BUG_ON(ATMEL_SERIAL_RINGSIZE & (ATMEL_SERIAL_RINGSIZE - 1));
> -- 
> 2.20.1
> 

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
