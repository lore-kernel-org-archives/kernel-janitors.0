From: Corbin Simpson <mostawesomedude@gmail.com>
Date: Thu, 13 May 2010 22:40:51 +0000
Subject: Re: [PATCH 2/20] drivers/gpu/drm: Use kzalloc
Message-Id: <AANLkTinQJDjv0oXXPqlRITLvcp5OaDmnzX0E-1vU942X@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.1005132158390.6282@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.1005132158390.6282@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Julia Lawall <julia@diku.dk>
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, May 13, 2010 at 12:58 PM, Julia Lawall <julia@diku.dk> wrote:
> From: Julia Lawall <julia@diku.dk>
>
> Use kzalloc rather than the combination of kmalloc and memset.
>
> The semantic patch that makes this change is as follows:
> (http://coccinelle.lip6.fr/)
>
> // <smpl>
> @@
> expression x,size,flags;
> statement S;
> @@
>
> -x =3D kmalloc(size,flags);
> +x =3D kzalloc(size,flags);
> =A0if (x =3D NULL) S
> -memset(x, 0, size);
> // </smpl>
>
> Signed-off-by: Julia Lawall <julia@diku.dk>
>
> ---
> =A0drivers/gpu/drm/drm_auth.c =A0 =A0 =A0 =A0 =A0| =A0 =A03 +--
> =A0drivers/gpu/drm/drm_dma.c =A0 =A0 =A0 =A0 =A0 | =A0 =A04 +---
> =A0drivers/gpu/drm/drm_fops.c =A0 =A0 =A0 =A0 =A0| =A0 =A03 +--
> =A0drivers/gpu/drm/savage/savage_bci.c | =A0 =A03 +--
> =A04 files changed, 4 insertions(+), 9 deletions(-)
>
> diff -u -p a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
> --- a/drivers/gpu/drm/drm_auth.c
> +++ b/drivers/gpu/drm/drm_auth.c
> @@ -79,10 +79,9 @@ static int drm_add_magic(struct drm_mast
> =A0 =A0 =A0 =A0struct drm_device *dev =3D master->minor->dev;
> =A0 =A0 =A0 =A0DRM_DEBUG("%d\n", magic);
>
> - =A0 =A0 =A0 entry =3D kmalloc(sizeof(*entry), GFP_KERNEL);
> + =A0 =A0 =A0 entry =3D kzalloc(sizeof(*entry), GFP_KERNEL);
> =A0 =A0 =A0 =A0if (!entry)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return -ENOMEM;
> - =A0 =A0 =A0 memset(entry, 0, sizeof(*entry));
> =A0 =A0 =A0 =A0entry->priv =3D priv;
> =A0 =A0 =A0 =A0entry->hash_item.key =3D (unsigned long)magic;
> =A0 =A0 =A0 =A0mutex_lock(&dev->struct_mutex);
> diff -u -p a/drivers/gpu/drm/drm_dma.c b/drivers/gpu/drm/drm_dma.c
> --- a/drivers/gpu/drm/drm_dma.c
> +++ b/drivers/gpu/drm/drm_dma.c
> @@ -47,12 +47,10 @@ int drm_dma_setup(struct drm_device *dev
> =A0{
> =A0 =A0 =A0 =A0int i;
>
> - =A0 =A0 =A0 dev->dma =3D kmalloc(sizeof(*dev->dma), GFP_KERNEL);
> + =A0 =A0 =A0 dev->dma =3D kzalloc(sizeof(*dev->dma), GFP_KERNEL);
> =A0 =A0 =A0 =A0if (!dev->dma)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return -ENOMEM;
>
> - =A0 =A0 =A0 memset(dev->dma, 0, sizeof(*dev->dma));
> -
> =A0 =A0 =A0 =A0for (i =3D 0; i <=3D DRM_MAX_ORDER; i++)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0memset(&dev->dma->bufs[i], 0, sizeof(dev->=
dma->bufs[0]));
>
> diff -u -p a/drivers/gpu/drm/drm_fops.c b/drivers/gpu/drm/drm_fops.c
> --- a/drivers/gpu/drm/drm_fops.c
> +++ b/drivers/gpu/drm/drm_fops.c
> @@ -243,11 +243,10 @@ static int drm_open_helper(struct inode
>
> =A0 =A0 =A0 =A0DRM_DEBUG("pid =3D %d, minor =3D %d\n", task_pid_nr(curren=
t), minor_id);
>
> - =A0 =A0 =A0 priv =3D kmalloc(sizeof(*priv), GFP_KERNEL);
> + =A0 =A0 =A0 priv =3D kzalloc(sizeof(*priv), GFP_KERNEL);
> =A0 =A0 =A0 =A0if (!priv)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return -ENOMEM;
>
> - =A0 =A0 =A0 memset(priv, 0, sizeof(*priv));
> =A0 =A0 =A0 =A0filp->private_data =3D priv;
> =A0 =A0 =A0 =A0priv->filp =3D filp;
> =A0 =A0 =A0 =A0priv->uid =3D current_euid();
> diff -u -p a/drivers/gpu/drm/savage/savage_bci.c b/drivers/gpu/drm/savage=
/savage_bci.c
> --- a/drivers/gpu/drm/savage/savage_bci.c
> +++ b/drivers/gpu/drm/savage/savage_bci.c
> @@ -539,11 +539,10 @@ int savage_driver_load(struct drm_device
> =A0{
> =A0 =A0 =A0 =A0drm_savage_private_t *dev_priv;
>
> - =A0 =A0 =A0 dev_priv =3D kmalloc(sizeof(drm_savage_private_t), GFP_KERN=
EL);
> + =A0 =A0 =A0 dev_priv =3D kzalloc(sizeof(drm_savage_private_t), GFP_KERN=
EL);
> =A0 =A0 =A0 =A0if (dev_priv =3D NULL)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return -ENOMEM;
>
> - =A0 =A0 =A0 memset(dev_priv, 0, sizeof(drm_savage_private_t));
> =A0 =A0 =A0 =A0dev->dev_private =3D (void *)dev_priv;
>
> =A0 =A0 =A0 =A0dev_priv->chipset =3D (enum savage_family)chipset;

Zero idea if anybody cares about savage DRM, but this looks like a
completely reasonable patch.

Reviewed-by: Corbin Simpson <MostAwesomeDude@gmail.com>

~ C.

--=20
When the facts change, I change my mind. What do you do, sir? ~ Keynes

Corbin Simpson
<MostAwesomeDude@gmail.com>
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
