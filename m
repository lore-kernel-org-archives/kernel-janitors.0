From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 23 May 2017 13:01:29 +0000
Subject: Re: [PATCH][drm-next] drm/pl111: make structure pl111_display_funcs static
Message-Id: <20170523130129.fjiiyogouehq6e4t@phenom.ffwll.local>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170519110203.19417-1-colin.king@canonical.com>
 <874lwhoxyk.fsf@intel.com> <20170519194759.gfiefx6xwrnrjn3x@mwanda>
 <874lwg8v9n.fsf@eliezer.anholt.net>
 <20170519201641.fwnoakx5gew7wo5t@mwanda> <871srgouhd.fsf@intel.com>
 <20170523083122.5xgb5vuy3sdvjlbp@mwanda>
In-Reply-To: <20170523083122.5xgb5vuy3sdvjlbp@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Colin King <colin.king@canonical.com>, dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, May 23, 2017 at 11:31:22AM +0300, Dan Carpenter wrote:
> On Tue, May 23, 2017 at 11:19:58AM +0300, Jani Nikula wrote:
> > On Fri, 19 May 2017, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > > On Fri, May 19, 2017 at 01:08:20PM -0700, Eric Anholt wrote:
> > >> OK, that's definitely not how I've read the
> > >> Documentation/process/submitting-patches.rst description of the Fixes
> > >> tag, which talks about bugs found with git bisect and things that should
> > >> go to -stable.  I would not have considered what this patch is changing
> > >> to be a bug.
> > >
> > > True.  I don't consider this a bug either.  I wouldn't have included a
> > > Fixes tag.
> > >
> > > I pretty much agree with the submitting-patches.rst except it should
> > > probably say to include it on more stuff.  Fixes: tags are required for
> > > all bugfixes to netdev for example.
> > 
> > We use Fixes: in drm/i915 to basically indicate that the referenced
> > commit has a bug that actually needs to be fixed, this patch is the fix,
> > and should go wherever the referenced commit goes. Annotating typo fixes
> > and missing static keywords and such is just noise from *our* POV, and
> > need to be filtered out.
> 
> Yes, yes.  I agree.  Fixes should fix a bug.  I'm sorry, I didn't read
> the original patch carefully, I just saw that people said Fixes meant
> backporting to -stable.

Yeah we use Fixes: a lot, also to help all our product teams, who have all
varying versions of frankenstein kernels. If they cherry-pick some feature
from upstream, they need to know which bugfixes to backport. cc: stable is
orthogonal to Fixes:, but Fixes should imo indicate a real bugfix (i.e. if
you have the first patch, you want all the patches with Fixes: lines
referencing that patch).

Unfortunately on the mobile/gfx side there's very few customers who just
use a stable release, so we need to be rather dutiful with sprinkling
Fixes: tags over everything that fixes bugs (but not more, otherwise
there's screaming about backporting too much).
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
