From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 19 Apr 2019 15:05:11 +0000
Subject: Re: [PATCH] drm/amd/amdgpu: fix spelling mistake "recieve" -> "receive"
Message-Id: <CADnq5_PF+1fVOXaZh=F7tw=YzB48b1qHJHW56nEFhvUygQPd0Q@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190418102510.10253-1-colin.king@canonical.com>
 <541d2a2a-bcdf-5c4f-b075-7ca128757a45@codeaurora.org>
In-Reply-To: <541d2a2a-bcdf-5c4f-b075-7ca128757a45@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mukesh Ojha <mojha@codeaurora.org>
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, amd-gfx list <amd-gfx@lists.freedesktop.org>, Maling list - DRI developers <dri-devel@lists.freedesktop.org>, Alex Deucher <alexander.deucher@amd.com>, Colin King <colin.king@canonical.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>

On Thu, Apr 18, 2019 at 1:58 PM Mukesh Ojha <mojha@codeaurora.org> wrote:
>
>
> On 4/18/2019 3:55 PM, Colin King wrote:
> > From: Colin Ian King <colin.king@canonical.com>
> >
> > There is a spelling mistake in a pr_err message. Fix it.
> >
> > Signed-off-by: Colin Ian King <colin.king@canonical.com>
> Reviewed-by: Mukesh Ojha <mojha@codeaurora.org>

Applied.  thanks!

Alex


>
> Cheers,
> -Mukesh
> > ---
> >   drivers/gpu/drm/amd/amdgpu/mxgpu_vi.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/mxgpu_vi.c b/drivers/gpu/drm/amd/amdgpu/mxgpu_vi.c
> > index 6a0fcd67662a..aef9d059ae52 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/mxgpu_vi.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/mxgpu_vi.c
> > @@ -515,7 +515,7 @@ static void xgpu_vi_mailbox_flr_work(struct work_struct *work)
> >
> >       /* wait until RCV_MSG become 3 */
> >       if (xgpu_vi_poll_msg(adev, IDH_FLR_NOTIFICATION_CMPL)) {
> > -             pr_err("failed to recieve FLR_CMPL\n");
> > +             pr_err("failed to receive FLR_CMPL\n");
> >               return;
> >       }
> >
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
