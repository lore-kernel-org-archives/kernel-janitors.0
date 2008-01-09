From: "Kevin Winchester" <kjwinchester@gmail.com>
Date: Wed, 09 Jan 2008 12:28:53 +0000
Subject: Re: [patch 1/1] Convert drivers in drivers/char/drm to use .unlocked_ioctl
Message-Id: <d1af83620801090428nd4de198ja2adbdaab48a8ead@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20080109005416.039551758@gmail.com>
	 <20080109005443.227306069@gmail.com>
	 <alpine.DEB.0.82.0801090336000.9570@skynet.skynet.ie>
In-Reply-To: <alpine.DEB.0.82.0801090336000.9570@skynet.skynet.ie>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dave Airlie <airlied@linux.ie>
Cc: dri-devel@lists.sourceforge.net, Andi Kleen <andi@firstfloor.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Jan 8, 2008 11:37 PM, Dave Airlie <airlied@linux.ie> wrote:
>
> > The drm drivers in this patch all used drm_ioctl to perform their
> > ioctl calls.  The common function is converted to use lock_kernel()
> > and unlock_kernel() and the drivers are converted to use .unlocked_ioctl
> >
>
> NAK
>
> I've started looking at this already in the drm git tree, I'm going to
> provide both locked and unlocked paths for drivers to choose, as we need
> to audit the drivers on a per-driver basis, the other option is to provide
> wrappers in each driver to do the lock/unlock kernel and leave drm_ioctl
> alone..
>
> I'll take a look kmalloc failure case sounds like a bug though..
>

No problem.  I interpreted Andi's request for patches as a way to ensure
that people were actively working to remove the BKL from ioctl calls.
Since you appear to already have been working towards that end, the patch
is not really necessary.

-- 
Kevin Winchester
