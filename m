From: Adrian Bunk <bunk@stusta.de>
Date: Thu, 19 Jan 2006 02:53:36 +0000
Subject: Re: [KJ] [Patch] change if() BUG();
Message-Id: <20060119025336.GF19398@stusta.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============80521097724330337=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1137533116.20230.15.camel@alice>
In-Reply-To: <1137533116.20230.15.camel@alice>
To: kernel-janitors@vger.kernel.org

--===============80521097724330337==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 18, 2006 at 01:24:02AM +0300, Alexey Dobriyan wrote:
> On Tue, Jan 17, 2006 at 10:25:11PM +0100, Eric Sesterhenn / snakebyte wrote:
> > this patch changes the if() BUG(); construct in
> > drivers/net/ixgb/ixgb_osdep.h to a BUG_ON; so defining
> > BUG to a no-op is safe.
> 
> > --- linux-2.6.15-git11/drivers/net/ixgb/ixgb_osdep.h.orig
> > +++ linux-2.6.15-git11/drivers/net/ixgb/ixgb_osdep.h
> > @@ -60,7 +60,7 @@ typedef enum {
> >  } boolean_t;
> >
> >  #undef ASSERT
> > -#define ASSERT(x)	if(!(x)) BUG()
> > +#define ASSERT(x)	BUG_ON(!(x))
> 
> Naah. Just Drop It (TM).

AFAIR, this driver is both actively maintained by Intel and shared 
between operating systems (e.g. FreeBSD contains the same driver).

Therefore dropping this ASSERT is not possible.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


--===============80521097724330337==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============80521097724330337==--
