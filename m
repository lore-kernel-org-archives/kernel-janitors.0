From: Randy Dunlap <rdunlap@xenotime.net>
Date: Fri, 07 Sep 2007 15:41:52 +0000
Subject: Re: large patches
Message-Id: <20070907084152.d22a5077.rdunlap@xenotime.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20070907131821.GA14711@ahaupt-debian-vm.localdomain>
In-Reply-To: <20070907131821.GA14711@ahaupt-debian-vm.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, 7 Sep 2007 17:16:56 +0200 Andre Haupt wrote:

> On Fri, Sep 07, 2007 at 08:13:37AM -0700, Randy Dunlap wrote:
> > On Fri, 7 Sep 2007 18:54:45 +0400 Alexey Dobriyan wrote:
> > 
> > > On 9/7/07, Andre Haupt <andre@finow14.de> wrote:
> > > > I have a driver (drivers/atm/iphase.*) which i try to get in conformance
> > > > with CodingStyle. I started by fixing whitespace issues (by hand). The
> > > > resulting
> > > > patch is about 177 kB because those whitespace issues appear on every
> > > > single line of the original file.
> > > > Is it ok to send this large patch to kernel-janitors and lkml?
> > > >
> > > > BTW, this driver has *LOTS* of additional style problems. All kinds of
> > > > mixed indentation to name one.
> > > 
> > > Send "Linus please do Lindent blah-blah" request to Linus. Before that
> > > do it yourself and verify that code doesn't change or something.
> > 
> > or do whitespace-only changes and verify that the code does not change
> > any, and put that comment in the patch description.
> > 
> That is what i did ;-)
> So it is ok to send the patch?

I think so, but the question IMO is where to send it.

I would send it to the ATM maintainer and cc: Dave Miller and the
netdev mailing list, but using lkml is OK also.


---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
