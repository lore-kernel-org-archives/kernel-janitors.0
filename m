From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Wed, 18 Jul 2007 09:53:59 +0000
Subject: Re: should in-tree kernel source accommodate older kernel versions?
Message-Id: <Pine.LNX.4.64.0707180545030.20490@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0707171718450.18509@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0707171718450.18509@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, 17 Jul 2007, Matthew Wilcox wrote:

> On Tue, Jul 17, 2007 at 05:36:45PM -0400, Robert P. J. Day wrote:
> > On Tue, 17 Jul 2007, Matthew Wilcox wrote:
> > > On Tue, Jul 17, 2007 at 05:22:56PM -0400, Robert P. J. Day wrote:
> > > >   should kernel source that's in the current source tree still try to
> > > > accommodate older kernel versions?  as an example, this is from
> > >
> > > This has been discussed before, and the current thinking is to
> > > remove support for versions of the kernel older than 2.6.0.
> >
> > *that* part was self-evident.  i'm talking more specifically about
> > older versions of 2.6.x, in particular features that aren't even
> > *supported* anymore in the current tree.
>
> You'll find people very resistant to patches that remove support for
> older 2.6.x kernels.

the reason i'm asking is that this idea of retaining support for older
versions of the kernel is somewhat inconsistent in the source tree.
as an example, one of the video source files also had conditional
support for that obsolete module parameter macro:

#if defined(module_param)     // Showing parameters under SYSFS
module_param(isocMode, int, 0444);
module_param(video_debug, int, 0444);
module_param(PowerOnAtOpen, int, 0444);
...
#else                                                   // Old Style
MODULE_PARM(video_debug, "i");
MODULE_PARM(adjustCompression, "i");
MODULE_PARM(PowerOnAtOpen, "i");
...

  the video folks had no problem applying a patch to toss that
"old-style" stuff for what i think is a simple reason -- that
MODULE_PARM macro isn't even *defined* anymore, so there's no possible
value in keeping that old code around, even if it's protected by a
kernel version check.

  that's the fundamental question here -- what's the inherent value in
protecting kernel code that is based on features that don't even
*exist* in the source tree anymore?  whose benefit does that serve?
it may make things easier for that particular developer, but it
provides no value whatsoever to the kernel itself.

rday
-- 
====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://fsdev.net/wiki/index.php?title=Main_Page
====================================
