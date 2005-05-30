From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 30 May 2005 08:24:13 +0000
Subject: Re: [KJ] [PATCH] Fix misleading gcc4 warning,
Message-Id: <200505301024.14777.arnd@arndb.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <42966B18.6020802@cs.pdx.edu>
In-Reply-To: <42966B18.6020802@cs.pdx.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Maandag 30 Mai 2005 03:59, Adrian Bunk wrote:
> On Sun, May 29, 2005 at 05:14:24PM -0700, Jesse Millan wrote:
> > 
> > [jessem@sc]$ /usr/local/gcc4/bin/gcc --version
> > gcc (GCC) 4.0.0
> >...
> 
> It compiles for me without warning with
>   gcc-4.0 (GCC) 4.0.1 20050522 (prerelease) (Debian 4.0.0-8)
> 
> Please send the complete warning message and your .config .
> 

The warning shows up for me only on x86_64 and ppc64 but not
on i386, because i386 compiles with -fno-unit-at-a-time.
Without that option, the function is not inlined so gcc can't
detect the condition.

	Arnd <><
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
