From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Thu, 21 Jun 2007 16:04:08 +0000
Subject: Re: [KJ] [PATCH] Centralize checking for adequate version of gcc.
Message-Id: <Pine.LNX.4.64.0706211202240.9289@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0706150650010.25667@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0706150650010.25667@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, 21 Jun 2007, Alexey Dobriyan wrote:

> On 6/21/07, Robert P. J. Day <rpjday@mindspring.com> wrote:
> > actually, it made me wonder why gcc < 3.2.0 is a *fatal* choice, but
> > gcc = 4.1.0 is just a *warning*.  if 4.1.0 is "known to miscompile
> > the kernel," why not just make it unacceptable?  why the double
> > standard here?
>
> Runtime checking of gcc for known miscompilation bugs is welcome. :-)

but that wasn't the question -- the question was whether trying to
compile the kernel with gcc-4.1.0 should be an error rather than just
a warning.  personally, i don't know what the problem is but the
current source tree does warn that gcc-4.1.0 will miscompile the
kernel.

if that's really true, why allow people to keep using it?

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
