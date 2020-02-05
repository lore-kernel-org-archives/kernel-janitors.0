From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 05 Feb 2020 19:43:11 +0000
Subject: Re: [PATCH] drm/amd/display: Fix some use after free bugs
Message-Id: <CADnq5_PF2ofuZM9NNeDoWHo-atHQd=ExcWNFDg9yCC9R4v9Tuw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200205183714.6t5c7ewyovwjicm6@kili.mountain>
 <b9a18739-cada-05e8-d894-be8dcba9fb43@amd.com>
In-Reply-To: <b9a18739-cada-05e8-d894-be8dcba9fb43@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bhawanpreet Lakha <Bhawanpreet.lakha@amd.com>
Cc: "David (ChunMing) Zhou" <David1.Zhou@amd.com>, Leo Li <sunpeng.li@amd.com>, Zhan Liu <zhan.liu@amd.com>, kernel-janitors@vger.kernel.org, amd-gfx list <amd-gfx@lists.freedesktop.org>, zhengbin <zhengbin13@huawei.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Harry Wentland <harry.wentland@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, Dan Carpenter <dan.carpenter@oracle.com>

Applied.  Thanks!

Alex

On Wed, Feb 5, 2020 at 1:44 PM Bhawanpreet Lakha
<Bhawanpreet.lakha@amd.com> wrote:
>
> Reviewed-by: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
>
> On 2020-02-05 1:38 p.m., Dan Carpenter wrote:
> > These frees need to be re-ordered so that we don't dereference "hdcp_work"
> > right after it's freed.  Also in hdcp_create_workqueue() there is a
> > problem that "hdcp_work" can be NULL if the allocation fails so it would
> > lead to a NULL dereference in the cleanup code.
> >
> > Fixes: 9aeb8a134a0a ("drm/amd/display: Add sysfs interface for set/get srm")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> >   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c | 9 +++++----
> >   1 file changed, 5 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c
> > index 1768a33b1dc3..f3330df782a4 100644
> > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c
> > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c
> > @@ -380,9 +380,9 @@ void hdcp_destroy(struct hdcp_workqueue *hdcp_work)
> >               cancel_delayed_work_sync(&hdcp_work[i].watchdog_timer_dwork);
> >       }
> >
> > -     kfree(hdcp_work);
> >       kfree(hdcp_work->srm);
> >       kfree(hdcp_work->srm_temp);
> > +     kfree(hdcp_work);
> >   }
> >
> >   static void update_config(void *handle, struct cp_psp_stream_config *config)
> > @@ -555,11 +555,12 @@ struct hdcp_workqueue *hdcp_create_workqueue(struct amdgpu_device *adev, struct
> >   {
> >
> >       int max_caps = dc->caps.max_links;
> > -     struct hdcp_workqueue *hdcp_work = kzalloc(max_caps*sizeof(*hdcp_work), GFP_KERNEL);
> > +     struct hdcp_workqueue *hdcp_work;
> >       int i = 0;
> >
> > +     hdcp_work = kcalloc(max_caps, sizeof(*hdcp_work), GFP_KERNEL);
> >       if (hdcp_work = NULL)
> > -             goto fail_alloc_context;
> > +             return NULL;
> >
> >       hdcp_work->srm = kcalloc(PSP_HDCP_SRM_FIRST_GEN_MAX_SIZE, sizeof(*hdcp_work->srm), GFP_KERNEL);
> >
> > @@ -602,9 +603,9 @@ struct hdcp_workqueue *hdcp_create_workqueue(struct amdgpu_device *adev, struct
> >       return hdcp_work;
> >
> >   fail_alloc_context:
> > -     kfree(hdcp_work);
> >       kfree(hdcp_work->srm);
> >       kfree(hdcp_work->srm_temp);
> > +     kfree(hdcp_work);
> >
> >       return NULL;
> >
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
