From: Boris Brezillon <boris.brezillon@free-electrons.com>
Date: Mon, 18 Dec 2017 19:58:15 +0000
Subject: Re: [PATCH 3/4 v3] mtd: onenand: samsung: Remove a useless include
Message-Id: <20171218205815.38edd0d2@bbrezillon>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cover.1513230484.git.christophe.jaillet@wanadoo.fr>
 <3841b40286522d07585e773fb62c4c737ebf757b.1513230484.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <3841b40286522d07585e773fb62c4c737ebf757b.1513230484.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: kyungmin.park@samsung.com, dwmw2@infradead.org, computersforpeace@gmail.com, marek.vasut@gmail.com, richard@nod.at, cyrille.pitchen@wedev4u.fr, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Don't know how you generated the patch series, but this one should be
4/4 and not 3/4.

On Thu, 14 Dec 2017 07:03:52 +0100
Christophe JAILLET <christophe.jaillet@wanadoo.fr> wrote:

> This include is not needed, so remove it.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Cross-compiled tested-only
> 
> v3: new patch in the serie
> ---
>  drivers/mtd/onenand/samsung.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/mtd/onenand/samsung.c b/drivers/mtd/onenand/samsung.c
> index 206aa90140c9..c21d025fee87 100644
> --- a/drivers/mtd/onenand/samsung.c
> +++ b/drivers/mtd/onenand/samsung.c
> @@ -25,8 +25,6 @@
>  #include <linux/interrupt.h>
>  #include <linux/io.h>
>  
> -#include <asm/mach/flash.h>
> -
>  #include "samsung.h"
>  
>  enum soc_type {

