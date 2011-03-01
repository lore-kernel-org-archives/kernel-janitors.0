From: Greg KH <gregkh@suse.de>
Date: Tue, 01 Mar 2011 14:19:49 +0000
Subject: Re: [patch] staging: gma500: fix some swapped gotos
Message-Id: <20110301141949.GA13002@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110226124812.GH18043@bicker>
In-Reply-To: <20110226124812.GH18043@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, Mar 01, 2011 at 01:50:23PM +0000, Alan Cox wrote:
> On Sat, 26 Feb 2011 15:48:12 +0300
> Dan Carpenter <error27@gmail.com> wrote:
> 
> > These gotos were swapped.  In the original code, the first would
> > result in a NULL dereference and the second would result in a memory
> > leak.
> > 
> > Signed-off-by: Dan Carpenter <error27@gmail.com>
> 
> Applied to my GMA500 tree. Need to sort out with GregKH how we handle
> stuff in general though as it seems that staging may not work for this
> driver due to the rate of change in the DRM tree.

I've already applied this to my tree.

And yeah, I'm wondering if this makes sense to go through me, as you are
going to be depending on drm changes.  Perhaps you want to push it
through there instead for the initial merge?

thanks,

greg k-h
