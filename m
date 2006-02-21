From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 21 Feb 2006 12:42:16 +0000
Subject: Re: [KJ] gcc4 warnings, variable used uninitialized
Message-Id: <200602211342.16434.arnd@arndb.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1140524267.2600.9.camel@omega.sp.or.at>
In-Reply-To: <1140524267.2600.9.camel@omega.sp.or.at>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tuesday 21 February 2006 13:17, Stephan Peijnik wrote:
> Does anyone know exactly how gcc4 decides whether a variable is
> undefined or not and how that should be handled kernel-wise?

It has been found that gcc-4.0 gets it wrong. Most of the
places where gcc-4.0 wrongly complains and gcc-3.4 does not
have been fixed in gcc-4.1.

> I've come across a few snippets where for example a temporary
> u32 is declared and then a pointer to that variable is given
> to pci_read_config_dword. When that variable is used afterwards gcc4
> complains about it being not initialized (Using gcc-4.0.2 and kernel
> 2.6.16-rc4 as of yesterday).
> 
> Should 'bugs' like those be fixed? I've found like a gazillion of
> them in the AGP drivers and other parts of the kernel.
> I'm thinking about that as it seems to be the best point to get
> myself started and I would appreciate comments on that topic.

A small number of these bugs are valid and should be fixed, but
it is not trivial to determine in some cases. What you say about
this happening with pci_read_config_dword sounds like it is a gcc
bug and not a bug in the kernel sources, so it should not be fixed
in the kernel.

Can you be more specific with the example and/or reproduce
it with gcc-4.1?

	Arnd <><
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
