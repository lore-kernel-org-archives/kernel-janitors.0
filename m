From: Richard Cochran <richardcochran@gmail.com>
Date: Mon, 10 Jul 2017 11:02:46 +0000
Subject: Re: [PATCH 1/2 net] ptp: fix error codes in ptp_clock_register()
Message-Id: <20170710110246.inwp2frouj7gvqzf@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170710071137.ui2fhjkqzjqhkopz@mwanda>
 <20170710092103.vnanagwpimk43zoz@localhost.localdomain>
 <20170710093816.wz5uiqoyilgxmgh3@mwanda>
 <20170710094806.lsrua5iqnmnntc5m@localhost.localdomain>
 <20170710102920.gav646pmteijfxfl@mwanda>
In-Reply-To: <20170710102920.gav646pmteijfxfl@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Ganesh Goudar <ganeshgr@chelsio.com>, Atul Gupta <atul.gupta@chelsio.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, Jul 10, 2017 at 01:29:20PM +0300, Dan Carpenter wrote:
> The "goto no_pps" was a bug you introduced.

I took a second look, and yes, the original commit should not have
returned NULL, and the original callers did not expect NULL either.
 
> But I feel like you're being rude, so I'm not going to resend these
> patches.  Please fix them yourself.

Sorry you feel that way.  Your first patch, although now more or less
cosmetic, would be okay.  The second patch is still wrong.

Thanks,
Richard
