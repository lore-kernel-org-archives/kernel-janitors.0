From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 03 Oct 2019 10:01:57 +0000
Subject: Re: [PATCH] memstick: jmb38x_ms: clean up indentation issue
Message-Id: <CAPDyKFqnzLNQXwAn2j821LM8EkW4yagDd8Tp4BaFFy-rFMhs8Q@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190922114700.10563-1-colin.king@canonical.com>
In-Reply-To: <20190922114700.10563-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Maxim Levitsky <maximlevitsky@gmail.com>, Alex Dubov <oakad@yahoo.com>, "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, kernel-janitors@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Sun, 22 Sep 2019 at 13:47, Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> There is a hunk of code that is indented one level too deep, fix
> this by removing the extraneous tabs.
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/memstick/host/jmb38x_ms.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/memstick/host/jmb38x_ms.c b/drivers/memstick/host/jmb38x_ms.c
> index 32747425297d..3394164a7968 100644
> --- a/drivers/memstick/host/jmb38x_ms.c
> +++ b/drivers/memstick/host/jmb38x_ms.c
> @@ -433,13 +433,13 @@ static int jmb38x_ms_issue_cmd(struct memstick_host *msh)
>                 writel(((1 << 16) & BLOCK_COUNT_MASK)
>                        | (data_len & BLOCK_SIZE_MASK),
>                        host->addr + BLOCK);
> -                       t_val = readl(host->addr + INT_STATUS_ENABLE);
> -                       t_val |= host->req->data_dir = READ
> -                                ? INT_STATUS_FIFO_RRDY
> -                                : INT_STATUS_FIFO_WRDY;
> +               t_val = readl(host->addr + INT_STATUS_ENABLE);
> +               t_val |= host->req->data_dir = READ
> +                        ? INT_STATUS_FIFO_RRDY
> +                        : INT_STATUS_FIFO_WRDY;
>
> -                       writel(t_val, host->addr + INT_STATUS_ENABLE);
> -                       writel(t_val, host->addr + INT_SIGNAL_ENABLE);
> +               writel(t_val, host->addr + INT_STATUS_ENABLE);
> +               writel(t_val, host->addr + INT_SIGNAL_ENABLE);
>         } else {
>                 cmd &= ~(TPC_DATA_SEL | 0xf);
>                 host->cmd_flags |= REG_DATA;
> --
> 2.20.1
>
