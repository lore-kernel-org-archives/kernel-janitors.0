From: Greg KH <greg@kroah.com>
Date: Tue, 22 Feb 2011 17:36:27 +0000
Subject: Re: [patch 1/2] staging: ath6kl: cleanup in SEND_FRAME ioctl
Message-Id: <20110222173627.GA6764@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110220124832.GA1898@bicker>
In-Reply-To: <20110220124832.GA1898@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, Feb 22, 2011 at 08:42:09AM -0800, Joe Perches wrote:
> On Sun, 2011-02-20 at 21:04 -0800, Luis R. Rodriguez wrote:
> > On Sun, Feb 20, 2011 at 9:02 PM, Greg KH <greg@kroah.com> wrote:
> > > On Sun, Feb 20, 2011 at 08:45:44PM -0800, Luis R. Rodriguez wrote:
> > >> On Sun, Feb 20, 2011 at 8:14 PM, Greg KH <greg@kroah.com> wrote:
> > >> > On Sun, Feb 20, 2011 at 08:00:38PM -0800, Luis R. Rodriguez wrote:
> > >> >> On Sun, Feb 20, 2011 at 7:18 AM, Vipin Mehta <vmehta@atheros.com> wrote:
> > >> >> > On Sun, Feb 20, 2011 at 04:49:08AM -0800, Dan Carpenter wrote:
> > >> >> >> The original code was written in a funny way where every statement was
> > >> >> >> part of else if blocks.  I broke them up into separate statements by
> > >> >> >> adding breaks on failure conditions.
> > >> >> >> Signed-off-by: Dan Carpenter <error27@gmail.com>
> 
> Greg, can I find out soonish please if you are going to
> apply these patches?

They were sent on Sunday, yesterday was a holiday here, so please give
me a chance to catch up...

> If not, I have patches to send.
> If so, I'll wait until you apply them
> and redo them.

Yes, it looks like I will take these as Vipin acked them.

thanks,

greg k-h
