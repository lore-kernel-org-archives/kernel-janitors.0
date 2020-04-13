From: Borislav Petkov <bp@alien8.de>
Date: Mon, 13 Apr 2020 08:15:56 +0000
Subject: Re: [PATCH RESEND] MAINTAINERS: rectify EDAC-SIFIVE entry
Message-Id: <20200413081556.GB3772@zn.tnic>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200413073447.9284-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20200413073447.9284-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Christoph Hellwig <hch@lst.de>, Yash Shah <yash.shah@sifive.com>, linux-edac@vger.kernel.org, Sebastian Duda <sebastian.duda@fau.de>, Joe Perches <joe@perches.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Apr 13, 2020 at 09:34:47AM +0200, Lukas Bulwahn wrote:
> Commit 9209fb51896f ("riscv: move sifive_l2_cache.c to drivers/soc") moved
> arch/riscv/mm/sifive_l2_cache.c to drivers/soc/sifive/sifive_l2_cache.c
> and adjusted the MAINTAINERS EDAC-SIFIVE entry but slipped in a mistake.
> 
> Since then, ./scripts/get_maintainer.pl --self-test complains:
> 
>   warning: no file matches F: drivers/soc/sifive_l2_cache.c
> 
> Rectify the EDAC-SIFIVE entry in MAINTAINERS now.
> 
> Co-developed-by: Sebastian Duda <sebastian.duda@fau.de>
> Signed-off-by: Sebastian Duda <sebastian.duda@fau.de>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
> Paul, please pick this patch.
> 
> v1: https://lore.kernel.org/lkml/20200304144045.15060-1-lukas.bulwahn@gmail.com/
>   - was not picked up.
> 
> v1-resend: applies on v5.7-rc1
> 
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e64e5db31497..e28676766b26 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6172,7 +6172,7 @@ M:	Yash Shah <yash.shah@sifive.com>
>  L:	linux-edac@vger.kernel.org
>  S:	Supported
>  F:	drivers/edac/sifive_edac.c
> -F:	drivers/soc/sifive_l2_cache.c
> +F:	drivers/soc/sifive/sifive_l2_cache.c

Looking at that a bit - I think the right thing to do is to remove that
sifive_l2_cache.c file from the EDAC-SIFIVE file pattern because the
edac driver is simply using the L2 thing to register on its notifier
chain, i.e., using an external facility, like all the drivers do. And the
l2_cache thing is not part of the edac driver.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
