From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 23 Mar 2020 12:13:33 +0000
Subject: Re: [PATCH] drm/gem: Fix a leak in drm_gem_objects_lookup()
Message-Id: <20200323121333.GF26299@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200320132334.GC95012@mwanda>
 <CACvgo51xwgF2hJPOESWGpJ16WittQSVixdd+62KwFsZaHO-Dpg@mail.gmail.com>
In-Reply-To: <CACvgo51xwgF2hJPOESWGpJ16WittQSVixdd+62KwFsZaHO-Dpg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Emil Velikov <emil.l.velikov@gmail.com>
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, ML dri-devel <dri-devel@lists.freedesktop.org>, Thomas Zimmermann <tzimmermann@suse.de>

On Mon, Mar 23, 2020 at 11:13:22AM +0000, Emil Velikov wrote:
> Hi Dan,
> 
> On Fri, 20 Mar 2020 at 13:23, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> >
> > If the "handles" allocation or the copy_from_user() fails then we leak
> > "objs".  It's supposed to be freed in panfrost_job_cleanup().
> >
> > Fixes: c117aa4d8701 ("drm: Add a drm_gem_objects_lookup helper")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> >  drivers/gpu/drm/drm_gem.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> > index a9e4a610445a..f28724f2eb69 100644
> > --- a/drivers/gpu/drm/drm_gem.c
> > +++ b/drivers/gpu/drm/drm_gem.c
> > @@ -710,6 +710,8 @@ int drm_gem_objects_lookup(struct drm_file *filp, void __user *bo_handles,
> >         if (!objs)
> >                 return -ENOMEM;
> >
> > +       *objs_out = objs;
> > +
> >         handles = kvmalloc_array(count, sizeof(u32), GFP_KERNEL);
> >         if (!handles) {
> >                 ret = -ENOMEM;
> > @@ -723,8 +725,6 @@ int drm_gem_objects_lookup(struct drm_file *filp, void __user *bo_handles,
> >         }
> >
> >         ret = objects_lookup(filp, handles, count, objs);
> > -       *objs_out = objs;
> > -
> >  out:
> >         kvfree(handles);
> >         return ret;
> 
> It seems that this will return error to the caller, mangle the output
> pointer and effectively still leak the objs.

The patch works.

This is "one function frees everything" style error handling.  It gets
passed back to panfrost_ioctl_submit() which calls panfrost_job_put()
which calls panfrost_job_cleanup() which frees it.

It's a horrible way to do error handling but this was the only actual
bug I could see with the approach.

> Better option IMHO is to:
> - move the __user/copy_from_user into the caller
> Removes a silly kvmalloc_array(1,...) in ~90+ users and drops the "out" label.
> Extra bonus, this is the only instance in drm_gem with __user -
> consistency is nice.
> - add "err" or similar label, where the objs is freed before returning an error.

Those sound like good ideas.  Also we could use kvcalloc() instead of
kvmalloc_array() with __GFP_ZERO.  But it's too much for me to do...
I'm mostly focused on static analysis warnings.

regards,
dan carpenter
