From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 14 Jan 2019 11:42:44 +0000
Subject: Re: [PATCH -next] mmc: sdhci_am654: Make symbol 'sdhci_am654_ops' static
Message-Id: <CAPDyKFrbRoVPsjJgq3o6wxXGHTkLRTP3dH9D7fykgknVJe1=7w@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, 18 Dec 2018 at 08:08, Wei Yongjun <weiyongjun1@huawei.com> wrote:
>
> Fixes the following sparse warning:
>
> drivers/mmc/host/sdhci_am654.c:161:18: warning:
>  symbol 'sdhci_am654_ops' was not declared. Should it be static?
>
> Fixes: aff88ff23512 ("mmc: sdhci_am654: Add Initial Support for AM654 SDHCI driver")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/sdhci_am654.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/sdhci_am654.c b/drivers/mmc/host/sdhci_am654.c
> index 8c05879..eea183e 100644
> --- a/drivers/mmc/host/sdhci_am654.c
> +++ b/drivers/mmc/host/sdhci_am654.c
> @@ -158,7 +158,7 @@ static void sdhci_am654_set_power(struct sdhci_host *host, unsigned char mode,
>         sdhci_set_power_noreg(host, mode, vdd);
>  }
>
> -struct sdhci_ops sdhci_am654_ops = {
> +static struct sdhci_ops sdhci_am654_ops = {
>         .get_max_clock = sdhci_pltfm_clk_get_max_clock,
>         .get_timeout_clock = sdhci_pltfm_clk_get_max_clock,
>         .set_uhs_signaling = sdhci_set_uhs_signaling,
>
>
>
