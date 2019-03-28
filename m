From: Mukesh Ojha <mojha@codeaurora.org>
Date: Thu, 28 Mar 2019 14:43:45 +0000
Subject: Re: [PATCH] vlynq: Fix uninitialized error code in probe()
Message-Id: <9a8d9a48-e95d-8607-5181-f264bcabd3c8@codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190328141742.GM32590@kadam>
In-Reply-To: <20190328141742.GM32590@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Florian Fainelli <f.fainelli@gmail.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org


On 3/28/2019 7:47 PM, Dan Carpenter wrote:
> The "result" variable isn't initialized on this error path.
>
> Fixes: 55e331cf7ebe ("drivers: add support for the TI VLYNQ bus")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Reviewed-by: Mukesh Ojha <mojha@codeaurora.org>

-Mukesh
> ---
>   drivers/vlynq/vlynq.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/vlynq/vlynq.c b/drivers/vlynq/vlynq.c
> index c0227f9418eb..44d3485d1108 100644
> --- a/drivers/vlynq/vlynq.c
> +++ b/drivers/vlynq/vlynq.c
> @@ -727,7 +727,8 @@ static int vlynq_probe(struct platform_device *pdev)
>   	dev->local_irq = dev->irq_end - dev->irq_start;
>   	dev->remote_irq = dev->local_irq - 1;
>   
> -	if (device_register(&dev->dev))
> +	result = device_register(&dev->dev);
> +	if (result)
>   		goto fail_register;
>   	platform_set_drvdata(pdev, dev);
>   
