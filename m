From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 19 May 2017 19:40:02 +0000
Subject: Re: [PATCH][drm-next] drm/pl111: make structure pl111_display_funcs static
Message-Id: <20170519194002.iupbqmctj7vesd2q@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170519110203.19417-1-colin.king@canonical.com>
 <874lwhoxyk.fsf@intel.com> <87mva8g160.fsf@eliezer.anholt.net>
In-Reply-To: <87mva8g160.fsf@eliezer.anholt.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Eric Anholt <eric@anholt.net>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Colin King <colin.king@canonical.com>

On Fri, May 19, 2017 at 11:19:03AM -0700, Eric Anholt wrote:
> Jani Nikula <jani.nikula@linux.intel.com> writes:
> 
> > On Fri, 19 May 2017, Colin King <colin.king@canonical.com> wrote:
> >> From: Colin Ian King <colin.king@canonical.com>
> >>
> >> structure pl111_display_funcs can be made static as it does not need to be
> >> in global scope.  Fixes sparse warning:
> >>
> >> "warning: symbol 'pl111_display_funcs' was not declared. Should it
> >> be static?"
> >>
> >> Fixes: bed41005e6174d ("drm/pl111: Initial drm/kms driver for pl111")
> >
> > The patch looks good and I appreciate what you're doing, but I question
> > the usefulness of adding Fixes: tags for trivial stuff like this. I'd
> > prefer Fixes: was reserved for actual fixes that should be backported to
> > any kernels that have the commit being fixed.
> 
> Agreed -- since Fixes implies going to stable, we don't want it on
> non-stable-candidates like this.  Reviewed these two and will push
> without the tag in a moment.

Fixes does NOT imply that it goes to stable.  Only a
Cc: <stable@vger.kernel.org> implies that.

Fixes is purely informational to show where the bug was introduced.
Just today I was using it to see if API changes introduce a bugs that
take months to fix.

regards,
dan carpenter
