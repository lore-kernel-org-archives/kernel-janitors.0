From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Sun, 17 May 2020 09:01:01 +0000
Subject: Re: [PATCH] drm/mm: Fix an error handling path in '__igt_once()'
Message-Id: <158970606137.10809.7121434240962824777@build.alporthouse.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200517085049.278103-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200517085049.278103-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, airlied@linux.ie, daniel@ffwll.ch, gregkh@linuxfoundation.org, joonas.lahtinen@linux.intel.com, tglx@linutronix.de, tvrtko.ursulin@intel.com
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org

Quoting Christophe JAILLET (2020-05-17 09:50:49)
> The label of the last gotos must be switched for the error handling code to
> work as expected.
> 
> Fixes: 83bc4ec37210 ("drm/mm: Add a search-by-address variant to only inspect a single hole")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/gpu/drm/selftests/test-drm_mm.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/selftests/test-drm_mm.c b/drivers/gpu/drm/selftests/test-drm_mm.c
> index 9aabe82dcd3a..af38c4fa4db5 100644
> --- a/drivers/gpu/drm/selftests/test-drm_mm.c
> +++ b/drivers/gpu/drm/selftests/test-drm_mm.c
> @@ -1864,14 +1864,14 @@ static int __igt_once(unsigned int mode)
>                 pr_err("Unexpectedly inserted the node into the wrong hole: node.start=%llx\n",
>                        node.start);
>                 err = -EINVAL;
> -               goto err_node;
> +               goto err_hi;

This needs to call drm_mm_remove_node() [err_node:] as it accidentally inserted the
node.

>         }
>  
>         err = drm_mm_insert_node_generic(&mm, &node, 2, 0, 0, mode);
>         if (err) {
>                 pr_err("Could not insert the node into the available hole!\n");
>                 err = -EINVAL;
> -               goto err_hi;
> +               goto err_node;

And this must *not* call drm_mm_remove_node.
-Chris
