From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 04 Oct 2017 08:59:50 +0000
Subject: Re: [PATCH] mmc: dw_mmc-k3: make array hs_timing_cfg static
Message-Id: <CAPDyKFqdGAcyTytiQHAwDu0NAkF1HMq1-KMzB0e51uTv-YQAZg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171003095654.25802-1-colin.king@canonical.com>
In-Reply-To: <20171003095654.25802-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Jaehoon Chung <jh80.chung@samsung.com>, "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, kernel-janitors@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On 3 October 2017 at 11:56, Colin King <colin.king@canonical.com> wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> The array hs_timing_cfg is local to the source and does not need to
> be in global scope, so make it static.
>
> Cleans up sparse warning:
> symbol 'hs_timing_cfg' was not declared. Should it be static?
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Thanks, applied for next!

Kind regards
Uffe

> ---
>  drivers/mmc/host/dw_mmc-k3.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/dw_mmc-k3.c b/drivers/mmc/host/dw_mmc-k3.c
> index 64cda84b2302..73fd75c3c824 100644
> --- a/drivers/mmc/host/dw_mmc-k3.c
> +++ b/drivers/mmc/host/dw_mmc-k3.c
> @@ -75,7 +75,7 @@ struct hs_timing {
>         u32 smpl_phase_min;
>  };
>
> -struct hs_timing hs_timing_cfg[TIMING_MODE][TIMING_CFG_NUM] = {
> +static struct hs_timing hs_timing_cfg[TIMING_MODE][TIMING_CFG_NUM] = {
>         { /* reserved */ },
>         { /* SD */
>                 {7, 0, 15, 15,},  /* 0: LEGACY 400k */
> --
> 2.14.1
>
