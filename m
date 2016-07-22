From: Sean Paul <seanpaul@chromium.org>
Date: Fri, 22 Jul 2016 17:45:48 +0000
Subject: Re: [PATCH 3/4] GPU-DRM-Etnaviv: Rename jump labels
Message-Id: <CAOw6vbKjLg+cQBAuRpY0zot+D-PuwUvjabfPUBk5Vn6RS1REhA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5307CAA2.8060406@users.sourceforge.net>
 <alpine.DEB.2.02.1402212321410.2043@localhost6.localdomain6>
 <530A086E.8010901@users.sourceforge.net>
 <alpine.DEB.2.02.1402231635510.1985@localhost6.localdomain6>
 <530A72AA.3000601@users.sourceforge.net>
 <alpine.DEB.2.02.1402240658210.2090@localhost6.localdomain6>
 <530B5FB6.6010207@users.sourceforge.net>
 <alpine.DEB.2.10.1402241710370.2074@hadrien>
 <530C5E18.1020800@users.sourceforge.net>
 <alpine.DEB.2.10.1402251014170.2080@hadrien>
 <530CD2C4.4050903@users.sourceforge.net>
 <alpine.DEB.2.10.1402251840450.7035@hadrien>
 <530CF8FF.8080600@users.sourceforge.net>
 <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6>
 <530DD06F.4090703@users.sourceforge.net>
 <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
 <5317A59D.4@users.sourceforge.net>
 <00ca5af9-674a-73ce-b423-1ce41d426942@users.sourceforge.net>
 <dde7270f-9bd0-4e0c-04bf-0f1de990869c@users.sourceforge.net>
In-Reply-To: <dde7270f-9bd0-4e0c-04bf-0f1de990869c@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, Julia Lawall <julia.lawall@lip6.fr>, Russell King <linux+etnaviv@armlinux.org.uk>

On Fri, Jul 22, 2016 at 11:50 AM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Fri, 22 Jul 2016 16:51:00 +0200
>
> Adjust jump targets according to the Linux coding style convention.
>

I'm not convinced the old labels are really that bad, tbh.

Sean

> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/gpu/drm/etnaviv/etnaviv_gem.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> index 851a8ba..0a5c00c 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> @@ -308,17 +308,17 @@ struct etnaviv_vram_mapping *etnaviv_gem_mapping_get(
>                                 mapping = NULL;
>                         mutex_unlock(&gpu->mmu->lock);
>                         if (mapping)
> -                               goto out;
> +                               goto unlock;
>                 } else {
>                         mapping->use += 1;
> -                       goto out;
> +                       goto unlock;
>                 }
>         }
>
>         pages = etnaviv_gem_get_pages(etnaviv_obj);
>         if (IS_ERR(pages)) {
>                 ret = PTR_ERR(pages);
> -               goto out;
> +               goto unlock;
>         }
>
>         /*
> @@ -330,7 +330,7 @@ struct etnaviv_vram_mapping *etnaviv_gem_mapping_get(
>                 mapping = kzalloc(sizeof(*mapping), GFP_KERNEL);
>                 if (!mapping) {
>                         ret = -ENOMEM;
> -                       goto out;
> +                       goto unlock;
>                 }
>
>                 INIT_LIST_HEAD(&mapping->scan_node);
> @@ -349,7 +349,7 @@ struct etnaviv_vram_mapping *etnaviv_gem_mapping_get(
>         else
>                 list_add_tail(&mapping->obj_node, &etnaviv_obj->vram_list);
>
> -out:
> +unlock:
>         mutex_unlock(&etnaviv_obj->lock);
>
>         if (ret)
> @@ -646,7 +646,7 @@ static struct drm_gem_object *__etnaviv_gem_new(struct drm_device *dev,
>         ret = etnaviv_gem_new_impl(dev, size, flags, NULL,
>                                    &etnaviv_gem_shmem_ops, &obj);
>         if (ret)
> -               goto fail;
> +               goto unreference;
>
>         ret = drm_gem_object_init(dev, obj, size);
>         if (ret = 0) {
> @@ -664,7 +664,7 @@ static struct drm_gem_object *__etnaviv_gem_new(struct drm_device *dev,
>                 return obj;
>         }
>
> -fail:
> +unreference:
>         drm_gem_object_unreference_unlocked(obj);
>         return ERR_PTR(ret);
>  }
> --
> 2.9.2
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
