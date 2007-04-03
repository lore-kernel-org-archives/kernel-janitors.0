From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Tue, 03 Apr 2007 10:40:52 +0000
Subject: Re: [KJ] Any need for __cplusplus?
Message-Id: <Pine.LNX.4.64.0704030625510.26598@CPE00045a9c397f-CM001225dbafb6>
List-Id: <kernel-janitors.vger.kernel.org>
References: <461201B3.8000800@student.ltu.se>
In-Reply-To: <461201B3.8000800@student.ltu.se>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, 3 Apr 2007, Jaco Kroon wrote:

> Richard Knutsson wrote:
> > Hello
> >
> > There were recently a thread in LKML about C++-usage in the kernel
> > (again). That reminded me, why do we have those "ifdef
> > __cplusplus"? As an example, we have this (in
> > include/linux/stddef.h) when defining NULL as 0 in C++ and ((void
> > *)0) otherwise. From what I can see, there is no reason to have
> > them, or am I missing something? (like they are needed by
> > libraries)
>
> Many of these headers are exported to userspace, eg the
> linux-headers package on many linux distributions.  If a user
> includes them from a C++ program, they shouldn't break.

the obvious question is this:  is the kernel officially C++-free?
that is, is the *only* reason one would see that C++ check is if
something is being exported to userspace?

if that's the case, the obvious approach is to generate the sanitized
headers with "make headers_install" and see what C++ references are
left:

$ make distclean
$ make headers_install
$ cd usr/include
$ grep -r cplusplus *
linux/stddef.h:#if defined(__cplusplus)
linux/socket.h:#elif defined(__cplusplus)
$

and that's it.  if the kernel is truly C++-free, then there should be
*no* C++ tests within the bounds of a "#ifdef __KERNEL__" test, isn't
that right?  but it's not that simple.

consider, for example, the header file drivers/net/sk98lin/h/skgehw.h:

...
#ifndef __INC_SKGEHW_H
#define __INC_SKGEHW_H

#ifdef __cplusplus
extern "C" {
#endif  /* __cplusplus */
...

note how that C++ test is not protected by a __KERNEL__ test but, on
the other hand, it's not exported to userspace either.  so what's the
point of the C++ test if userspace never sees that header file?   yes,
it would seem that there are a lot of worthless C++ tests that could
be removed if they never make it to userspace.

thoughts?

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
