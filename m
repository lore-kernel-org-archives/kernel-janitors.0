From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 05 Jan 2016 22:08:27 +0000
Subject: Re: [patch v2] usb: gadget: f_midi: missing unlock on error path
Message-Id: <20160105220827.GF23363@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160105102809.GA26420@mwanda>
In-Reply-To: <20160105102809.GA26420@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, Jan 05, 2016 at 08:51:18PM +0000, Felipe Ferreri Tonello wrote:
> This case is not a matter of been pretty but a matter of been less error
> prone.
> 
> What would you suggest?

Normally it's better to unwind in the reverse order from how we
allocated so it would be:

	lock
	allocate midi
	allocate ports

	free ports
	free midi
	unlock

We could move the midi allocation outside the lock, but we can't move
ports allocation.  And also we want to drop the lock as soon as we can
so it's better to do that early like my patch does instead of after the
frees.  It's less symetric that way and thus more error prone but it's
better for performance.

Anyway, I don't think it really matters, this is a minor thing.

Also I hope that Smatch will be able to avoid that false positive about
the midi dereference by the end of 2016. :)

regards,
dan carpenter
