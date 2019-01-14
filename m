From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Date: Mon, 14 Jan 2019 10:29:20 +0000
Subject: Re: [PATCH v2] drm/drm_vblank: Change EINVAL by the correct errno
Message-Id: <20190114102920.h5guwpshzludwk2z@smtp.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181015170529.dgzpbm37hbuvqatc@smtp.gmail.com>
 <20181016123541.GW31561@phenom.ffwll.local>
 <20181017124315.khhlykapxnug6ej6@smtp.gmail.com>
 <CAKMK7uF0ucof6gwAiY1SSp5oHt3BZ18Jkui5ugvkZc4u-NOJoA@mail.gmail.com>
 <20190113202323.co7upmn5fg32b7gn@smtp.gmail.com>
 <f4e3966d-bdc5-2816-2e4d-1b9046757b0f@linux.intel.com>
In-Reply-To: <f4e3966d-bdc5-2816-2e4d-1b9046757b0f@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Dave Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <sean@poorly.run>

On 01/14, Maarten Lankhorst wrote:
> Op 13-01-2019 om 21:23 schreef Rodrigo Siqueira:
> > Hi,
> >
> > I resend this patch for CI via “intel-gfx@lists.freedesktop.org” as
> > Daniel suggested, and I got a feedback that reported an issue as can be
> > seen here:
> >
> >    https://patchwork.freedesktop.org/series/51147/
> >
> > After a careful analysis of what happened, I concluded that the problem
> > is related to the function “igt_wait_for_vblank_count()” in “igt_kms.c”.
> > This function has the following assert:
> >
> >    igt_assert(drmWaitVBlank(drm_fd, &wait_vbl) = 0)
> >
> > This function only checks if everything went well with the
> > drmWaitVBlank() operation and does not make any other validation. IMHO
> > the patch is correct, and the problem pointed out by CI is not related
> > to this change.
> 
> Hey,

Hi,

Thanks for the feedback :)

> Thanks for finding the root cause. Before upstreaming can you send a fix for i-g-t so we don't lose CI coverage after changing the behavior?

I'm just confused on my next step, should I fix the IGT test and then
resend the patch? Additionally, I noticed that tests related to vblank
wait have others issues as I pointed out here (see my last message):

	https://patchwork.freedesktop.org/patch/245784/

Is it enough if I handling EINVAL and EOPNOTSUPP in the tests?  I'm
afraid, that the tests will still fail if I consider these two case;
however, I suppose that handling only EOPNOTSUPP can fix the problem,
but I'm not sure if it is the best solution.

Best Regards
 
> ~Maarten
> 
