From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Fri, 15 Jun 2007 18:39:25 +0000
Subject: Re: [KJ] [PATCH] Centralize checking for adequate version of gcc.
Message-Id: <Pine.LNX.4.64.0706151438170.13440@localhost.localdomain>
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
> It works for me (using gcc 4.1.1 for i386 on linus's tree).

well, that's just weird.  andrew insisted that the build failed for
him -- *i* can't reproduce it, and it seems to work for you, and that
patch is so innocuous that i just don't understand how it could have
screwed things up.

how odd.

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
