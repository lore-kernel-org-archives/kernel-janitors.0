From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 09 Jan 2012 14:19:17 +0000
Subject: Re: [patch 1/2] drm/radeon: use after free in radeon_vm_bo_add()
Message-Id: <CADnq5_MpvZhspOV9vCu+xbtEivsqtQvHaViGGZHR9+zhXRj1uQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120109124450.GA29606@elgon.mountain>
In-Reply-To: <20120109124450.GA29606@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, Jerome Glisse <jglisse@redhat.com>, Alex Deucher <alexander.deucher@amd.com>, Dave Airlie <airlied@redhat.com>

On Mon, Jan 9, 2012 at 7:44 AM, Dan Carpenter <dan.carpenter@oracle.com> wr=
ote:
> "bo_va" is dereferenced in the error message.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

>
> diff --git a/drivers/gpu/drm/radeon/radeon_gart.c b/drivers/gpu/drm/radeo=
n/radeon_gart.c
> index 3ef58ca..2944c78 100644
> --- a/drivers/gpu/drm/radeon/radeon_gart.c
> +++ b/drivers/gpu/drm/radeon/radeon_gart.c
> @@ -486,10 +486,10 @@ int radeon_vm_bo_add(struct radeon_device *rdev,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (bo_va->soffset >=3D tmp->soffset && bo=
_va->soffset < tmp->eoffset) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/* bo and tmp overlap, inv=
alid offset */
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 kfree(bo_va);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0dev_err(rdev->dev, "bo %p =
va 0x%08X conflict with (bo %p 0x%08X 0x%08X)\n",
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0bo, (unsig=
ned)bo_va->soffset, tmp->bo,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(unsigned)=
tmp->soffset, (unsigned)tmp->eoffset);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 kfree(bo_va);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0mutex_unlock(&vm->mutex);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return -EINVAL;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
