From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 07 Oct 2019 13:25:05 +0000
Subject: Re: [PATCH][next] drm/komeda: remove redundant assignment to pointer disable_done
Message-Id: <20191007132505.GV22609@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191004162156.325-1-colin.king@canonical.com>
 <20191004192720.7eiqdvsm2yv62svg@e110455-lin.cambridge.arm.com>
 <35232014-f65a-f7a1-99db-8ed91f610a77@canonical.com>
In-Reply-To: <35232014-f65a-f7a1-99db-8ed91f610a77@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin Ian King <colin.king@canonical.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>, James Wang <james.qian.wang@arm.com>, Brian Starkey <brian.starkey@arm.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Oct 04, 2019 at 10:53:44PM +0100, Colin Ian King wrote:
> On 04/10/2019 20:27, Liviu Dudau wrote:
> > On Fri, Oct 04, 2019 at 05:21:56PM +0100, Colin King wrote:
> >> From: Colin Ian King <colin.king@canonical.com>
> >>
> >> The pointer disable_done is being initialized with a value that
> >> is never read and is being re-assigned a little later on. The
> >> assignment is redundant and hence can be removed.
> > 
> > Not really true, isn't it? The re-assignment is done under the condition that
> > crtc->state->active is true. disable_done will be used regardless after the if
> > block, so we can't skip this initialisation.
> > 
> > Not sure why Coverity flags this, but I would NAK this patch.
> 
> I'm patching against the driver from linux-next so I believe this is OK
> for that. I believe your statement is true against linux which does not
> have commit:
> 
> d6cb013579e743bc7bc5590ca35a1943f2b8f3c8
> Author: Lowry Li (Arm Technology China) <Lowry.Li@arm.com>
> Date:   Fri Sep 6 07:18:06 2019 +0000
> 

It really does help reviewing patches when this is mentioned in the
commit message.

There is some debate about whether this should be mentioned as a Fixes
since it doesn't fix a bug.  I initialy felt it shouldn't be, but now
I think enough people think it should be listed as Fixes that I must be
wrong.  Either way, it's very useful information.

The other thing is that soon get_maintainer.pl will start CC'ing people
from the Fixes tag and right now Lowry Li is not CC'd so that's
unfortunate.

regards,
dan carpenter
