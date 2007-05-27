From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Sun, 27 May 2007 18:33:08 +0000
Subject: Re: [KJ] is it safe to assume anything referring to "MODULE_PARM"
Message-Id: <Pine.LNX.4.64.0705271426200.10344@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0705271356130.9605@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0705271356130.9605@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sun, 27 May 2007, Randy Dunlap wrote:

> On Sun, 27 May 2007 13:57:31 -0400 (EDT) Robert P. J. Day wrote:
>
> >
> >   given that the old-style MODULE_PARM macro has been obsolete since
> > 2003:
> >
> > http://lwn.net/Articles/22197/
> >
> > is it safe to assume that any still-active references to it can't
> > possibly mean anything?
> >
> >   $ grep -rw MODULE_PARM *
>
> It's safe to clean up any existing references, esp. if they are more
> than comments or not-live code.

actually, it's not entirely obvious since some drivers might still be
hanging in there, trying to support older kernels.  for example, see
drivers/media/video/usbvision/usbvision-video.c:

...
#if defined(module_param)                               // Showing parameters under SYSFS
module_param(isocMode, int, 0444);
module_param(video_debug, int, 0444);
module_param(PowerOnAtOpen, int, 0444);
module_param(video_nr, int, 0444);
module_param(radio_nr, int, 0444);
module_param(vbi_nr, int, 0444);
#else                                                   // Old Style
MODULE_PARAM(isocMode, "i");
MODULE_PARM(video_debug, "i");
...

  i mean, how far back do you have to go to need that old-style code,
especially since that first old macro is misspelled and couldn't
possibly build?  :-)

  i think i'll submit a patch to get rid of that hunk, just based on
that typo.

rday
-- 
====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://fsdev.net/wiki/index.php?title=Main_Page
====================================
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
