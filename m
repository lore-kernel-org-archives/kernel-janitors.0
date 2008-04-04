From: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Fri, 04 Apr 2008 15:21:06 +0000
Subject: Re: any value to numerous checks of "#ifdef __GNUC__"?
Message-Id: <alpine.LFD.1.00.0804041113260.25217@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.LFD.1.00.0804040916040.24121@localhost.localdomain>
In-Reply-To: <alpine.LFD.1.00.0804040916040.24121@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, 4 Apr 2008, walter harms wrote:

> Robert P. J. Day wrote:
> >   there are numerous header files that contain a check of the form
> >
> >     #ifdef __GNUC__
> >
> > but <linux/compiler.h> already insists on a GNU C-flavoured compiler:
> >
> > #if __GNUC__ >= 4
> > # include <linux/compiler-gcc4.h>
> > #elif __GNUC__ = 3 && __GNUC_MINOR__ >= 2
> > # include <linux/compiler-gcc3.h>
> > #else
> > # error Sorry, your compiler is too old/not recognized.
> > #endif
> >
> >   so is there any point in keeping all those checks around?  is it
> > even remotely feasible that the kernel might someday support a non-GNU
> > C compiler, given the numerous gcc extensions that are used?
> >
> > rday
> > --
> >
>
> hi,
> so far i know the intel compiler can compile a linux kernel.

i know, but even the intel compiler identifies itself as
GNU-compatible by defining __GNUC__.

> ntl. this is most likely crap since the compiler is checked much
> more early. (or at least should).

it is, as i point out above:  linux/compiler.h.

> I only reason i can think of is that this module is used in other
> places outside the linux kernle tree.

perhaps, but unlikely, given the amount of checking that's being done
all over the place:

$ grep -r "#if.*__GNUC__" *

and, philosophically speaking, it's not clear that source in the
kernel tree is responsible for being compatible for being used in
environments *outside* of the tree.

i'm going to go with the position that it's crap and submit a few
patches to start ripping it out.

rday
--


====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry:
    Have classroom, will lecture.

http://crashcourse.ca                          Waterloo, Ontario, CANADA
====================================
