From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Thu, 21 Jan 2021 09:19:46 +0000
Subject: Re: [Intel-gfx] [PATCH] drm/i915/dp: Fix a logical vs bitwise OR bug
Message-Id: <161122078664.32666.16504061212673044761@build.alporthouse.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <YAkaBa22zvbXKd4E@mwanda> <87h7namz5w.fsf@intel.com>
In-Reply-To: <87h7namz5w.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ankit Nautiyal <ankit.k.nautiyal@intel.com>, Dan Carpenter <dan.carpenter@oracle.com>, Jani Nikula <jani.nikula@linux.intel.com>
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, intel-gfx@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>, Sean Paul <seanpaul@chromium.org>, Wambui Karuga <wambui.karugax@gmail.com>

Quoting Jani Nikula (2021-01-21 09:12:27)
> On Thu, 21 Jan 2021, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > This was supposed to be | instead of ||.
> >
> > Fixes: 522508b665df ("drm/i915/display: Let PCON convert from RGB to YCbCr if it can")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> Thanks, but we already have the fix [1] for this that I thought was
> pushed by now [2].
> 
> Chris?

6b20b734bbf1 ("drm/i915/display: Bitwise or the conversion colour specifier together")
in
  remotes/drm-intel/drm-intel-next
  remotes/drm-intel/for-linux-next
should be visible.
-Chris
