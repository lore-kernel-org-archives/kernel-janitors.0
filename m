From: "Wolf Entwicklungen" <Marcus.Wolf@Wolf-Entwicklungen.de>
Date: Thu, 20 Jul 2017 11:02:42 +0000
Subject: Re: [PATCH 3/3][staging-next] staging: pi433: fix thread_run failure check
Message-Id: <962023a363631a61711915b30585aef8-EhVcX1pHQwdXWkQFBhENSgEKLlwACzJXX19HAVhEWENbS1kLMF52CEtUX1pBSEwcXlJRL1lQWAhaW34EU1c=-webmailer1@server01.webmailer.webmailer.hosteurope.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170718130400.25436-1-colin.king@canonical.com>
    <20170718130400.25436-3-colin.king@canonical.com>
In-Reply-To: <20170718130400.25436-3-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Marcus Wolf <linux@Wolf-Entwicklungen.de>, devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Reviewed-by: Marcus Wolf <linux@wolf-entwicklungen.de>
Tested-by: Marcus Wolf <linux@wolf-entwicklungen.de>

Am Di, 18.07.2017, 15:04 schrieb Colin King:
> From: Colin Ian King <colin.king@canonical.com>
>
> The check for thread_run failure is incorrect, use IS_ERR instead.
>
> Cleans up sparse error message:
> "error: incompatible types for operation (<)"
>
> Fixes: 874bcba65f9a ("staging: pi433: New driver")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/staging/pi433/pi433_if.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/staging/pi433/pi433_if.c b/drivers/staging/pi433/pi433_if.c
> index 95930a192de4..266e572ae66e 100644
> --- a/drivers/staging/pi433/pi433_if.c
> +++ b/drivers/staging/pi433/pi433_if.c
> @@ -1152,8 +1152,7 @@ static int pi433_probe(struct spi_device *spi)
>  	device->tx_task_struct = kthread_run(pi433_tx_thread,
>  					     device,
>  					     "pi433_tx_task");
> -	if (device->tx_task_struct < 0)
> -	{
> +	if (IS_ERR(device->tx_task_struct)) {
>  		dev_dbg(device->dev, "start of send thread failed");
>  		goto send_thread_failed;
>  	}
> --
> 2.11.0
>
>
>

