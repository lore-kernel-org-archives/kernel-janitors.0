From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Thu, 08 Feb 2007 18:34:41 +0000
Subject: Re: [KJ] arch-dependent Kconfig file options?
Message-Id: <Pine.LNX.4.64.0702081334250.14600@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0702081201320.14147@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0702081201320.14147@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, 8 Feb 2007, Matthew Wilcox wrote:

> On Thu, Feb 08, 2007 at 12:08:45PM -0500, Robert P. J. Day wrote:
> >   is there a way to make the visibility of Kconfig file options
> > dependent on the underlying architecture?  as a specific example,
>
> Yes, and there's an example in the very file you reference:
>
> config DEBUG_BUGVERBOSE
>         bool "Verbose BUG() reporting (adds 70K)" if DEBUG_KERNEL && EMBEDDED
> 	depends on BUG
> 	depends on ARM || ARM26 || AVR32 || M32R || M68K || SPARC32 || SPARC64 | | FRV || SUPERH || GENERIC_BUG

crap.  i really need to get more sleep.  thanks.

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
