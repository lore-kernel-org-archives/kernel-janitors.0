From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
Date: Tue, 08 Oct 2019 08:06:33 +0000
Subject: Re: [PATCH][next] drm/komeda: remove redundant assignment to pointer disable_done
Message-Id: <20191008080626.GA20953@jamwan02-TSP300>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191004162156.325-1-colin.king@canonical.com>
 <20191004192720.7eiqdvsm2yv62svg@e110455-lin.cambridge.arm.com>
 <35232014-f65a-f7a1-99db-8ed91f610a77@canonical.com>
 <20191007132505.GV22609@kadam>
In-Reply-To: <20191007132505.GV22609@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Colin Ian King <colin.king@canonical.com>, Liviu Dudau <Liviu.Dudau@arm.com>, Brian Starkey <Brian.Starkey@arm.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, nd <nd@arm.com>

On Mon, Oct 07, 2019 at 04:25:05PM +0300, Dan Carpenter wrote:
> On Fri, Oct 04, 2019 at 10:53:44PM +0100, Colin Ian King wrote:
> > On 04/10/2019 20:27, Liviu Dudau wrote:
> > > On Fri, Oct 04, 2019 at 05:21:56PM +0100, Colin King wrote:
> > >> From: Colin Ian King <colin.king@canonical.com>
> > >>
> > >> The pointer disable_done is being initialized with a value that
> > >> is never read and is being re-assigned a little later on. The
> > >> assignment is redundant and hence can be removed.
> > > 
> > > Not really true, isn't it? The re-assignment is done under the condition that
> > > crtc->state->active is true. disable_done will be used regardless after the if
> > > block, so we can't skip this initialisation.
> > > 
> > > Not sure why Coverity flags this, but I would NAK this patch.
> > 
> > I'm patching against the driver from linux-next so I believe this is OK
> > for that. I believe your statement is true against linux which does not
> > have commit:
> > 
> > d6cb013579e743bc7bc5590ca35a1943f2b8f3c8
> > Author: Lowry Li (Arm Technology China) <Lowry.Li@arm.com>
> > Date:   Fri Sep 6 07:18:06 2019 +0000
> > 
> 
> It really does help reviewing patches when this is mentioned in the
> commit message.
> 
> There is some debate about whether this should be mentioned as a Fixes
> since it doesn't fix a bug.  I initialy felt it shouldn't be, but now
> I think enough people think it should be listed as Fixes that I must be
> wrong.  Either way, it's very useful information.
> 
> The other thing is that soon get_maintainer.pl will start CC'ing people
> from the Fixes tag and right now Lowry Li is not CC'd so that's
> unfortunate.
> 
> regards,
> dan carpenter

Hi Liviu:

Colin's code is right.

Following code I copied from linux-next, and I checked drm-misc, the
code are same. 

        struct komeda_pipeline *slave  = kcrtc->slave;
//---- First initialization.
        struct completion *disable_done = &crtc->state->commit->flip_done;
        bool needs_phase2 = false;

        DRM_DEBUG_ATOMIC("CRTC%d_DISABLE: active_pipes: 0x%x, affected: 0x%x\n",
                         drm_crtc_index(crtc),
                         old_st->active_pipes, old_st->affected_pipes);

        if (slave && has_bit(slave->id, old_st->active_pipes))
                komeda_pipeline_disable(slave, old->state);

        if (has_bit(master->id, old_st->active_pipes))
                needs_phase2 = komeda_pipeline_disable(master, old->state);

//---- Secondary initialization.
        disable_done = (needs_phase2 || crtc->state->active) ?
                       NULL : &crtc->state->commit->flip_done;

//--- First using is here.
        /* wait phase 1 disable done */
        komeda_crtc_flush_and_wait_for_flip_done(kcrtc, disable_done);

So the first initialization with the delcaration is unnecessary.

And I also checked our internal testing branch which actually doesn't have
the first initialization. seems somethings wrong when lowry submit this to
upstream.

Hi Colin:

Thanks for the fix. I'll push it to drm-misc-fixes

Reviewed-by: James Qian Wang (Arm Technology China) <james.qian.wang@arm.com>

Best Regards
James
