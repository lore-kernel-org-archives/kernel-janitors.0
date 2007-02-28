From: Matthew Wilcox <matthew@wil.cx>
Date: Wed, 28 Feb 2007 22:11:20 +0000
Subject: Re: [KJ] how many real time clocks do we need?
Message-Id: <20070228221120.GA32226@parisc-linux.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0702221611400.6794@CPE00045a9c397f-CM001225dbafb6>
In-Reply-To: <Pine.LNX.4.64.0702221611400.6794@CPE00045a9c397f-CM001225dbafb6>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Feb 23, 2007 at 08:05:37AM +0100, Richard Knutsson wrote:
> >config RTC
> >        tristate "Enhanced Real Time Clock Support"
> >	depends on !PPC && !PARISC && !IA64 && !M68K && (!SPARC || PCI) && 
> >	!FRV && !ARM && !SUPERH
> >
> >config GEN_RTC
> >        tristate "Generic /dev/rtc emulation"
> >	depends on RTC!=y && !IA64 && !ARM && !M32R && !SPARC && !FRV
>
> Just curious, does IA64, ARM, SPARC and FRV (is that an arch?) have any 
> real-time clock?

I think you could research this yourself, but :

config EFI_RTC
        bool "EFI Real Time Clock Services"
	depends on IA64

...

config ARM
        bool
	default y
	select RTC_LIB

(see also drivers/rtc/Kconfig)

./drivers/sbus/char/Kconfig:config SUN_MOSTEK_RTC

I dunno what arch/frv does for an RTC.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
