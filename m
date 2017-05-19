From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 19 May 2017 19:47:59 +0000
Subject: Re: [PATCH][drm-next] drm/pl111: make structure pl111_display_funcs static
Message-Id: <20170519194759.gfiefx6xwrnrjn3x@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170519110203.19417-1-colin.king@canonical.com>
 <874lwhoxyk.fsf@intel.com>
In-Reply-To: <874lwhoxyk.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Colin King <colin.king@canonical.com>

On Fri, May 19, 2017 at 03:03:31PM +0300, Jani Nikula wrote:
> On Fri, 19 May 2017, Colin King <colin.king@canonical.com> wrote:
> > From: Colin Ian King <colin.king@canonical.com>
> >
> > structure pl111_display_funcs can be made static as it does not need to be
> > in global scope.  Fixes sparse warning:
> >
> > "warning: symbol 'pl111_display_funcs' was not declared. Should it
> > be static?"
> >
> > Fixes: bed41005e6174d ("drm/pl111: Initial drm/kms driver for pl111")
> 
> The patch looks good and I appreciate what you're doing, but I question
> the usefulness of adding Fixes: tags for trivial stuff like this. I'd
> prefer Fixes: was reserved for actual fixes that should be backported to
> any kernels that have the commit being fixed.
> 
> The same applies to many other patches you've sent recently.
> 

The Fixes tag is so so useful for everything.  It should be included
in every bugfix.  (I am the inventor of the Fixes tag).

I told Colin to include the Fixes tag on everything.  My review process
is partly "How was this bug introduced?  How can we prevent it from
happening again?  Who was the original author and have they reviewed the
proposed fix?"  So I end up looking up the original commit anyway.  It
helps me a lot to have the Fixes tag there.

The Fixes tag is obviously useful for the stable people as well, but
that wasn't really the point.

regards,
dan carpenter

