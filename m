From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sun, 23 Jun 2019 06:00:27 +0000
Subject: Re: [PATCH -next] drm/amdgpu: remove set but not used variables 'ret'
Message-Id: <20190623060027.GU28859@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190622030314.169640-1-maowenan@huawei.com>
 <20190622104318.GT28859@kadam>
In-Reply-To: <20190622104318.GT28859@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mao Wenan <maowenan-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Cc: David1.Zhou-5C7GfCeVMHo@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, daniel-/w4YWyX8dFk@public.gmane.org, alexander.deucher-5C7GfCeVMHo@public.gmane.org, christian.koenig-5C7GfCeVMHo@public.gmane.org

On Sat, Jun 22, 2019 at 01:43:19PM +0300, Dan Carpenter wrote:
> On Sat, Jun 22, 2019 at 11:03:14AM +0800, Mao Wenan wrote:
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_pmu.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_pmu.c
> > index 0e6dba9..0bf4dd9 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_pmu.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_pmu.c
> > @@ -246,12 +246,10 @@ static int init_pmu_by_type(struct amdgpu_device *adev,
> >  /* init amdgpu_pmu */
> >  int amdgpu_pmu_init(struct amdgpu_device *adev)
> >  {
> > -	int ret = 0;
> > -
> >  	switch (adev->asic_type) {
> >  	case CHIP_VEGA20:
> >  		/* init df */
> > -		ret = init_pmu_by_type(adev, df_v3_6_attr_groups,
> > +		init_pmu_by_type(adev, df_v3_6_attr_groups,
> >  				       "DF", "amdgpu_df", PERF_TYPE_AMDGPU_DF,
> >  				       DF_V3_6_MAX_COUNTERS);
> 
> 
> You're resending this for other reasons, but don't forget to update the
> indenting on the arguments so they still line up with the '('.
> 

Sorry, I was unclear.  If you pull the init_pmu_by_type( back 6
characters then you also need to pull the "DF" back 6 characters.

		init_pmu_by_type(adev, df_v3_6_attr_groups, "DF", "amdgpu_df",
				 PERF_TYPE_AMDGPU_DF, DF_V3_6_MAX_COUNTERS);

You can actually fit it into two lines afterwards.

regards,
dan carpenter
