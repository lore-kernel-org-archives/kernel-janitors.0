From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Date: Wed, 22 Mar 2017 11:42:56 +0000
Subject: Re: [PATCH] tpm2: fix off-by-one comparison and out-of-bounds read error
Message-Id: <20170322114256.pdwg6buj2wkhcooy@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170320142336.10997-1-colin.king@canonical.com>
In-Reply-To: <20170320142336.10997-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Peter Huewe <peterhuewe@gmx.de>, Marcel Selhorst <tpmdd@selhorst.net>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, tpmdd-devel@lists.sourceforge.net, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Mar 20, 2017 at 02:23:36PM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The comparison of an out of range index into space->context_tbl is
> off-by-one and should be using >= rather than > in the comparison.
> 
> Detected by CoverityScan, CID#1419694 ("Out-of-bounds read")
> 
> Fixes: 849246e7ce9ce ("tpm2: add session handle context saving and restoring to the space code")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/char/tpm/tpm2-space.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/char/tpm/tpm2-space.c b/drivers/char/tpm/tpm2-space.c
> index d36d81e07076..009934269514 100644
> --- a/drivers/char/tpm/tpm2-space.c
> +++ b/drivers/char/tpm/tpm2-space.c
> @@ -229,7 +229,7 @@ static bool tpm2_map_to_phandle(struct tpm_space *space, void *handle)
>  	int i;
>  
>  	i = 0xFFFFFF - (vhandle & 0xFFFFFF);
> -	if (i > ARRAY_SIZE(space->context_tbl) || !space->context_tbl[i])
> +	if (i >= ARRAY_SIZE(space->context_tbl) || !space->context_tbl[i])
>  		return false;
>  
>  	phandle = space->context_tbl[i];
> -- 
> 2.11.0

Thanks. If you don't mind, I would squash this to that patch?

/Jarkko
