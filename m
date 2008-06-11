From: Greg KH <greg@kroah.com>
Date: Wed, 11 Jun 2008 03:28:10 +0000
Subject: Re: [ANNOUNCE] linux-staging tree created
Message-Id: <20080611032810.GA4483@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20080610190540.GA25066@kroah.com> <31e679430806101707s357e4b0dm79c3f9a95c784320@mail.gmail.com>
In-Reply-To: <31e679430806101707s357e4b0dm79c3f9a95c784320@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Felipe Balbi <felipebalbi@users.sourceforge.net>
Cc: linux-kernel@vger.kernel.org, devel@linuxdriverproject.org, linux-next@vger.kernel.org, kernel-janitors@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>

On Wed, Jun 11, 2008 at 03:07:30AM +0300, Felipe Balbi wrote:
> hi,
> 
> On Tue, Jun 10, 2008 at 10:05 PM, Greg KH <greg@kroah.com> wrote:
> > Oh great, not yet-another-kernel-tree, just what the world needs...
> >
> > Yes, this is an announcement of a new kernel tree, linux-staging.  It is
> > a quilt series of patches that can be found at:
> >        git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git
> >
> >
> > In a long and meandering thread with some of the other kernel developers
> > a week or so ago, it came up that there is no single place for companies
> > and developers to put their code for testing while it gets cleaned up
> > for submission into the kernel tree.  All of the different subsystems
> > have trees, but they generally only want code that is about to go into
> > this release, or the next one.  For stuff that is farther off, there is
> > no place to go.
> 
> That's great. I started working on the test and measurement class
> driver. Do you want me to send preliminary patches or just the final
> one ?

I'll take whatever you have, prelim patches is nice if you are at a
stopping point and want to make sure I get them applied :)

thanks,

greg k-h
