From: Andi Kleen <andi@firstfloor.org>
Date: Wed, 09 Jan 2008 04:11:35 +0000
Subject: Re: [patch 1/1] Convert drivers in drivers/char/drm to use .unlocked_ioctl
Message-Id: <20080109041135.GA7130@one.firstfloor.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20080109005416.039551758@gmail.com> <20080109005443.227306069@gmail.com> <alpine.DEB.0.82.0801090336000.9570@skynet.skynet.ie>
In-Reply-To: <alpine.DEB.0.82.0801090336000.9570@skynet.skynet.ie>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dave Airlie <airlied@linux.ie>
Cc: Kevin Winchester <kjwinchester@gmail.com>, dri-devel@lists.sourceforge.net, Andi Kleen <andi@firstfloor.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Jan 09, 2008 at 03:37:50AM +0000, Dave Airlie wrote:
> 
> > The drm drivers in this patch all used drm_ioctl to perform their
> > ioctl calls.  The common function is converted to use lock_kernel()
> > and unlock_kernel() and the drivers are converted to use .unlocked_ioctl
> > 
> 
> NAK

Did you actually read Kevin's patch? 

> 
> I've started looking at this already in the drm git tree, I'm going to 
> provide both locked and unlocked paths for drivers to choose, as we need 

If you do that you'll exactly need Kevin's patch as a base.

-Andi
