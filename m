From: Adrian Hunter <adrian.hunter@intel.com>
Date: Wed, 14 Jun 2017 06:08:03 +0000
Subject: Re: [PATCH][mmc-next] mmc: sdhci-pci: make guid intel_dsm_guid static
Message-Id: <f9b36c7a-1c69-d825-2bc2-ccb986ab2b22@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170613131426.8132-1-colin.king@canonical.com>
In-Reply-To: <20170613131426.8132-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 13/06/17 16:14, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The guid intel_dsm_guid does not need to be in global scope, so make
> it static.
> 
> Cleans up sparse warning:
> "symbol 'intel_dsm_guid' was not declared. Should it be static?"
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Acked-by: Adrian Hunter <adrian.hunter@intel.com>

But this patch is dependent on the guid changes which are not in the mmc
tree.  It's in a tree of Christoph's I think.

> ---
>  drivers/mmc/host/sdhci-pci-core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mmc/host/sdhci-pci-core.c b/drivers/mmc/host/sdhci-pci-core.c
> index 3c02c5b394d6..f1d8385d91f0 100644
> --- a/drivers/mmc/host/sdhci-pci-core.c
> +++ b/drivers/mmc/host/sdhci-pci-core.c
> @@ -404,7 +404,7 @@ struct intel_host {
>  	bool	d3_retune;
>  };
>  
> -const guid_t intel_dsm_guid > +static const guid_t intel_dsm_guid >  	GUID_INIT(0xF6C13EA5, 0x65CD, 0x461F,
>  		  0xAB, 0x7A, 0x29, 0xF7, 0xE8, 0xD5, 0xBD, 0x61);
>  
> 

