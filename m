From: Julia Lawall <julia.lawall@lip6.fr>
Date: Tue, 03 Apr 2018 09:41:05 +0000
Subject: Re: [PATCH] drm/amd/display: fix spelling mistake: "Usupported" -> "Unsupported"
Message-Id: <alpine.DEB.2.20.1804031139110.3630@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180330160047.7368-1-colin.king@canonical.com>
 <87tvssaawl.fsf@intel.com>
In-Reply-To: <87tvssaawl.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>, Colin King <colin.king@canonical.com>, =?ISO-8859-15?Q?Christian_K=F6nig?= <christian.koenig@amd.com>



On Tue, 3 Apr 2018, Jani Nikula wrote:

> On Fri, 30 Mar 2018, Colin King <colin.king@canonical.com> wrote:
> > From: Colin Ian King <colin.king@canonical.com>
> >
> > Trivial fix to spelling mistake in DRM_ERROR error message text
>
> Thanks for the patch.
>
> Please do consider limiting the distribution in the future,
> though. There's no need to include lkml or even dri-devel for trivial
> patches like this.

It's complex to have to remember the preferences for every subsystem.
Preferences should be expressed in the MAINTAINERS file in some way.
Also, since no one reads lkml, does it hurt to have even trivial patches?

julia

>
> Thanks,
> Jani.
>
> >
> > Signed-off-by: Colin Ian King <colin.king@canonical.com>
> > ---
> >  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > index e42a28e3adc5..1df1c91b6ae5 100644
> > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > @@ -1521,7 +1521,7 @@ static int amdgpu_dm_initialize_drm_device(struct amdgpu_device *adev)
> >  		break;
> >  #endif
> >  	default:
> > -		DRM_ERROR("Usupported ASIC type: 0x%X\n", adev->asic_type);
> > +		DRM_ERROR("Unsupported ASIC type: 0x%X\n", adev->asic_type);
> >  		goto fail;
> >  	}
> >
> > @@ -1715,7 +1715,7 @@ static int dm_early_init(void *handle)
> >  		break;
> >  #endif
> >  	default:
> > -		DRM_ERROR("Usupported ASIC type: 0x%X\n", adev->asic_type);
> > +		DRM_ERROR("Unsupported ASIC type: 0x%X\n", adev->asic_type);
> >  		return -EINVAL;
> >  	}
>
> --
> Jani Nikula, Intel Open Source Technology Center
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
