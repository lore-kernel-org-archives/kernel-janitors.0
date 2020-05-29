From: Borislav Petkov <bp@alien8.de>
Date: Fri, 29 May 2020 13:20:08 +0000
Subject: Re: [PATCH] EDAC: remove redundant assignment to variable ret
Message-Id: <20200529132008.GI9011@zn.tnic>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200429154847.287001-1-colin.king@canonical.com>
In-Reply-To: <20200429154847.287001-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Tony Luck <tony.luck@intel.com>, James Morse <james.morse@arm.com>, Robert Richter <rrichter@marvell.com>, linux-edac@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Apr 29, 2020 at 04:48:47PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable ret is being assigned with a value that is never read
> and it is being updated later with a new value. The initialization is
> redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/edac/amd64_edac.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/edac/amd64_edac.c b/drivers/edac/amd64_edac.c
> index 6bdc5bb8c8bc..e33f66cee132 100644
> --- a/drivers/edac/amd64_edac.c
> +++ b/drivers/edac/amd64_edac.c
> @@ -3400,7 +3400,7 @@ static const struct attribute_group *amd64_edac_attr_groups[] = {
>  static int hw_info_get(struct amd64_pvt *pvt)
>  {
>  	u16 pci_id1, pci_id2;
> -	int ret = -EINVAL;
> +	int ret;
>  
>  	if (pvt->fam >= 0x17) {
>  		pvt->umc = kcalloc(fam_type->max_mcs, sizeof(struct amd64_umc), GFP_KERNEL);
> -- 

Applied, thanks.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
