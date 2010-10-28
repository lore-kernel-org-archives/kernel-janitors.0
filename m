From: Pavel Machek <pavel@ucw.cz>
Date: Thu, 28 Oct 2010 20:58:31 +0000
Subject: Re: [PATCH 1/8] staging: dream: fix information leak to userland
Message-Id: <20101028205831.GD19421@elf.ucw.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1288296098-18936-1-git-send-email-segooon@gmail.com>
 <20101028204509.GC22785@kroah.com>
In-Reply-To: <20101028204509.GC22785@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg KH <greg@kroah.com>
Cc: Vasiliy Kulikov <segooon@gmail.com>, Iliyan Malchev <ibm@android.com>, Brian Swetland <swetland@google.com>, San Mehat <san@android.com>, kernel-janitors@vger.kernel.org, Tejun Heo <tj@kernel.org>, devel@driverdev.osuosl.org, Greg Kroah-Hartman <gregkh@suse.de>, linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>

Hi!

> > Structure msm_audio_stats is copied to userland with some fields unitialized.
> > It leads to leaking of contents of kernel stack memory.
> > Also struct msm_audio_config has field "unused" of type array of 3 elements,
> > not 4.  Instead of this, initialize field "type".
> > 
> > Signed-off-by: Vasiliy Kulikov <segooon@gmail.com>
> > ---
> >  drivers/staging/dream/qdsp5/audio_aac.c |    3 ++-
> 
> {sigh}
> 
> I'd really like to just drop this whole driver as I feel it's _way_
> behind whatever anyone is really using "in the wild".
> 
> Actually, I doubt that anyone even uses this thing, do they?

Not sure, you should definitely talk to codeaurora folks.

> Any objection to me just dropping the drivers/staging/dream/ tree?
> People should be working on the chipset-specific driver tree here
> instead, right?

codeaurora people should know...

> Pavel, it looks like you're not doing any dream work anymore, any
> problems with me dropping it?

Too busy to do any real work on Dream, sorry :-(.
								Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
