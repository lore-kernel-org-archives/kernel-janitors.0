From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 05 May 2015 07:27:14 +0000
Subject: Re: [PATCH v2] drm: fix a memleak on mutex failure path
Message-Id: <20150505072714.GY30184@phenom.ffwll.local>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1430149006-3753-1-git-send-email-green@linuxhacker.ru>
 <87h9s0btol.fsf@intel.com>
In-Reply-To: <87h9s0btol.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, green@linuxhacker.ru

On Tue, Apr 28, 2015 at 10:25:46AM +0300, Jani Nikula wrote:
> On Mon, 27 Apr 2015, green@linuxhacker.ru wrote:
> > From: Oleg Drokin <green@linuxhacker.ru>
> >
> > Need to free just allocated ctx allocation if we cannot
> > get our config mutex.
> >
> > This one has been flagged by kbuild bot all the way back in August,
> > but somehow nobody picked it up:
> > https://lists.01.org/pipermail/kbuild/2014-August/001691.html
> >
> > In addition there is another failure path that leaks the same
> > ctx reference that is fixed.
> >
> > Found with smatch.
> >
> > Signed-off-by: Oleg Drokin <green@linuxhacker.ru>
> > CC: Daniel Vetter <daniel.vetter@ffwll.ch>
> 
> Reviewed-by: Jani Nikula <jani.nikula@intel.com>

Applied to topic/drm-misc, thanks.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
