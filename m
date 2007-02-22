From: Matthew Wilcox <matthew@wil.cx>
Date: Thu, 22 Feb 2007 22:40:36 +0000
Subject: Re: [KJ] how many real time clocks do we need?
Message-Id: <20070222224036.GB6956@parisc-linux.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0702221611400.6794@CPE00045a9c397f-CM001225dbafb6>
In-Reply-To: <Pine.LNX.4.64.0702221611400.6794@CPE00045a9c397f-CM001225dbafb6>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, Feb 22, 2007 at 04:13:31PM -0500, Robert P. J. Day wrote:
>   just poking around the drivers/char directory, and noticed the
> existence of both the RTC real-time clock, and the GEN_RTC real-time
> clock in the Kconfig file.
> 
>   is there still a compelling need to be supporting *both* of those?
> just curious.

One works on some architectures, one works on other architectures.  Why
not take a hint from the Kconfig dependencies?

config RTC
        tristate "Enhanced Real Time Clock Support"
	depends on !PPC && !PARISC && !IA64 && !M68K && (!SPARC || PCI) && !FRV && !ARM && !SUPERH

config GEN_RTC
        tristate "Generic /dev/rtc emulation"
	depends on RTC!=y && !IA64 && !ARM && !M32R && !SPARC && !FRV

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
