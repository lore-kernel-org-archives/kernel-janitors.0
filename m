From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Date: Wed, 04 Mar 2020 12:08:32 +0000
Subject: Re: [PATCH] MAINTAINERS: adjust to reservation.h renaming
Message-Id: <b0296e3a-31f8-635a-f26d-8b0bc490aae3@amd.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200304120711.12117-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20200304120711.12117-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Joe Perches <joe@perches.com>, Sebastian Duda <sebastian.duda@fau.de>, linux-media@vger.kernel.org

Am 04.03.20 um 13:07 schrieb Lukas Bulwahn:
> Commit 52791eeec1d9 ("dma-buf: rename reservation_object to dma_resv")
> renamed include/linux/reservation.h to include/linux/dma-resv.h, but
> missed the reference in the MAINTAINERS entry.
>
> Since then, ./scripts/get_maintainer.pl --self-test complains:
>
>    warning: no file matches F: include/linux/reservation.h
>
> Adjust the DMA BUFFER SHARING FRAMEWORK entry in MAINTAINERS.
>
> Co-developed-by: Sebastian Duda <sebastian.duda@fau.de>
> Signed-off-by: Sebastian Duda <sebastian.duda@fau.de>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>

> ---
> Christian, please pick this patch.
> applies cleanly on current master and next-20200303
>
>   MAINTAINERS | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 6158a143a13e..3d6cb2789c9e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5022,7 +5022,7 @@ L:	dri-devel@lists.freedesktop.org
>   L:	linaro-mm-sig@lists.linaro.org (moderated for non-subscribers)
>   F:	drivers/dma-buf/
>   F:	include/linux/dma-buf*
> -F:	include/linux/reservation.h
> +F:	include/linux/dma-resv.h
>   F:	include/linux/*fence.h
>   F:	Documentation/driver-api/dma-buf.rst
>   K:	dma_(buf|fence|resv)
