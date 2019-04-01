From: Mukesh Ojha <mojha@codeaurora.org>
Date: Mon, 01 Apr 2019 08:55:47 +0000
Subject: Re: [PATCH -next] serial: sprd: Fix a copy-paste err in sprd_request_dma()
Message-Id: <6e0f2eb4-bb90-e2a2-6232-7301d7baf47a@codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190330014724.184531-1-yuehaibing@huawei.com>
In-Reply-To: <20190330014724.184531-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


On 3/30/2019 7:17 AM, YueHaibing wrote:
> when dma_request_chan rx_dma fails, dev_err log should print rx_dma
> err log.
>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
Reviewed-by: Mukesh Ojha <mojha@codeaurora.org>

Cheers,
-Mukesh
> ---
>   drivers/tty/serial/sprd_serial.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/tty/serial/sprd_serial.c b/drivers/tty/serial/sprd_serial.c
> index 6aebd77cd3c0..73d71a4e6c0c 100644
> --- a/drivers/tty/serial/sprd_serial.c
> +++ b/drivers/tty/serial/sprd_serial.c
> @@ -506,7 +506,7 @@ static void sprd_request_dma(struct uart_port *port)
>   	sp->rx_dma.chn = dma_request_chan(port->dev, "rx");
>   	if (IS_ERR(sp->rx_dma.chn)) {
>   		dev_err(port->dev, "request RX DMA channel failed, ret = %ld\n",
> -			PTR_ERR(sp->tx_dma.chn));
> +			PTR_ERR(sp->rx_dma.chn));
>   		sp->rx_dma.enable = false;
>   	}
>   }
>
>
>
