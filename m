From: Eugene Teo <eugene.teo@eugeneteo.net>
Date: Mon, 12 Jan 2004 12:10:12 +0000
Subject: Re: [Kernel-janitors] [announce] new KJ web hosting
Message-Id: <20040112121012.GB5834@eugeneteo.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040111193612.2b4445fc.rddunlap@osdl.org>
In-Reply-To: <20040111193612.2b4445fc.rddunlap@osdl.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

<quote sender="Domen Puncer">
> On Monday 12 of January 2004 04:36, Randy.Dunlap wrote:
> > If you haven't already noticed it, the kernel janitors web page
> > has moved to http://janitor.kernelnewbies.org .
> >
> > That web page tells you about KJ CVS, #irc, email, etc.
> 
> # host irc.openprojects.net
> Host irc.openprojects.net not found: 3(NXDOMAIN)

irc.kernelnewbies.org

> In TODO and README there's still the old ml address:
> kernel-janitor-discuss@lists.sourceforge.net
> 
> README:
> Linux 2.5 kernel bugs are tracked at <http://bugzilla.kernel.org/>
> 2.5/2.6 might be better?
> 
> TODO:
> http://www.lib.uaa.alaska.edu/linux-kernel/archive/2001-Week-11/0150.html
> gives 404
> 
> May i suggest adding this to TODO:
> - replacing __FUNCTION__ with __func__ .
> - pr_debug() from kernel.h could replace a lot of DPRINTK and similar macros.
> - same for pr_info()
> - min/max macros from kernel.h are safe, a lot of handcrafted MIN/MAX are not.
> 
> 
> 	Domen
> 
> _______________________________________________
> Kernel-janitors mailing list
> Kernel-janitors@lists.osdl.org
> http://lists.osdl.org/mailman/listinfo/kernel-janitors
> 

-- 
Eugene TEO   <eugeneteo@eugeneteo.net>   <http://www.anomalistic.org/>
1024D/14A0DDE5 print D851 4574 E357 469C D308  A01E 7321 A38A 14A0 DDE5
main(i) { putchar(182623909 >> (i-1) * 5&31|!!(i<7)<<6) && main(++i); }

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
