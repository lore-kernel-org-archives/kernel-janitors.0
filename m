From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 11 Jan 2018 14:53:23 +0000
Subject: Re: [PATCH] mmc: tmio, renesas_sdhi: Remove unneeded NULL check
Message-Id: <CAPDyKFqs6i6wcmJ6245xJrd-WSFVRwDukRYPF77oZt-K0nqzfQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180109093910.sbwgcqilgyfhjfns@mwanda>
In-Reply-To: <20180109093910.sbwgcqilgyfhjfns@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, kernel-janitors@vger.kernel.org

On 9 January 2018 at 10:39, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> The inconsistent NULL checking in this function causes static checker
> warnings.
>
>     drivers/mmc/host/renesas_sdhi_sys_dmac.c:360 renesas_sdhi_sys_dmac_issue_tasklet_fn()
>     error: we previously assumed 'host' could be null (see line 351)
>
> On reviewing this code, "host" can't ever be NULL so we can just remove
> the check.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks, applied for next!

Kind regards
Uffe

>
> diff --git a/drivers/mmc/host/renesas_sdhi_sys_dmac.c b/drivers/mmc/host/renesas_sdhi_sys_dmac.c
> index c8a74b2dee00..82d757c480b2 100644
> --- a/drivers/mmc/host/renesas_sdhi_sys_dmac.c
> +++ b/drivers/mmc/host/renesas_sdhi_sys_dmac.c
> @@ -348,7 +348,7 @@ static void renesas_sdhi_sys_dmac_issue_tasklet_fn(unsigned long priv)
>
>         spin_lock_irq(&host->lock);
>
> -       if (host && host->data) {
> +       if (host->data) {
>                 if (host->data->flags & MMC_DATA_READ)
>                         chan = host->chan_rx;
>                 else
