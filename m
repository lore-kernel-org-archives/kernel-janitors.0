From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Fri, 16 Mar 2007 10:37:53 +0000
Subject: Re: [KJ] module.h versus moduleparam.h
Message-Id: <Pine.LNX.4.64.0703160635410.26564@CPE00045a9c397f-CM001225dbafb6>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0703142027100.7167@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0703142027100.7167@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, 16 Mar 2007, Anupam Kapoor wrote:

> On 3/15/07, Robert P. J. Day <rpjday@mindspring.com> wrote:
> >
> >
> >   i've summarized my thoughts on the moduleparam.h header file issue
> > here:
> >
> > http://fsdev.net/wiki/index.php?title=Moduleparam.h
> >
> >   any thoughts?
>
>
> how about talking to individual driver maintainers for doing
> picewise cleanups ? the assumption here being that the bulk of
> changes need to be applied to drivers.

as you mention, the bulk of those issues occur under drivers/, but
some are under other directories as well:

$ . ../moduleparam.sh sound
Number of source files found: 483
Number of files that include module.h: 93
Number of files that include moduleparam.h: 119
Number of files that include both: 16
Number of files that include ONLY module.h: 77
Number of files that include ONLY moduleparam.h: 1
Number of files missing moduleparam.h: 30
Number of files with unnecessary moduleparam.h: 25

so this is all over the source tree, for what it's worth.

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
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
