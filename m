From: Matt Mackall <mpm@selenic.com>
Date: Fri, 11 Jan 2008 17:17:08 +0000
Subject: Re: [PATCH] Random number driver: make random_ioctl as an
Message-Id: <1200071828.3830.0.camel@cinder.waste.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1200051592.3844.63.camel@nikanth-laptop.blr.novell.com>
In-Reply-To: <1200051592.3844.63.camel@nikanth-laptop.blr.novell.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nikanth Karthikesan <knikanth@suse.de>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org


On Fri, 2008-01-11 at 17:09 +0530, Nikanth Karthikesan wrote:
> The random_ioctl is registered as an ioctl function but it does not
> require BKL to be held when called. Changing it as an unlocked_ioctl
> function.
> 
> Signed-off-by: Nikanth Karthikesan <knikanth@suse.de>

Looks good, but I've already got this queued.

-- 
Mathematics is the supreme nostalgia of our time.

