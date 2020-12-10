From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Date: Thu, 10 Dec 2020 15:10:35 +0000
Subject: Re: [PATCH] mmc: atmel-mci: =?utf-8?Q?Redu?= =?utf-8?Q?ce_scope_for_the_variable_=E2=80=9Cslot?= =?u
Message-Id: <20201210151035.GC1578121@piout.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <466b4c6d-032f-fbcc-58ac-75f6f39d734f@web.de>
In-Reply-To: <466b4c6d-032f-fbcc-58ac-75f6f39d734f@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, kernel-janitors@vger.kernel.org, linux-mmc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Ludovic Desroches <ludovic.desroches@microchip.com>, linux-arm-kernel@lists.infradead.org

Hello,

On 10/12/2020 16:01:44+0100, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Thu, 10 Dec 2020 15:56:13 +0100
> 
> A local variable was used only within an if branch.
> Thus move the definition for the variable “slot” into the corresponding
> code block.
> 

What is the improvement here?

This makes the code harder to read.

> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/mmc/host/atmel-mci.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mmc/host/atmel-mci.c b/drivers/mmc/host/atmel-mci.c
> index 444bd3a0a922..6a0d999ee82e 100644
> --- a/drivers/mmc/host/atmel-mci.c
> +++ b/drivers/mmc/host/atmel-mci.c
> @@ -1558,7 +1558,6 @@ static void atmci_request_end(struct atmel_mci *host, struct mmc_request *mrq)
>  	__releases(&host->lock)
>  	__acquires(&host->lock)
>  {
> -	struct atmel_mci_slot	*slot = NULL;
>  	struct mmc_host		*prev_mmc = host->cur_slot->mmc;
> 
>  	WARN_ON(host->cmd || host->data);
> @@ -1579,8 +1578,9 @@ static void atmci_request_end(struct atmel_mci *host, struct mmc_request *mrq)
>  	host->cur_slot->mrq = NULL;
>  	host->mrq = NULL;
>  	if (!list_empty(&host->queue)) {
> -		slot = list_entry(host->queue.next,
> -				struct atmel_mci_slot, queue_node);
> +		struct atmel_mci_slot *slot = list_entry(host->queue.next,
> +							 struct atmel_mci_slot,
> +							 queue_node);
>  		list_del(&slot->queue_node);
>  		dev_vdbg(&host->pdev->dev, "list not empty: %s is next\n",
>  				mmc_hostname(slot->mmc));
> --
> 2.29.2
> 

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
