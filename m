From: Adrian Bunk <bunk@stusta.de>
Date: Fri, 17 Feb 2006 16:41:08 +0000
Subject: Re: [KJ][Patch] make storage class first in pwc-kiara.h
Message-Id: <20060217164108.GJ4422@stusta.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============75485406611193384=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1140174003.7789.14.camel@localhost.localdomain>
In-Reply-To: <1140174003.7789.14.camel@localhost.localdomain>
To: kernel-janitors@vger.kernel.org

--===============75485406611193384==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 17, 2006 at 08:12:51AM -0800, Randy.Dunlap wrote:
> On Fri, 17 Feb 2006, Darren Jenkins\ wrote:
> 
> > G'day list
> >
> > ICC complains about : Remark #82: Storage Class is not First.
> >
> > http://linuxicc.sourceforge.net/
> >
> > @ line 40 & 41 of pwc-kiara.h.
> >
> > The patch below re-orders the modifiers to make extern before const.
> 
> Is that a C-language standard requirement?
> IOW, that would be a reason to make such a change.
>...

It's a coding style issue - different orders of the modifiers only cause 
confusion.

> ~Randy

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


--===============75485406611193384==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============75485406611193384==--
