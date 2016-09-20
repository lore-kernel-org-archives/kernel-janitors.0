From: Jani Nikula <jani.nikula@linux.intel.com>
Date: Tue, 20 Sep 2016 12:08:45 +0000
Subject: Re: [PATCH 5/6] GPU-DRM-GMA500: One error message less for a GCT revision mismatch in mid_get_vbt_da
Message-Id: <87k2e6lqnm.fsf@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net> <3c9785ef-4553-2e3d-2cb2-5cf6d1f31ccd@users.sourceforge.net> <287833f5-f1ad-b7f0-c614-d4c903b1c890@users.sourceforge.net> <87shsulw9k.fsf@intel.com> <20160920104855.GJ13620@mwanda>
In-Reply-To: <20160920104855.GJ13620@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: SF Markus Elfring <elfring@users.sourceforge.net>, dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, Patrik Jakobsson <patrik.r.jakobsson@gmail.com>, Julia Lawall <julia.lawall@lip6.fr>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Tue, 20 Sep 2016, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> Don't be a dummy...  This is easy to review an it fixes a bug.
>
> I'm fine with you NAKing all these patches based on who they are from.
> I mostly just delete these without responding because the guy has
> history of introducing bugs and never listens to feedback.  But asking
> pointless rhetorical questions is not helpful.
>
> A lot of people are CC'd and you're wasting everyone's time by asking
> questions where you know the answer.

Fair enough, sorry for the noise.

To be honest, I did only look at the patches, not who they were from. We
have CI for drm/i915, but I don't think it's constructive to keep
changing drivers like this where the upstream isn't actively developed
and tested. But I digress. It's up to Patrik anyway.

BR,
Jani.



-- 
Jani Nikula, Intel Open Source Technology Center
