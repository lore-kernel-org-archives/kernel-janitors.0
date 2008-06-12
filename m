From: Greg KH <greg@kroah.com>
Date: Thu, 12 Jun 2008 23:54:41 +0000
Subject: Re: [ANNOUNCE] linux-staging tree created
Message-Id: <20080612235441.GC4792@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20080610190540.GA25066@kroah.com> <87a5b0800806110345v77529fc8r591f2fb4c95b5bdf@mail.gmail.com> <20080611162639.GE22134@kroah.com> <87a5b0800806120437n23602ba5raae500f5bd3d179f@mail.gmail.com>
In-Reply-To: <87a5b0800806120437n23602ba5raae500f5bd3d179f@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Will Newton <will.newton@gmail.com>
Cc: linux-kernel@vger.kernel.org, devel@linuxdriverproject.org, kernel-janitors@vger.kernel.org, linux-next@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>

On Thu, Jun 12, 2008 at 12:37:56PM +0100, Will Newton wrote:
> On Wed, Jun 11, 2008 at 5:26 PM, Greg KH <greg@kroah.com> wrote:
> > On Wed, Jun 11, 2008 at 11:45:55AM +0100, Will Newton wrote:
> >>
> >> Would the linux-staging tree be an appropriate place to merge a new
> >> architecture? Or would that be too large a change and should go via
> >> its own tree?
> >
> > That is probably too big to go into -staging and should deserve its own
> > tree based on the size of patches that have gone into creating a new
> > architecture in the past.
> 
> Our tree is about 26000 lines of diff, including a few drivers.

That's pretty sizable, I think it deserves its own tree.

> > Do you have an example of one that is currently not included in the main
> > kernel tree right now?
> 
> I have a tree that is currently about half way to public consumption,
> although I don't think there's any point pushing it until we have a
> publically available toolchain.

Yeah, that would help as well :)

thanks,

greg k-h
