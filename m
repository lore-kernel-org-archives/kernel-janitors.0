From: Adrian Bunk <bunk@stusta.de>
Date: Sun, 18 Dec 2005 23:18:35 +0000
Subject: Re: [KJ] KERNEL_VERSION #ifs
Message-Id: <20051218231835.GO23349@stusta.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============15211054193672835=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1134943209.7082.2.camel@alice>
In-Reply-To: <1134943209.7082.2.camel@alice>
To: kernel-janitors@vger.kernel.org

--===============15211054193672835==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Dec 18, 2005 at 03:16:29PM -0700, Matthew Wilcox wrote:
> On Sun, Dec 18, 2005 at 11:00:08PM +0100, Eric Sesterhenn / snakebyte wrote:
> > #if LINUX_VERSION_CODE >= KERNEL_VERSION(2,2,0)
> > 
> > in arch/cris/arch-v32/kernel/fasttimer.c should also be
> > removed (Of course just the if, not the code inside it)
> 
> Yes, but beware that the architecture hasn't been updated in any
> meaningful way since July 27th.  I think cris is pretty much a
> patch-and-run architecture.

The cris maintainers respond to emails, and they should at least get 
copies of patches touching their architecture code.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


--===============15211054193672835==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============15211054193672835==--
