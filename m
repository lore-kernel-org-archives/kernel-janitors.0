From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 03 Oct 2019 10:02:01 +0000
Subject: Re: [PATCH] mmc: dw_mmc: fix indentation issue
Message-Id: <CAPDyKFoHsOJKmQBT05Xqt0H+aeTdy-AWQ8-ej2CUheS2w6_jiA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190922115443.11693-1-colin.king@canonical.com>
In-Reply-To: <20190922115443.11693-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Jaehoon Chung <jh80.chung@samsung.com>, "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, kernel-janitors@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Sun, 22 Sep 2019 at 13:54, Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> There are a couple of statements that are indented by an extra
> space, clean this up by remove the extraneous spaces.
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/dw_mmc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/mmc/host/dw_mmc.c b/drivers/mmc/host/dw_mmc.c
> index 79c55c7b4afd..bf0048ebbda3 100644
> --- a/drivers/mmc/host/dw_mmc.c
> +++ b/drivers/mmc/host/dw_mmc.c
> @@ -3441,8 +3441,8 @@ int dw_mci_runtime_resume(struct device *dev)
>          * Restore the initial value at FIFOTH register
>          * And Invalidate the prev_blksz with zero
>          */
> -        mci_writel(host, FIFOTH, host->fifoth_val);
> -        host->prev_blksz = 0;
> +       mci_writel(host, FIFOTH, host->fifoth_val);
> +       host->prev_blksz = 0;
>
>         /* Put in max timeout */
>         mci_writel(host, TMOUT, 0xFFFFFFFF);
> --
> 2.20.1
>
