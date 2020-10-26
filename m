From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 26 Oct 2020 09:46:48 +0000
Subject: Re: [PATCH] drm/v3d: Fix double free in v3d_submit_cl_ioctl()
Message-Id: <20201026094648.GH18329@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191024205306.GA14416@mwanda>
 <20191025090956.0bd40095@canb.auug.org.au>
In-Reply-To: <20191025090956.0bd40095@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Eric Anholt <eric@anholt.duckdns.org>, David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

On Fri, Oct 25, 2019 at 09:09:56AM +1100, Stephen Rothwell wrote:
> Hi Dan,
> 
> On Thu, 24 Oct 2019 23:53:06 +0300 Dan Carpenter <dan.carpenter@oracle.com> wrote:
> >
> > Originally this error path used to leak "bin" but then we accidentally
> > applied two separate commits to fix it and ended up with a double free.
> > 
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> > Hi Stephen,
> > 
> > I think this one is actually just a linux-next issue and the Fixes tag
> > would point to commit f8593384f83f ("Merge remote-tracking branch
> > 'drm/drm-next'").
> > 
> > The original commits are 0d352a3a8a1f ("drm/v3d: don't leak bin job if
> > v3d_job_init fails.") and commit 29cd13cfd762 ("drm/v3d: Fix memory leak
> > in v3d_submit_cl_ioctl").
> > 
> > I'm not totally sure how you guys address this normally but presumably
> > you are experts at dealing with merge issues.  :)
> > 
> >  drivers/gpu/drm/v3d/v3d_gem.c | 1 -
> >  1 file changed, 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
> > index 549dde83408b..37515e47b47e 100644
> > --- a/drivers/gpu/drm/v3d/v3d_gem.c
> > +++ b/drivers/gpu/drm/v3d/v3d_gem.c
> > @@ -568,7 +568,6 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void *data,
> >  		ret = v3d_job_init(v3d, file_priv, &bin->base,
> >  				   v3d_job_free, args->in_sync_bcl);
> >  		if (ret) {
> > -			kfree(bin);
> >  			v3d_job_put(&render->base);
> >  			kfree(bin);
> >  			return ret;
> 
> I will just apply this as part of the drm tree merge until Dave merges
> the drm-misc-fixes tree and fixes this up.
> 

It turns out that Dave never fixed it.  Let me resend.

regards,
dan carpenter
