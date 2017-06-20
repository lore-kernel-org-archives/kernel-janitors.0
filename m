From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Date: Tue, 20 Jun 2017 15:06:52 +0000
Subject: Re: [PATCH][tpm-next] tpm_tis: make ilb_base_addr static
Message-Id: <20170620150652.s5hrk4mffm2vmuek@linux.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170620102202.7132-1-colin.king@canonical.com>
In-Reply-To: <20170620102202.7132-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Peter Huewe <peterhuewe@gmx.de>, Marcel Selhorst <tpmdd@selhorst.net>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, tpmdd-devel@lists.sourceforge.net, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Jun 20, 2017 at 11:22:02AM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The pointer ilb_base_addr does not need to be in global scope, so make
> it static.
> 
> Cleans up sparse warning:
> "symbol 'ilb_base_addr' was not declared. Should it be static?"
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Thanks Colin.

Reviewed-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>

/Jarkko

> ---
>  drivers/char/tpm/tpm_tis.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/char/tpm/tpm_tis.c b/drivers/char/tpm/tpm_tis.c
> index 506e62ca3576..c915d65c1909 100644
> --- a/drivers/char/tpm/tpm_tis.c
> +++ b/drivers/char/tpm/tpm_tis.c
> @@ -138,7 +138,7 @@ static int check_acpi_tpm2(struct device *dev)
>  #define LPC_CNTRL_REG_OFFSET            0x84
>  #define LPC_CLKRUN_EN                   (1 << 2)
>  
> -void __iomem *ilb_base_addr;
> +static void __iomem *ilb_base_addr;
>  
>  static inline bool is_bsw(void)
>  {
> -- 
> 2.11.0
> 
