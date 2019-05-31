From: Adrian Hunter <adrian.hunter@intel.com>
Date: Fri, 31 May 2019 11:35:33 +0000
Subject: Re: [PATCH] mmc: sdhci-pci: remove redundant check of slots == 0
Message-Id: <4336bf57-5fcf-5758-8d0d-9fd4aec3df4a@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190531113223.27474-1-colin.king@canonical.com>
In-Reply-To: <20190531113223.27474-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 31/05/19 2:32 PM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The calculation of slots results in a value in the range 1..8
> and so slots can never be zero.  The check for slots = 0 is
> always going to be false, hence it is redundant and can be
> removed.
> 
> Addresses-Coverity: ("Logically dead code")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Acked-by: Adrian Hunter <adrian.hunter@intel.com>

> ---
>  drivers/mmc/host/sdhci-pci-core.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/mmc/host/sdhci-pci-core.c b/drivers/mmc/host/sdhci-pci-core.c
> index ab9e2b901094..f70436261746 100644
> --- a/drivers/mmc/host/sdhci-pci-core.c
> +++ b/drivers/mmc/host/sdhci-pci-core.c
> @@ -2044,8 +2044,6 @@ static int sdhci_pci_probe(struct pci_dev *pdev,
>  
>  	slots = PCI_SLOT_INFO_SLOTS(slots) + 1;
>  	dev_dbg(&pdev->dev, "found %d slot(s)\n", slots);
> -	if (slots = 0)
> -		return -ENODEV;
>  
>  	BUG_ON(slots > MAX_SLOTS);
>  
> 
