From: Matthew Wilcox <matthew@wil.cx>
Date: Thu, 08 Feb 2007 18:09:09 +0000
Subject: Re: [KJ] arch-dependent Kconfig file options?
Message-Id: <20070208180909.GM13101@parisc-linux.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0702081201320.14147@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0702081201320.14147@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, Feb 08, 2007 at 12:08:45PM -0500, Robert P. J. Day wrote:
>   is there a way to make the visibility of Kconfig file options
> dependent on the underlying architecture?  as a specific example,

Yes, and there's an example in the very file you reference:

config DEBUG_BUGVERBOSE
        bool "Verbose BUG() reporting (adds 70K)" if DEBUG_KERNEL && EMBEDDED
	depends on BUG
	depends on ARM || ARM26 || AVR32 || M32R || M68K || SPARC32 || SPARC64 | | FRV || SUPERH || GENERIC_BUG

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
