From: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Sat, 29 Mar 2008 13:50:09 +0000
Subject: Re: [PATCH] jiffies.h: Better error message and add "const" where
Message-Id: <alpine.LFD.1.00.0803290948170.20266@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.LFD.1.00.0803290930110.20145@localhost.localdomain>
In-Reply-To: <alpine.LFD.1.00.0803290930110.20145@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, 29 Mar 2008, Julia Lawall wrote:

> On Sat, 29 Mar 2008, Robert P. J. Day wrote:
>
> > Add a more informative error message for bad values of HZ, and add
> > "const" argument qualification for a couple routines for which
> > it's appropriate.
>
> What is the criterion for adding const?  For example, should there
> be const on the declaration of gran in the following function (also
> in kernel/time.c)?
>
> struct timespec timespec_trunc(struct timespec t, unsigned gran)
> {
>         /*
>          * Division is pretty slow so avoid it for common cases.
>          * Currently current_kernel_time() never returns better than
>          * jiffies resolution. Exploit that.
>          */
>         if (gran <= jiffies_to_usecs(1) * 1000) {
>                 /* nothing */
>         } else if (gran = 1000000000) {
>                 t.tv_nsec = 0;
>         } else {
>                 t.tv_nsec -= t.tv_nsec % gran;
>         }
>         return t;
> }

yes, i guess it would be appropriate there as well -- i just didn't
notice that.  i was digging through the jiffies code so those were the
only ones that jumped out at me.  maybe i'll look through jiffies.h
more carefully and see what else i missed and update the patch.

rday
--

====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry:
    Have classroom, will lecture.

http://crashcourse.ca                          Waterloo, Ontario, CANADA
====================================
