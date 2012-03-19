From: Jerome Glisse <j.glisse@gmail.com>
Date: Mon, 19 Mar 2012 15:12:51 +0000
Subject: Re: [PATCH] drivers/gpu/drm/radeon/radeon_cs.c: eliminate possible double free
Message-Id: <CAH3drwb3NtNT8ihqN44cZYowanf19Rha7QVN7+BC43=Lhg4u2Q@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1332003809-23269-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1332003809-23269-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: David Airlie <airlied@linux.ie>, Jerome Glisse <jglisse@redhat.com>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org

On Sat, Mar 17, 2012 at 1:03 PM, Julia Lawall <Julia.Lawall@lip6.fr> wrote:
> From: Julia Lawall <Julia.Lawall@lip6.fr>
>
> The function radeon_cs_parser_init is only called from two places, in
> drivers/gpu/drm/radeon/radeon_cs.c and drivers/gpu/drm/radeon/r600_cs.c.
> In each case, if the call fails another function is called that frees all
> of the kdata and dpage information in the chunks array. =A0So this
> information should not be freed in radeon_cs_parser_init as well.
>
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Reviewed-by: Jerome Glisse <jglisse@redhat.com>
>
> ---
> =A0drivers/gpu/drm/radeon/radeon_cs.c | =A0 16 ++--------------
> =A01 file changed, 2 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_cs.c b/drivers/gpu/drm/radeon/=
radeon_cs.c
> index 9b4124e..d9d9f5a 100644
> --- a/drivers/gpu/drm/radeon/radeon_cs.c
> +++ b/drivers/gpu/drm/radeon/radeon_cs.c
> @@ -243,20 +243,11 @@ int radeon_cs_parser_init(struct radeon_cs_parser *=
p, void *data)
> =A0 =A0 =A0 =A0if ((p->cs_flags & RADEON_CS_USE_VM) &&
> =A0 =A0 =A0 =A0 =A0 =A0!p->rdev->vm_manager.enabled) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0DRM_ERROR("VM not active on asic!\n");
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (p->chunk_relocs_idx !=3D -1)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 kfree(p->chunks[p->chunk_re=
locs_idx].kdata);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (p->chunk_flags_idx !=3D -1)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 kfree(p->chunks[p->chunk_fl=
ags_idx].kdata);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return -EINVAL;
> =A0 =A0 =A0 =A0}
>
> - =A0 =A0 =A0 if (radeon_cs_get_ring(p, ring, priority)) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (p->chunk_relocs_idx !=3D -1)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 kfree(p->chunks[p->chunk_re=
locs_idx].kdata);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (p->chunk_flags_idx !=3D -1)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 kfree(p->chunks[p->chunk_fl=
ags_idx].kdata);
> + =A0 =A0 =A0 if (radeon_cs_get_ring(p, ring, priority))
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return -EINVAL;
> - =A0 =A0 =A0 }
>
>
> =A0 =A0 =A0 =A0/* deal with non-vm */
> @@ -271,11 +262,8 @@ int radeon_cs_parser_init(struct radeon_cs_parser *p=
, void *data)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0p->chunks[p->chunk_ib_idx].kpage[0] =3D km=
alloc(PAGE_SIZE, GFP_KERNEL);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0p->chunks[p->chunk_ib_idx].kpage[1] =3D km=
alloc(PAGE_SIZE, GFP_KERNEL);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (p->chunks[p->chunk_ib_idx].kpage[0] =
=3D NULL ||
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 p->chunks[p->chunk_ib_idx].kpage[1]=
 =3D NULL) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 kfree(p->chunks[p->chunk_ib=
_idx].kpage[0]);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 kfree(p->chunks[p->chunk_ib=
_idx].kpage[1]);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 p->chunks[p->chunk_ib_idx].kpage[1]=
 =3D NULL)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return -ENOMEM;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0p->chunks[p->chunk_ib_idx].kpage_idx[0] =
=3D -1;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0p->chunks[p->chunk_ib_idx].kpage_idx[1] =
=3D -1;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0p->chunks[p->chunk_ib_idx].last_copied_pag=
e =3D -1;
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at =A0http://www.tux.org/lkml/
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
