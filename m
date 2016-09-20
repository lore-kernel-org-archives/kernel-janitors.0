From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Tue, 20 Sep 2016 20:23:17 +0000
Subject: Re: [PATCH 5/6] GPU-DRM-GMA500: One error message less for a GCT revision mismatch in mid_get_vbt_da
Message-Id: <CAMeQTsYsx7hbbcz_1VXAf=SmGeoSx_OCJeyzAfvymny+nAxxWw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net> <3c9785ef-4553-2e3d-2cb2-5cf6d1f31ccd@users.sourceforge.net>
 <287833f5-f1ad-b7f0-c614-d4c903b1c890@users.sourceforge.net>
 <87shsulw9k.fsf@intel.com> <20160920104855.GJ13620@mwanda> <87k2e6lqnm.fsf@intel.com>
In-Reply-To: <87k2e6lqnm.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, SF Markus Elfring <elfring@users.sourceforge.net>, dri-devel <dri-devel@lists.freedesktop.org>, Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, Julia Lawall <julia.lawall@lip6.fr>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Tue, Sep 20, 2016 at 2:08 PM, Jani Nikula
<jani.nikula@linux.intel.com> wrote:
> On Tue, 20 Sep 2016, Dan Carpenter <dan.carpenter@oracle.com> wrote:
>> Don't be a dummy...  This is easy to review an it fixes a bug.

In this particular case it might not be clear that an unknown GCT
version causes a complete GCT failure so both messages are useful.

>>
>> I'm fine with you NAKing all these patches based on who they are from.
>> I mostly just delete these without responding because the guy has
>> history of introducing bugs and never listens to feedback.  But asking
>> pointless rhetorical questions is not helpful.
>>
>> A lot of people are CC'd and you're wasting everyone's time by asking
>> questions where you know the answer.
>
> Fair enough, sorry for the noise.
>
> To be honest, I did only look at the patches, not who they were from. We
> have CI for drm/i915, but I don't think it's constructive to keep
> changing drivers like this where the upstream isn't actively developed
> and tested. But I digress. It's up to Patrik anyway.

Nothing in this series is very helpful so NAK. In general I'm not fond
of trivial changes like this since it's hard to say what motivates the
author. In theory it shouldn't matter but so far it's been directly
related to the quality of the patches. I can help test changes for
gma500 if needed but please make it worth my while.

Best regards
Patrik

>
> BR,
> Jani.
>
>
>
> --
> Jani Nikula, Intel Open Source Technology Center
