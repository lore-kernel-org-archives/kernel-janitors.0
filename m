From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 24 Jun 2019 09:48:50 +0000
Subject: Re: [PATCH -next v3] drm/amdgpu: return 'ret' immediately if failed in amdgpu_pmu_init
Message-Id: <20190624094850.GQ18776@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.DEB.2.21.1906230809400.4961@hadrien>
 <20190624034532.135201-1-maowenan@huawei.com>
 <20190624083952.GO18776@kadam>
 <4795ba5c-8e41-e1e0-c96a-47fdda3995e3@huawei.com>
In-Reply-To: <4795ba5c-8e41-e1e0-c96a-47fdda3995e3-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: maowenan <maowenan-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Cc: David1.Zhou-5C7GfCeVMHo@public.gmane.org, jonathan.kim-5C7GfCeVMHo@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, julia.lawall-L2FTfq7BK8M@public.gmane.org, daniel-/w4YWyX8dFk@public.gmane.org, alexander.deucher-5C7GfCeVMHo@public.gmane.org, Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>, christian.koenig-5C7GfCeVMHo@public.gmane.org

On Mon, Jun 24, 2019 at 05:29:33PM +0800, maowenan wrote:
> 
> 
> On 2019/6/24 16:39, Dan Carpenter wrote:
> > On Mon, Jun 24, 2019 at 11:45:32AM +0800, Mao Wenan wrote:
> >> There is one warning:
> >> drivers/gpu/drm/amd/amdgpu/amdgpu_pmu.c: In function ‘amdgpu_pmu_init’:
> >> drivers/gpu/drm/amd/amdgpu/amdgpu_pmu.c:249:6: warning: variable ‘ret’ set but not used [-Wunused-but-set-variable]
> >>   int ret = 0;
> >>       ^
> >> amdgpu_pmu_init() is called by amdgpu_device_init() in drivers/gpu/drm/amd/amdgpu/amdgpu_device.c,
> >> which will use the return value. So it should return 'ret' immediately if init_pmu_by_type() failed.
> >> amdgpu_device_init()
> >> 	r = amdgpu_pmu_init(adev);
> >>
> >> This patch is also to update the indenting on the arguments so they line up with the '('.
> >>
> >> Fixes: 9c7c85f7ea1f ("drm/amdgpu: add pmu counters")
> >>
> >> Signed-off-by: Mao Wenan <maowenan@huawei.com>
> >> ---
> >>  v1->v2: change the subject for this patch; change the indenting when it calls init_pmu_by_type; use the value 'ret' in
> >>  amdgpu_pmu_init().
> >>  v2->v3: change the subject for this patch; return 'ret' immediately if failed to call init_pmu_by_type(). 
> >>
> >>  drivers/gpu/drm/amd/amdgpu/amdgpu_pmu.c | 7 +++++--
> >>  1 file changed, 5 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_pmu.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_pmu.c
> >> index 0e6dba9..b702322 100644
> >> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_pmu.c
> >> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_pmu.c
> >> @@ -252,8 +252,11 @@ int amdgpu_pmu_init(struct amdgpu_device *adev)
> >>  	case CHIP_VEGA20:
> >>  		/* init df */
> >>  		ret = init_pmu_by_type(adev, df_v3_6_attr_groups,
> >> -				       "DF", "amdgpu_df", PERF_TYPE_AMDGPU_DF,
> >> -				       DF_V3_6_MAX_COUNTERS);
> >> +							   "DF", "amdgpu_df",
> >> +							   PERF_TYPE_AMDGPU_DF,
> >> +							   DF_V3_6_MAX_COUNTERS);
> >> +		if (ret)
> >> +			return ret;
> > 
> > No no.  Sorry, the original indenting was correct and lined up with the
> > '(' character in 'init_pmu_by_type(', that's the way it should be.  If
> > we were to remove the "ret = " then we'd have to pull the arguments back
> > as well.  I think this fix that Julia suggested is really the right so
> > leave the indenting alone.
> > 
> 
> > It looks like you've right aligned the arguments.  That's not the right
> > way, the original was correct.
> > 
> After using 8 character for tab(thanks to Joe), the aligned here is wrong, yes, the original was correct.
> 
> so my v4 is only to change ret, don't change the indenting?
> 

Yes, please.  Sorry for my confusing email earlier.

regards,
dan carpenter
