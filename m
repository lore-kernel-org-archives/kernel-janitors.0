From: Martyn Welch <martyn@welchs.me.uk>
Date: Sat, 14 Jul 2018 21:22:37 +0000
Subject: Re: [PATCH] vme: ca91cx42: remove redundant variable i
Message-Id: <20180714212236.buwuefu2j7a7fqfl@hades.welchs.me.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180714163332.11600-1-colin.king@canonical.com>
In-Reply-To: <20180714163332.11600-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Manohar Vanga <manohar.vanga@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Markus Elfring <elfring@users.sourceforge.net>, devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, Jul 14, 2018 at 05:33:32PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Variable i is being assigned but is never used hence it is redundant
> and can be removed.
> 
> Cleans up clang warning:
> warning: variable 'i' set but not used [-Wunused-but-set-variable]
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: Martyn Welch <martyn@welchs.me.uk>

> ---
>  drivers/vme/bridges/vme_ca91cx42.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/vme/bridges/vme_ca91cx42.c b/drivers/vme/bridges/vme_ca91cx42.c
> index 5dd284008630..53bdc256805f 100644
> --- a/drivers/vme/bridges/vme_ca91cx42.c
> +++ b/drivers/vme/bridges/vme_ca91cx42.c
> @@ -970,7 +970,6 @@ static unsigned int ca91cx42_master_rmw(struct vme_master_resource *image,
>  {
>  	u32 result;
>  	uintptr_t pci_addr;
> -	int i;
>  	struct ca91cx42_driver *bridge;
>  	struct device *dev;
>  
> @@ -978,7 +977,6 @@ static unsigned int ca91cx42_master_rmw(struct vme_master_resource *image,
>  	dev = image->parent->parent;
>  
>  	/* Find the PCI address that maps to the desired VME address */
> -	i = image->number;
>  
>  	/* Locking as we can only do one of these at a time */
>  	mutex_lock(&bridge->vme_rmw);
> -- 
> 2.17.1
> 
