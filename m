From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 01 Mar 2004 15:13:48 +0000
Subject: Re: [Kernel-janitors] Re: finding unused globals in the kernel
Message-Id: <200403011613.48952.arnd@arndb.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5138.1078121472@kao2.melbourne.sgi.com>
In-Reply-To: <5138.1078121472@kao2.melbourne.sgi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Monday 01 March 2004 13:37, Keith Owens wrote:

> Your script depends on relocation data to see if a symbol is used or
> not, but reloc data is not reliable for this test.  On architectures
> that use pc relative addressing, the compiler may not generate
> relocation entries for references within the same source file, because
> the compiler already knows the offset between the call and the target
> instruction so it can code the instruction directly instead of leaving
> it to the linker.  

I have so far seen this only for static symbols and decided to just
skip all messages about static symbols in the output. As you noted,
the compiler already warns about them anyway. I have now checked with
other compiler versions and found that at least gcc-2.95 on s390
has some false positives because of this, though I did not see any
false positives with gcc-3.3 on x86_64 (could be coincidence).

> Even when reloc data is available, objdump does not 
> always print it the way that you want, e.g. ia64 uses PCREL21B amongst
> others, not R_IA64_....

Right, there had to be bugs like that :(

> For the symbols that could be marked static, the act of changing them
> to static and rebuilding will do two things.  Static symbols often let
> gcc generate better code.  If a static symbol is not referenced at all,
> gcc will now tell you about it.  It takes extra steps (mark static,
> rebuild, see warning message, remove dead symbol) but takes care of all
> cases and you end up with a cleaner code base when compared to doing a
> simple "any references" test.

Yes, I'm regularly doing exactly this for all the s390 specific code.
The problem is that if you do this for an allyesconfig kernel, you
need to change a lot of code that you don't own and have to do it
again every time you go looking for these problems.

In a perfect world, nobody would write global functions unless necessary
or at least use your script to check their own files. If you are simply
looking for dead code in one configuration is a lot easier when the
list is as short as possible.

	Arnd <><
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
