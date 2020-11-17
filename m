From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 17 Nov 2020 11:50:16 +0000
Subject: Re: [PATCH] mmc: host: Kconfig: fix spelling mistake "hardare" -> "hardware"
Message-Id: <CAPDyKFpwFTEPLHZC9uT9mff64Axo-2bBjGVv4TGEcV4pGwWmig@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201114120819.416311-1-colin.king@canonical.com>
In-Reply-To: <20201114120819.416311-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, kernel-janitors@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Sat, 14 Nov 2020 at 13:08, Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> There is a spelling mistake in the Kconfig file. Fix it.
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/Kconfig b/drivers/mmc/host/Kconfig
> index 310e546e5898..7324a61d7416 100644
> --- a/drivers/mmc/host/Kconfig
> +++ b/drivers/mmc/host/Kconfig
> @@ -664,7 +664,7 @@ config MMC_S3C_PIO
>  config MMC_S3C_DMA
>         bool "Use DMA transfers only"
>         help
> -         Use DMA to transfer data between memory and the hardare.
> +         Use DMA to transfer data between memory and the hardware.
>
>           Currently, the DMA support in this driver seems to not be
>           working properly and needs to be debugged before this
> --
> 2.28.0
>
