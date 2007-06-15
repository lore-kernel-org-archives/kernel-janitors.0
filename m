From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Fri, 15 Jun 2007 15:42:27 +0000
Subject: Re: [KJ] [PATCH] Centralize checking for adequate version of gcc.
Message-Id: <Pine.LNX.4.64.0706151141170.3326@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0706150650010.25667@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0706150650010.25667@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, 15 Jun 2007, Vegard Nossum wrote:

> On 6/15/07, Robert P. J. Day <rpjday@mindspring.com> wrote:
> >   here's a patch i submitted to andrew to centralize checking for a
> > proper version of gcc when building the kernel, but andrew claims it
> > broke the build.  i'm trying to reproduce the problem, and i'd
> > appreciate it if anyone else wants to apply this patch and try a build
> > based on "allyesconfig" or "allmodconfig" on x86 to see if they run
> > into some kind of issue, cuz i'm just not seeing it here.  thanks.
>
> It works for me (using gcc 4.1.1 for i386 on linus's tree). Removing
> that explanatory comment is not very nice, though.

which explanatory comment?  the one from init/main.c?  but why would i
leave it in when the code it pertains to has been removed?

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
