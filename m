From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Sun, 28 Jan 2007 16:19:38 +0000
Subject: Re: [KJ] clear_page() and copy_page()
Message-Id: <Pine.LNX.4.64.0701281114320.2102@CPE00045a9c397f-CM001225dbafb6>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0701280332020.29915@CPE00045a9c397f-CM001225dbafb6>
In-Reply-To: <Pine.LNX.4.64.0701280332020.29915@CPE00045a9c397f-CM001225dbafb6>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sun, 28 Jan 2007, Richard Knutsson wrote:

> include]$ grep -L clear_page asm-*/page.h
> asm-generic/page.h
> asm-powerpc/page.h
> include]$ grep -L copy_page asm-*/page.h
> asm-generic/page.h
> asm-powerpc/page.h
>
> so it seems it only needs to be defined on PowerPC.

powerpc should be OK since the files are named page_32.h and
page_64.h, not just page.h.  so i think we're good there.

> But what confuses me is:
> ...
> asm-x86_64/page.h:48:void clear_page(void *);
> asm-x86_64/page.h:51:#define clear_user_page(page, vaddr, pg)
> clear_page(page)
> ...
>
> Is x86_64 setting all its memory to zero before giving it to the
> caller, or what?

i'm not sure what the problem is here.  clear_page() still exists and
accepts a single page address.  what exactly is your concern?

rday

-- 
====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://www.fsdev.dreamhosters.com/wiki/index.php?title=Main_Page
====================================
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
