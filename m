From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 07 Oct 2019 15:55:58 +0000
Subject: Re: [PATCH] drm/amd/display: Fix typo in some comments
Message-Id: <CADnq5_NhypGdi6z78BbWimAZVtEDxhe1Rw=D4p7JPQNH0Kdqyw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191005113205.14601-1-christophe.jaillet@wanadoo.fr>
 <04e006aa-a354-dfe3-3d13-d674c662c300@amd.com>
In-Reply-To: <04e006aa-a354-dfe3-3d13-d674c662c300-5C7GfCeVMHo@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Harry Wentland <hwentlan-5C7GfCeVMHo@public.gmane.org>
Cc: "Zhou, David(ChunMing)" <David1.Zhou-5C7GfCeVMHo@public.gmane.org>, "Li,
 Sun peng (Leo)" <Sunpeng.Li-5C7GfCeVMHo@public.gmane.org>, "kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "airlied-cv59FeDIM0c@public.gmane.org" <airlied-cv59FeDIM0c@public.gmane.org>, Christophe JAILLET <christophe.jaillet-39ZsbGIQGT5GWvitb5QawA@public.gmane.org>, "amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "daniel-/w4YWyX8dFk@public.gmane.org" <daniel-/w4YWyX8dFk@public.gmane.org>, "Deucher,
 Alexander" <Alexander.Deucher-5C7GfCeVMHo@public.gmane.org>, "Wentland,
 Harry" <Harry.Wentland-5C7GfCeVMHo@public.gmane.org>, "Koenig,
 Christian" <Christian.Koenig-5C7GfCeVMHo@public.gmane.org>

On Mon, Oct 7, 2019 at 10:13 AM Harry Wentland <hwentlan@amd.com> wrote:
>
> On 2019-10-05 7:32 a.m., Christophe JAILLET wrote:
> > p and g are switched in 'amdpgu_dm'
> >
> > Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
>
> Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Applied.  thanks!

Alex

>
> Harry
>
> > ---
> >  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > index 92932d521d7f..b9c2e1a930ab 100644
> > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > @@ -1043,7 +1043,7 @@ static void s3_handle_mst(struct drm_device *dev, bool suspend)
> >
> >  /**
> >   * dm_hw_init() - Initialize DC device
> > - * @handle: The base driver device containing the amdpgu_dm device.
> > + * @handle: The base driver device containing the amdgpu_dm device.
> >   *
> >   * Initialize the &struct amdgpu_display_manager device. This involves calling
> >   * the initializers of each DM component, then populating the struct with them.
> > @@ -1073,7 +1073,7 @@ static int dm_hw_init(void *handle)
> >
> >  /**
> >   * dm_hw_fini() - Teardown DC device
> > - * @handle: The base driver device containing the amdpgu_dm device.
> > + * @handle: The base driver device containing the amdgpu_dm device.
> >   *
> >   * Teardown components within &struct amdgpu_display_manager that require
> >   * cleanup. This involves cleaning up the DRM device, DC, and any modules that
> >
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
