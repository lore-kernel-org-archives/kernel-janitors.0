From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 02 Dec 2019 21:25:09 +0000
Subject: Re: [PATCH][next] drm/amd/display: fix double assignment to msg_id field
Message-Id: <CADnq5_NLq7HJ6OAAW6yO9G6NC9Ytpd7mzG8TrRmsLsvHbO9wWg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191120172242.347072-1-colin.king@canonical.com>
 <9056b19a-f63c-8fc0-d2f7-6df3a20c95a7@amd.com>
In-Reply-To: <9056b19a-f63c-8fc0-d2f7-6df3a20c95a7@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Harry Wentland <hwentlan@amd.com>
Cc: David Zhou <David1.Zhou@amd.com>, Leo Li <sunpeng.li@amd.com>, Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, amd-gfx list <amd-gfx@lists.freedesktop.org>, David Airlie <airlied@linux.ie>, Maling list - DRI developers <dri-devel@lists.freedesktop.org>, Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>, Colin King <colin.king@canonical.com>, Harry Wentland <harry.wentland@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>

Applied.  thanks!

Alex

On Wed, Nov 27, 2019 at 11:51 AM Harry Wentland <hwentlan@amd.com> wrote:
>
> On 2019-11-20 12:22 p.m., Colin King wrote:
> > From: Colin Ian King <colin.king@canonical.com>
> >
> > The msg_id field is being assigned twice. Fix this by replacing the second
> > assignment with an assignment to msg_size.
> >
> > Addresses-Coverity: ("Unused value")
> > Fixes: 11a00965d261 ("drm/amd/display: Add PSP block to verify HDCP2.2 steps")
> > Signed-off-by: Colin Ian King <colin.king@canonical.com>
>
> Reviewed-by: Harry Wentland <harry.wentland>
>
> Harry
>
> > ---
> >  drivers/gpu/drm/amd/display/modules/hdcp/hdcp_psp.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/amd/display/modules/hdcp/hdcp_psp.c b/drivers/gpu/drm/amd/display/modules/hdcp/hdcp_psp.c
> > index 2dd5feec8e6c..6791c5844e43 100644
> > --- a/drivers/gpu/drm/amd/display/modules/hdcp/hdcp_psp.c
> > +++ b/drivers/gpu/drm/amd/display/modules/hdcp/hdcp_psp.c
> > @@ -42,7 +42,7 @@ static void hdcp2_message_init(struct mod_hdcp *hdcp,
> >       in->process.msg2_desc.msg_id = TA_HDCP_HDCP2_MSG_ID__NULL_MESSAGE;
> >       in->process.msg2_desc.msg_size = 0;
> >       in->process.msg3_desc.msg_id = TA_HDCP_HDCP2_MSG_ID__NULL_MESSAGE;
> > -     in->process.msg3_desc.msg_id = 0;
> > +     in->process.msg3_desc.msg_size = 0;
> >  }
> >  enum mod_hdcp_status mod_hdcp_remove_display_topology(struct mod_hdcp *hdcp)
> >  {
> >
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
