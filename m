From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 25 Feb 2015 13:54:53 +0000
Subject: Re: [Intel-gfx] [patch] drm/i915: cleanup some indenting
Message-Id: <20150225135453.GP24485@phenom.ffwll.local>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150225131748.GE19745@mwanda>
 <87oaoinmqm.fsf@intel.com>
In-Reply-To: <87oaoinmqm.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>, Dan Carpenter <dan.carpenter@oracle.com>

On Wed, Feb 25, 2015 at 03:29:05PM +0200, Jani Nikula wrote:
> On Wed, 25 Feb 2015, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > Static checkers complain that we should probably add curly braces
> > because, from the indenting, it looks like seq_printf() should be inside
> > the list_for_each_entry() loop.  But the code is actually correct, it's
> > just the indenting which is off.
> >
> > Besides fixing the indenting on seq_printf(), I did add curly braces,
> > because generally mult-line indents should have curly braces to make
> > them more readable.
> >
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> The unintended indent was left behind and not unindented in
> 
> commit d7f46fc4e7323887494db13f063a8e59861fefb0
> Author: Ben Widawsky <benjamin.widawsky@intel.com>
> Date:   Fri Dec 6 14:10:55 2013 -0800
> 
>     drm/i915: Make pin count per VMA

Added to the commit message.
> 
> Reviewed-by: Jani Nikula <jani.nikula@intel.com>

Queued for -next, thanks for the patch.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
