From: Randy Dunlap <rdunlap@xenotime.net>
Date: Thu, 08 Feb 2007 17:52:39 +0000
Subject: Re: [KJ] arch-dependent Kconfig file options?
Message-Id: <20070208095239.9903adf2.rdunlap@xenotime.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0702081201320.14147@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0702081201320.14147@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, 8 Feb 2007 12:08:45 -0500 (EST) Robert P. J. Day wrote:

> 
>   is there a way to make the visibility of Kconfig file options
> dependent on the underlying architecture?  as a specific example,
> there are two archs (alpha and frv) that support debugging semaphores.
> but that's not a general Kconfig-selectable setting -- those two
> arches independently define those options:
> 
>   $ grep -r SEMAPHORE . | grep DEBUG
> 
> which seems wasteful.  why not just have that option in one place?
> (lib/Kconfig.debug would be the obvious place, of course.)
> 
>   however, since that option applies only to a couple of arches, it
> should be displayed only for those arches. is there a way to do this?

Sure there is.  Look at lib/Kconfig.debug entries for
MAGIC_SYSRQ (for !UML) or DETECT_SOFTLOCKUP (!S390)
or DEBUG_BUGVERBOSE:

config DEBUG_BUGVERBOSE
	bool "Verbose BUG() reporting (adds 70K)" if DEBUG_KERNEL && EMBEDDED
	depends on BUG
	depends on ARM || ARM26 || AVR32 || M32R || M68K || SPARC32 || SPARC64 || FRV || SUPERH || GENERIC_BUG
	default !EMBEDDED

or FRAME_POINTER:

config FRAME_POINTER
	bool "Compile the kernel with frame pointers"
	depends on DEBUG_KERNEL && (X86 || CRIS || M68K || M68KNOMMU || FRV || UML || S390 || AVR32 || SUPERH)
	default y if DEBUG_INFO && UML


> rday
> 
> p.s.  yes, i realize that it's not that big a deal here since it
> involves only two architectures.  but it's the more general case i'm
> curious about, when *other* architectures decide they want semaphore
> debugging as well.


---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
