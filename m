From: Neil Armstrong <narmstrong@baylibre.com>
Date: Wed, 09 Dec 2020 15:36:30 +0000
Subject: Re: [PATCH] media: MAINTAINERS: correct entry in Amlogic GE2D driver section
Message-Id: <d1d0e624-d9d2-fb67-35cd-8be99360b400@baylibre.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201209074658.11557-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20201209074658.11557-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org
Cc: Joe Perches <joe@perches.com>, kernel-janitors@vger.kernel.org, Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, linux-kernel@vger.kernel.org

On 09/12/2020 08:46, Lukas Bulwahn wrote:
> Commit aa821b2b9269 ("media: MAINTAINERS: Add myself as maintainer of the
> Amlogic GE2D driver") introduced a new MAINTAINERS section, but the file
> entry points to the wrong location.
> 
> Hence, ./scripts/get_maintainer.pl --self-test=patterns warns:
> 
>   warning: no file matches    F:    drivers/media/meson/ge2d/
> 
> Adjust the entry to the actual location of the driver.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
> applies on next-20201208, not on current master
> 
> Neil, please ack.
> Hans, Mauro, please pick this minor non-urgent fix-up for your -next tree.
> 
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5b20babb9f7b..d66bf50fc640 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11520,7 +11520,7 @@ L:	linux-amlogic@lists.infradead.org
>  S:	Supported
>  T:	git git://linuxtv.org/media_tree.git
>  F:	Documentation/devicetree/bindings/media/amlogic,axg-ge2d.yaml
> -F:	drivers/media/meson/ge2d/
> +F:	drivers/media/platform/meson/ge2d/
>  
>  MESON NAND CONTROLLER DRIVER FOR AMLOGIC SOCS
>  M:	Liang Yang <liang.yang@amlogic.com>
> 

Acked-by: Neil Armstrong <narmstrong@baylibre.com>
