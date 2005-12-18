From: Matthew Wilcox <matthew@wil.cx>
Date: Sun, 18 Dec 2005 22:16:29 +0000
Subject: Re: [KJ] KERNEL_VERSION #ifs
Message-Id: <20051218221629.GN2361@parisc-linux.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============057048361892483523=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1134943209.7082.2.camel@alice>
In-Reply-To: <1134943209.7082.2.camel@alice>
To: kernel-janitors@vger.kernel.org

--===============057048361892483523==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Dec 18, 2005 at 11:00:08PM +0100, Eric Sesterhenn / snakebyte wrote:
> #if LINUX_VERSION_CODE >= KERNEL_VERSION(2,2,0)
> 
> in arch/cris/arch-v32/kernel/fasttimer.c should also be
> removed (Of course just the if, not the code inside it)

Yes, but beware that the architecture hasn't been updated in any
meaningful way since July 27th.  I think cris is pretty much a
patch-and-run architecture.


--===============057048361892483523==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============057048361892483523==--
