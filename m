From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 09 Jan 2020 07:13:30 +0000
Subject: Re: [PATCH 05/16] media: isif: constify copied structure
Message-Id: <CA+V-a8unNHBPLNH2m8Fw98ASJR5vp64+OZHGq-YYc9=BnonDsA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1577864614-5543-1-git-send-email-Julia.Lawall@inria.fr> <1577864614-5543-6-git-send-email-Julia.Lawall@inria.fr>
In-Reply-To: <1577864614-5543-6-git-send-email-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@inria.fr>
Cc: kernel-janitors@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media <linux-media@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

On Wed, Jan 1, 2020 at 8:20 AM Julia Lawall <Julia.Lawall@inria.fr> wrote:
>
> The isif_config_defaults structure is only copied into another
> structure, so make it const.
>
> The opportunity for this change was found using Coccinelle.
>
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
>

Acked-by: Lad Prabhakar <prabhakar.csengg@gmail.com>

Cheers,
--Prabhakar Lad

> ---
>  drivers/media/platform/davinci/isif.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/davinci/isif.c b/drivers/media/platform/davinci/isif.c
> index b49378b18e5d..c98edb67cfb2 100644
> --- a/drivers/media/platform/davinci/isif.c
> +++ b/drivers/media/platform/davinci/isif.c
> @@ -29,7 +29,7 @@
>  #include "ccdc_hw_device.h"
>
>  /* Defaults for module configuration parameters */
> -static struct isif_config_params_raw isif_config_defaults = {
> +static const struct isif_config_params_raw isif_config_defaults = {
>         .linearize = {
>                 .en = 0,
>                 .corr_shft = ISIF_NO_SHIFT,
>
