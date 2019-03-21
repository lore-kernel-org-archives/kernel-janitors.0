From: Julia Lawall <julia.lawall@lip6.fr>
Date: Thu, 21 Mar 2019 08:20:38 +0000
Subject: RE: [PATCH] drm/amd/powerplay: Fix double unlock bug in smu_sys_set_pp_table()
Message-Id: <alpine.DEB.2.20.1903210920230.5292@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190321062822.GD21489@kadam>
 <MN2PR12MB3309B7C391B32EB8F5F87676EC420@MN2PR12MB3309.namprd12.prod.outlook.com>
In-Reply-To: <MN2PR12MB3309B7C391B32EB8F5F87676EC420-rweVpJHSKTpWdvXm18W95QdYzm3356FpvxpqHgZTriW3zl9H0oFU5g@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Huang, Ray" <Ray.Huang-5C7GfCeVMHo@public.gmane.org>
Cc: "Zhou, David(ChunMing)" <David1.Zhou-5C7GfCeVMHo@public.gmane.org>, "Gui,
 Jack" <Jack.Gui-5C7GfCeVMHo@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, "Wang,
 Kevin(Yang)" <Kevin1.Wang-5C7GfCeVMHo@public.gmane.org>, "kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, "Deucher,
 Alexander" <Alexander.Deucher-5C7GfCeVMHo@public.gmane.org>, "Gao, Likun" <Likun.Gao-5C7GfCeVMHo@public.gmane.org>, "Koenig, Christian" <Christian.Koenig-5C7GfCeVMHo@public.gmane.org>, Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>



On Thu, 21 Mar 2019, Huang, Ray wrote:

> > -----Original Message-----
> > From: Dan Carpenter [mailto:dan.carpenter@oracle.com]
> > Sent: Thursday, March 21, 2019 2:28 PM
> > To: Deucher, Alexander <Alexander.Deucher@amd.com>; Wang, Kevin(Yang)
> > <Kevin1.Wang@amd.com>
> > Cc: Koenig, Christian <Christian.Koenig@amd.com>; Zhou, David(ChunMing)
> > <David1.Zhou@amd.com>; David Airlie <airlied@linux.ie>; Daniel Vetter
> > <daniel@ffwll.ch>; Huang, Ray <Ray.Huang@amd.com>; Gao, Likun
> > <Likun.Gao@amd.com>; Gui, Jack <Jack.Gui@amd.com>; amd-
> > gfx@lists.freedesktop.org; kernel-janitors@vger.kernel.org
> > Subject: [PATCH] drm/amd/powerplay: Fix double unlock bug in
> > smu_sys_set_pp_table()
> >
> > We already unlocked a few lines earlier so this code unlocks twice on the
> > success path.
> >
> > Fixes: 5809d7420f97 ("drm/amd/powerplay: implement sysfs of pp_table for
> > smu11 (v2)")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> Nice catch!  Thanks, Dan.
> Kevin, could you please verify this patch.
> Reviewed-by: Huang Rui <ray.huang@amd.com>
>
> > ---
> > I'm not sure what this bug looks like at runtime, but it's slightly weird that no
> > one noticed.  This is from static analysis and I haven't tested it myself.
> >
> >  drivers/gpu/drm/amd/powerplay/amdgpu_smu.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
> > b/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
> > index 00b7c885772b..7e8c74da6a74 100644
> > --- a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
> > +++ b/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
> > @@ -187,6 +187,8 @@ int smu_sys_set_pp_table(struct smu_context *smu,
> > void *buf, size_t size)
> >  	if (ret)
> >  		pr_info("smu reset failed, ret = %d\n", ret);
> >
> > +	return ret;

Why not return 0?

julia

> > +
> >  failed:
> >  	mutex_unlock(&smu->mutex);
> >  	return ret;
> > --
> > 2.17.1
>
>
