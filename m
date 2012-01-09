From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 09 Jan 2012 14:26:01 +0000
Subject: Re: [patch 2/2] drm/radeon: double lock typo in radeon_vm_bo_rmv()
Message-Id: <CADnq5_NZKs1SCQtLG0q7RQDJy82LCR931dsLekAyHxjChwPDvg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120109124541.GB29606@elgon.mountain>
In-Reply-To: <20120109124541.GB29606@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, Jerome Glisse <jglisse@redhat.com>, Alex Deucher <alexander.deucher@amd.com>, Dave Airlie <airlied@redhat.com>

On Mon, Jan 9, 2012 at 7:45 AM, Dan Carpenter <dan.carpenter@oracle.com> wr=
ote:
> The second lock should be an unlock or it causes a deadlock.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

>
> diff --git a/drivers/gpu/drm/radeon/radeon_gart.c b/drivers/gpu/drm/radeo=
n/radeon_gart.c
> index 2944c78..4a9f797 100644
> --- a/drivers/gpu/drm/radeon/radeon_gart.c
> +++ b/drivers/gpu/drm/radeon/radeon_gart.c
> @@ -595,7 +595,7 @@ int radeon_vm_bo_rmv(struct radeon_device *rdev,
> =A0 =A0 =A0 =A0radeon_vm_bo_update_pte(rdev, vm, bo, NULL);
> =A0 =A0 =A0 =A0radeon_mutex_unlock(&rdev->cs_mutex);
> =A0 =A0 =A0 =A0list_del(&bo_va->vm_list);
> - =A0 =A0 =A0 mutex_lock(&vm->mutex);
> + =A0 =A0 =A0 mutex_unlock(&vm->mutex);
>
> =A0 =A0 =A0 =A0kfree(bo_va);
> =A0 =A0 =A0 =A0return 0;
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
