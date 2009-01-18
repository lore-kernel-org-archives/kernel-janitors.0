From: Jaswinder Singh Rajput <jaswinder@kernel.org>
Date: Sun, 18 Jan 2009 16:30:19 +0000
Subject: Re: [PATCH 2/3] drivers/gpu/drm: fix sparse warnings: unexport
Message-Id: <1232295499.24415.11.camel@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090118152725.4179.40835.stgit@vmbox.hanneseder.net>
	 <20090118152848.4179.85741.stgit@vmbox.hanneseder.net>
	 <1232294164.24415.3.camel@localhost.localdomain>
	 <154e089b0901180804k46e9411lcbc10f591871b14@mail.gmail.com>
In-Reply-To: <154e089b0901180804k46e9411lcbc10f591871b14@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hannes Eder <hannes@hanneseder.net>
Cc: dri-devel@lists.sourceforge.net, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Sun, 2009-01-18 at 17:04 +0100, Hannes Eder wrote:
> >>  /**
> >> diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
> >> index 7c36f16..c0cfe39 100644
> >> --- a/drivers/gpu/drm/drm_modes.c
> >> +++ b/drivers/gpu/drm/drm_modes.c
> >> @@ -357,9 +357,9 @@ EXPORT_SYMBOL(drm_mode_validate_size);
> >>   * sure each mode falls within a given range (defined by @min and @max
> >>   * arrays) and sets @mode->status as needed.
> >>   */
> >> -void drm_mode_validate_clocks(struct drm_device *dev,
> >> -                           struct list_head *mode_list,
> >> -                           int *min, int *max, int n_ranges)
> >> +static void drm_mode_validate_clocks(struct drm_device *dev,
> >> +                                  struct list_head *mode_list,
> >> +                                  int *min, int *max, int n_ranges)
> >>  {
> >>       struct drm_display_mode *mode;
> >>       int i;
> >> @@ -376,7 +376,6 @@ void drm_mode_validate_clocks(struct drm_device *dev,
> >>                       mode->status = MODE_CLOCK_RANGE;
> >>       }
> >>  }
> >> -EXPORT_SYMBOL(drm_mode_validate_clocks);
> >
> > ??
> 
> In both cases: a grep over the entire kernel tree shows that the
> function is only used within the compilation unit it is defined,
> therefore make it static and un-EXPORT it.

If it is EXPORTED you cannot make it static. EXPORTED means it can be
used from a kernel module.

you need to define the declaration of these functions on related header
file to fix these sparse warnings.

--
JSR


