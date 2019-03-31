From: Baolin Wang <baolin.wang@linaro.org>
Date: Sun, 31 Mar 2019 14:38:33 +0000
Subject: Re: [PATCH -next] serial: sprd: Fix a copy-paste err in sprd_request_dma()
Message-Id: <CAMz4kuLZJOYb8JLZW+0_uETkLD1An1-cbyy5vTMk3XY+UOSYng@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190330014724.184531-1-yuehaibing@huawei.com>
In-Reply-To: <20190330014724.184531-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, 30 Mar 2019 at 09:36, YueHaibing <yuehaibing@huawei.com> wrote:
>
> when dma_request_chan rx_dma fails, dev_err log should print rx_dma
> err log.
>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  drivers/tty/serial/sprd_serial.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/tty/serial/sprd_serial.c b/drivers/tty/serial/sprd_serial.c
> index 6aebd77cd3c0..73d71a4e6c0c 100644
> --- a/drivers/tty/serial/sprd_serial.c
> +++ b/drivers/tty/serial/sprd_serial.c
> @@ -506,7 +506,7 @@ static void sprd_request_dma(struct uart_port *port)
>         sp->rx_dma.chn = dma_request_chan(port->dev, "rx");
>         if (IS_ERR(sp->rx_dma.chn)) {
>                 dev_err(port->dev, "request RX DMA channel failed, ret = %ld\n",
> -                       PTR_ERR(sp->tx_dma.chn));
> +                       PTR_ERR(sp->rx_dma.chn));

Thanks for fixing the mistake.
Reviewed-by: Baolin Wang <baolin.wang@linaro.org>

-- 
Baolin Wang
Best Regards
