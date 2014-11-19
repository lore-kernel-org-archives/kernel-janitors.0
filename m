From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 19 Nov 2014 10:51:05 +0000
Subject: Re: [patch] mmc: toshsd: move dereference below check for NULL
Message-Id: <CAPDyKFqhPS5JCk0asDV4-ts=PL1xbczXJq=aTnKBMAkuvSk0yQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20141115185641.GA6530@mwanda>
In-Reply-To: <20141115185641.GA6530@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Chris Ball <chris@printf.net>, Ondrej Zary <linux@rainbow-software.org>, linux-mmc <linux-mmc@vger.kernel.org>, kernel-janitors@vger.kernel.org

On 15 November 2014 19:56, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> We check for NULL pointers after dereferencing so it's too late.  Oddly
> enough, Smatch misses this code but complains about the caller passing
> NULL pointers to this function:
>
>         drivers/mmc/host/toshsd.c:389 toshsd_irq()
>         error: we previously assumed 'host->cmd' could be null (see line 349)
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks! Applied for next.

Kind regards
Uffe

>
> diff --git a/drivers/mmc/host/toshsd.c b/drivers/mmc/host/toshsd.c
> index edb06d6..4666262 100644
> --- a/drivers/mmc/host/toshsd.c
> +++ b/drivers/mmc/host/toshsd.c
> @@ -206,14 +206,14 @@ static irqreturn_t toshsd_thread_irq(int irq, void *dev_id)
>  static void toshsd_cmd_irq(struct toshsd_host *host)
>  {
>         struct mmc_command *cmd = host->cmd;
> -       u8 *buf = (u8 *) cmd->resp;
> +       u8 *buf;
>         u16 data;
>
>         if (!host->cmd) {
>                 dev_warn(&host->pdev->dev, "Spurious CMD irq\n");
>                 return;
>         }
> -
> +       buf = (u8 *)cmd->resp;
>         host->cmd = NULL;
>
>         if (cmd->flags & MMC_RSP_PRESENT && cmd->flags & MMC_RSP_136) {
