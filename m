From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 16 Jun 2016 07:54:10 +0000
Subject: Re: [patch] drm/amdgpu: missing bounds check in amdgpu_set_pp_force_state()
Message-Id: <20160616075410.GH32247@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160616064119.GA23129@mwanda>
 <5762548B.6060906@bfs.de>
In-Reply-To: <5762548B.6060906@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: walter harms <wharms@bfs.de>
Cc: Jammy Zhou <Jammy.Zhou@amd.com>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, Eric Huang <JinHuiEric.Huang@amd.com>, Alex Deucher <alexander.deucher@amd.com>, Rex Zhu <Rex.Zhu@amd.com>, Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>

On Thu, Jun 16, 2016 at 09:26:03AM +0200, walter harms wrote:
> 
> 
> Am 16.06.2016 08:41, schrieb Dan Carpenter:
> > There is no limit on high "idx" can go.  It should be less than
> > ARRAY_SIZE(data.states) which is 16.
> > 
> > The "data" variable wasn't declared in that scope so I shifted the code
> > around a bit to make it work.
> > 
> > Fixes: f3898ea12fc1 ('drm/amd/powerplay: add some sysfs interfaces for powerplay.')
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > 
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
> > index 589b36e..ce9e97f 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
> > @@ -275,25 +275,23 @@ static ssize_t amdgpu_set_pp_force_state(struct device *dev,
> >  
> >  	if (strlen(buf) = 1)
> >  		adev->pp_force_state_enabled = false;
> > -	else {
> > -		ret = kstrtol(buf, 0, &idx);
> > +	else if (adev->pp_enabled) {
> > +		struct pp_states_info data;
> >  
> > -		if (ret) {
> > +		ret = kstrtol(buf, 0, &idx);
> > +		if (ret || idx >= ARRAY_SIZE(data.states)) {
> >  			count = -EINVAL;
> >  			goto fail;
> >  		}
> 
> 
> i would also expect a check idx < 0, does it mean this can not happen ?
> otherwise maybe kstrtoul is a solution ?

The original code could underflow, but my code can't.  ARRAY_SIZE()
means the comparison is type promoted to size_t which is unsigned long.

regards,
dan carpenter

