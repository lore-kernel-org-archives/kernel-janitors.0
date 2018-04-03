From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 03 Apr 2018 10:02:08 +0000
Subject: Re: [PATCH] drm/amd/display: fix spelling mistake: "Usupported" -> "Unsupported"
Message-Id: <20180403100207.ve3r6aluj6udilie@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180330160047.7368-1-colin.king@canonical.com>
 <87tvssaawl.fsf@intel.com>
 <alpine.DEB.2.20.1804031139110.3630@hadrien>
In-Reply-To: <alpine.DEB.2.20.1804031139110.3630@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>, Colin King <colin.king@canonical.com>, Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>

On Tue, Apr 03, 2018 at 11:41:05AM +0200, Julia Lawall wrote:
> 
> 
> On Tue, 3 Apr 2018, Jani Nikula wrote:
> 
> > On Fri, 30 Mar 2018, Colin King <colin.king@canonical.com> wrote:
> > > From: Colin Ian King <colin.king@canonical.com>
> > >
> > > Trivial fix to spelling mistake in DRM_ERROR error message text
> >
> > Thanks for the patch.
> >
> > Please do consider limiting the distribution in the future,
> > though. There's no need to include lkml or even dri-devel for trivial
> > patches like this.
> 
> It's complex to have to remember the preferences for every subsystem.
> Preferences should be expressed in the MAINTAINERS file in some way.
> Also, since no one reads lkml, does it hurt to have even trivial patches?

I always tell people not to CC lkml when there is a smaller subsystem
list which can handle it but Linus said my advice was bad.

regards,
dan carpenter

