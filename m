From: Borislav Petkov <bp@alien8.de>
Date: Fri, 23 Jun 2017 08:58:24 +0000
Subject: Re: [PATCH] EDAC, pnd2_edac: make function sbi_send static
Message-Id: <20170623085824.yqzachlpvu26knkv@pd.tnic>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170623084855.9197-1-colin.king@canonical.com>
In-Reply-To: <20170623084855.9197-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tony Luck <tony.luck@intel.com>
Cc: Colin King <colin.king@canonical.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-edac@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Jun 23, 2017 at 09:48:55AM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The function sbi_send is local to just pnd2_edac.c and does not need to
> be in global scope, so make it static.
> 
> Cleans up sparse warning:
> symbol 'sbi_send' was not declared. Should it be static?
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/edac/pnd2_edac.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/edac/pnd2_edac.c b/drivers/edac/pnd2_edac.c
> index 1cad5a9af8d0..4efdca1dad5a 100644
> --- a/drivers/edac/pnd2_edac.c
> +++ b/drivers/edac/pnd2_edac.c
> @@ -131,7 +131,7 @@ static struct mem_ctl_info *pnd2_mci;
>  
>  #ifdef CONFIG_X86_INTEL_SBI_APL
>  #include "linux/platform_data/sbi_apl.h"
> -int sbi_send(int port, int off, int op, u32 *data)
> +static int sbi_send(int port, int off, int op, u32 *data)
>  {
>  	struct sbi_apl_message sbi_arg;
>  	int ret, read = 0;
> @@ -160,7 +160,7 @@ int sbi_send(int port, int off, int op, u32 *data)
>  	return ret;
>  }
>  #else
> -int sbi_send(int port, int off, int op, u32 *data)
> +static int sbi_send(int port, int off, int op, u32 *data)

Tony, were those supposed to be used somewhere outside of the driver,
i.e., that CONFIG_X86_INTEL_SBI_APL thing?

-- 
Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.
