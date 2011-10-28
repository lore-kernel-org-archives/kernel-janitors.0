From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Fri, 28 Oct 2011 17:20:20 +0000
Subject: Re: [patch] drm/i915: fix if statement (bogus semi-colon)
Message-Id: <f80fcd$2bbqtl@fmsmga001.fm.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20111028114241.GA13603@elgon.mountain> <yund3dh9h4t.fsf@aiko.keithp.com>
In-Reply-To: <yund3dh9h4t.fsf@aiko.keithp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Keith Packard <keithp@keithp.com>, Dan Carpenter <dan.carpenter@oracle.com>, David Airlie <airlied@linux.ie>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, 28 Oct 2011 10:10:26 -0700, Keith Packard <keithp@keithp.com> wrote:
> On Fri, 28 Oct 2011 14:42:41 +0300, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> 
> > -	if (needs_idle_maps());
> > +	if (needs_idle_maps())
> 
> how embarrassing is that?

Actually it served an ulterior purpose and by exercising the workaround
showed us that it contained a more subtle bug. I believe therefore Ben
did it deliberately ;-)
-Chris

-- 
Chris Wilson, Intel Open Source Technology Centre
