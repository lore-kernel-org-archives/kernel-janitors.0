From: Ben Skeggs <bskeggs@redhat.com>
Date: Tue, 26 Feb 2019 01:38:12 +0000
Subject: Re: [PATCH] drm/nouveau/dmem: Fix a NULL vs IS_ERR() check
Message-Id: <CABDvA=kL2oFQWm8r3C29barB_uUjNSudd7pWgARiC-ecK-t=Fg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190222063404.GA12190@kadam>
In-Reply-To: <20190222063404.GA12190@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>

Got it, thanks!

On Fri, Feb 22, 2019 at 4:34 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> The hmm_devmem_add() function doesn't return NULL, it returns error
> pointers.
>
> Fixes: 5be73b690875 ("drm/nouveau/dmem: device memory helpers for SVM")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_dmem.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> index aa9fec80492d..28624dd0c920 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> @@ -623,7 +623,7 @@ nouveau_dmem_init(struct nouveau_drm *drm)
>          */
>         drm->dmem->devmem = hmm_devmem_add(&nouveau_dmem_devmem_ops,
>                                            device, size);
> -       if (drm->dmem->devmem = NULL) {
> +       if (IS_ERR(drm->dmem->devmem)) {
>                 kfree(drm->dmem);
>                 drm->dmem = NULL;
>                 return;
> --
> 2.17.1
>
