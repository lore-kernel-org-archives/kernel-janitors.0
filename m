From: walter harms <wharms@bfs.de>
Date: Sat, 25 Feb 2006 12:58:04 +0000
Subject: Re: [KJ] Duplicated request_region code in arch/powerpc and arch/ppc
Message-Id: <4400545C.1040408@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200602250127.18815.tim@aapopfiets.nl>
In-Reply-To: <200602250127.18815.tim@aapopfiets.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

hi tim,
chrp means "Common Hardware Reference Platform" therefore several boards 
can be exspected to have same design. I would add this as 
default_chrp_setup() into chrp_setup.c.

just my 2 cents,
re, walter


Tim Cooijmans wrote:
> These files all request the same regions, namely dma1, dma2, dma page reg, 
> pic1, pic2 and timer:
> 
> arch/powerpc/platforms/chrp/setup.c
> arch/powerpc/platforms/pseries/pci.c
> arch/ppc/platforms/chrp_setup.c
> arch/ppc/platforms/lopec.c
> arch/ppc/platforms/mvme5100.c
> arch/ppc/platforms/pplus.c
> arch/ppc/platforms/sandpoint.c
> 
> Should these requests be moved to a central function?  If so, what should the 
> function be called (i.e., why are the regions requested) and where should it 
> be defined?
> 
> Tim
> 
> 
> ------------------------------------------------------------------------
> 
> _______________________________________________
> Kernel-janitors mailing list
> Kernel-janitors@lists.osdl.org
> https://lists.osdl.org/mailman/listinfo/kernel-janitors
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
