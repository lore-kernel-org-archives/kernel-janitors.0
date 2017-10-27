From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Fri, 27 Oct 2017 17:23:04 +0000
Subject: Re: [PATCH] misc: bh1770glc: Use common error handling code in bh1770_power_state_store()
Message-Id: <20171027172304.GA18401@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <568ee0ee-8ff1-9739-fa6b-f2eeae53e11a@users.sourceforge.net>
 <9c0b957a-93b5-39c9-f9bd-cb754d009d62@grinta.net>
In-Reply-To: <9c0b957a-93b5-39c9-f9bd-cb754d009d62@grinta.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Daniele Nicolodi <daniele@grinta.net>
Cc: SF Markus Elfring <elfring@users.sourceforge.net>, kernel-janitors@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Dan Carpenter <dan.carpenter@oracle.com>, LKML <linux-kernel@vger.kernel.org>, Jonathan Cameron <jic23@kernel.org>, Samu Onkalo <samu.p.onkalo@nokia.com>

On Fri, Oct 27, 2017 at 11:11:13AM -0600, Daniele Nicolodi wrote:
> On 10/27/17 10:20 AM, SF Markus Elfring wrote:
> > From: Markus Elfring <elfring@users.sourceforge.net>
> > Date: Fri, 27 Oct 2017 18:00:31 +0200
> > 
> > Adjust jump targets so that a bit of exception handling can be better
> > reused in an if branch of this function.
> 
> What is the benefit brought by this change?

Please note, you are responding to someone who lots and lots of kernel
maintainers/developers have blacklisted, myself included.  It's just not
worth your effort, I recommend doing the same, as I'm not applying any
patches from this author, unless some other maintainer wants to take the
time to validate and send them on to me.

kill-files are a good thing, please use them :)

good luck!

greg k-h
