From: "Mark Asselstine" <asselsm@gmail.com>
Date: Tue, 08 Jul 2008 12:29:57 +0000
Subject: Re: [PATCH] drm_memory.h: remove double inclusion of linux/vmalloc.h
Message-Id: <919fe2b30807080529j71ae1816sc035c90b5eee555c@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <a4423d670807060431w639f0b1ajcbad6471d50ef802@mail.gmail.com>
In-Reply-To: <a4423d670807060431w639f0b1ajcbad6471d50ef802@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexander Beregalov <a.beregalov@gmail.com>
Cc: kernel-janitors@vger.kernel.org, airlied@linux.ie, dri-devel@lists.sourceforge.net, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Sun, Jul 6, 2008 at 7:31 AM, Alexander Beregalov
<a.beregalov@gmail.com> wrote:
> From: Alexander Beregalov <a.beregalov@gmail.com>
>
> Remove double inclusion of linux/vmalloc.h
>
> drivers/char/drm/drm_memory.h |    2 --
> 1 files changed, 0 insertions(+), 2 deletions(-)
>
> Signed-off-by: Alexander Beregalov <a.beregalov@gmail.com>
> ---
>
> diff --git a/drivers/char/drm/drm_memory.h b/drivers/char/drm/drm_memory.h
> index 63e425b..15af9b3 100644
> --- a/drivers/char/drm/drm_memory.h
> +++ b/drivers/char/drm/drm_memory.h
> @@ -44,8 +44,6 @@
>
>  #if __OS_HAS_AGP
>
> -#include <linux/vmalloc.h>
> -

Why remove this one and not the one at the top of the file? As well
this file has #include of drmP.h, yet drmP.h is the only file I can
find that includes drm_memory.h. Based on this I would think there is
some additional cleanup that can go on here.

Regards,
Mark Asselstine

>  #ifdef HAVE_PAGE_AGP
>  #include <asm/agp.h>
>  #else
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
