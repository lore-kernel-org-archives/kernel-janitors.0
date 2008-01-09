From: Dave Airlie <airlied@linux.ie>
Date: Wed, 09 Jan 2008 04:51:45 +0000
Subject: Re: [patch 1/1] Convert drivers in drivers/char/drm to use
Message-Id: <alpine.DEB.0.82.0801090448520.9570@skynet.skynet.ie>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20080109005416.039551758@gmail.com> <20080109005443.227306069@gmail.com>
 <alpine.DEB.0.82.0801090336000.9570@skynet.skynet.ie>
 <20080109041135.GA7130@one.firstfloor.org>
In-Reply-To: <20080109041135.GA7130@one.firstfloor.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andi Kleen <andi@firstfloor.org>
Cc: Kevin Winchester <kjwinchester@gmail.com>, dri-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org


> On Wed, Jan 09, 2008 at 03:37:50AM +0000, Dave Airlie wrote:
> > 
> > > The drm drivers in this patch all used drm_ioctl to perform their
> > > ioctl calls.  The common function is converted to use lock_kernel()
> > > and unlock_kernel() and the drivers are converted to use .unlocked_ioctl
> > > 
> > 
> > NAK
> 
> Did you actually read Kevin's patch? 


Kevin's patch adds the lock/unlock to drm_ioctl which is exactly what I 
don't want, I want to have drm_ioctl become drm_unlocked_ioctl, and 
drm_ioctl to wrap it with the lock/unlocks, then the drivers can all
use unlocked_ioctl like Kevins patch pointing to drm_ioctl, and can 
migrate over to drm_unlocked_ioctl post lock auditing, the new latest i915 
driver seems to be fine with unlocked ioctls so far..

Yes I can use Kevin's patch as a base most likely, but it doesn't do what 
I want yet, and I've already started to do it properly in the drm upstream 
trees....

Dave.
