From: Julia Lawall <julia.lawall@lip6.fr>
Date: Fri, 22 Sep 2017 10:54:14 +0000
Subject: Re: [PATCH] wireless: iwlegacy: make const array static to shink object code size Content-Type: text
Message-Id: <alpine.DEB.2.20.1709221252430.3170@hadrien>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="8323329-1153938889-1506077654=:3170"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170921225630.21916-1-colin.king@canonical.com>         <alpine.DEB.2.20.1709220921350.2024@hadrien>         <1506074588.12311.37.camel@perches.com>         <f6cb5b73-4ed5-92d9-3909-32b8e3aafc45@canonical.com>         <alpine.DEB.2.20.1709221206050.3170@hadrien>
 <1506077181.12311.39.camel@perches.com>
In-Reply-To: <1506077181.12311.39.camel@perches.com>
To: Joe Perches <joe@perches.com>
Cc: Colin Ian King <colin.king@canonical.com>, Stanislaw Gruszka <sgruszka@redhat.com>, Kalle Valo <kvalo@codeaurora.org>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

--8323329-1153938889-1506077654=:3170
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable



On Fri, 22 Sep 2017, Joe Perches wrote:

> On Fri, 2017-09-22 at 12:06 +0200, Julia Lawall wrote:
> >
> > On Fri, 22 Sep 2017, Colin Ian King wrote:
> >
> > > On 22/09/17 11:03, Joe Perches wrote:
> > > > On Fri, 2017-09-22 at 09:23 +0200, Julia Lawall wrote:
> > > > >
> > > > > On Thu, 21 Sep 2017, Colin King wrote:
> > > > >
> > > > > > From: Colin Ian King <colin.king@canonical.com>
> > > > > >
> > > > > > Don't populate const array ac_to_fifo on the stack in an inlined
> > > > > > function, instead make it static.  Makes the object code smaller
> > > > > > by over 800 bytes:
> > > > > >
> > > > > >    text	   data	    bss	    dec	    hex	filename
> > > > > >  159029	  33154	   1216	 193399	  2f377	4965-mac.o
> > > > > >
> > > > > >    text	   data	    bss	    dec	    hex	filename
> > > > > >  158122	  33250	   1216	 192588	  2f04c	4965-mac.o
> > > > > >
> > > > > > (gcc version 7.2.0 x86_64)
> > > > >
> > > > > Gcc 7 must be much more aggressive about inlining than gcc 4.  He=
re is the
> > > > > change that I got on this file:
> > > > >
> > > > >      text          data     bss     dec     hex filename
> > > > > -   76346          1494     152   77992   130a8 drivers/net/wirel=
ess/intel/iwlegacy/4965-mac.o
> > > > > +   76298          1494     152   77944   13078 drivers/net/wirel=
ess/intel/iwlegacy/4965-mac.o
> > > > > decrease of 48
> > > >
> > > > More likely different CONFIG options.
> > > >
> > > > e.g. allyesconfig vs defconfig with wireless
> > > >
> > >
> > > yup, I used allyesconfig
> >
> > Mine is also allyesconfig.
>
> Odd.
>
> Here is what I get: (Sorry, no gcc-7)
>
> gcc4: gcc-4.9 (Ubuntu 4.9.4-2ubuntu1) 4.9.4
> gcc5: gcc-5 (Ubuntu 5.4.1-8ubuntu1) 5.4.1 20170304
> gcc6: gcc-6 (Ubuntu 6.3.0-12ubuntu2) 6.3.0 20170406
>
> $ size drivers/net/wireless/intel/iwlegacy/4965-mac.o*
> =A0=A0=A0text	=A0=A0=A0data	=A0=A0=A0=A0bss	=A0=A0=A0=A0dec	=A0=A0=A0=A0h=
ex	filename
> =A0118559	=A0=A0=A01766	=A0=A0=A0=A0152	=A0120477	=A0=A01d69d	drivers/net=
/wireless/intel/iwlegacy/4965-mac.o.gcc4.allyesconfig.new
> =A0118623	=A0=A0=A01766	=A0=A0=A0=A0152	=A0120541	=A0=A01d6dd	drivers/net=
/wireless/intel/iwlegacy/4965-mac.o.gcc4.allyesconfig.old

My gcc is 4.8.4 (Ubuntu 4.8.4-2ubuntu1~14.04.3)

You get a savings of 64 and I got a savings of 48, but it's not that big a
difference, compared to what the later versions give.

julia

> =A0 51595	=A0=A0=A01156	=A0=A0=A0=A0=A0=A00	=A0=A052751	=A0=A0=A0ce0f	dri=
vers/net/wireless/intel/iwlegacy/4965-mac.o.gcc4.defconfig.new
> =A0 51659	=A0=A0=A01156	=A0=A0=A0=A0=A0=A00	=A0=A052815	=A0=A0=A0ce4f	dri=
vers/net/wireless/intel/iwlegacy/4965-mac.o.gcc4.defconfig.old
> =A0141956	=A0=A029790	=A0=A0=A01216	=A0172962	=A0=A02a3a2	drivers/net/wir=
eless/intel/iwlegacy/4965-mac.o.gcc5.allyesconfig.new
> =A0142671	=A0=A029702	=A0=A0=A01216	=A0173589	=A0=A02a615	drivers/net/wir=
eless/intel/iwlegacy/4965-mac.o.gcc5.allyesconfig.old
> =A0 51733	=A0=A0=A01156	=A0=A0=A0=A0=A0=A00	=A0=A052889	=A0=A0=A0ce99	dri=
vers/net/wireless/intel/iwlegacy/4965-mac.o.gcc5.defconfig.new
> =A0 51813	=A0=A0=A01156	=A0=A0=A0=A0=A0=A00	=A0=A052969	=A0=A0=A0cee9	dri=
vers/net/wireless/intel/iwlegacy/4965-mac.o.gcc5.defconfig.old
> =A0152991	=A0=A029790	=A0=A0=A01216	=A0183997	=A0=A02cebd	drivers/net/wir=
eless/intel/iwlegacy/4965-mac.o.gcc6.allyesconfig.new
> =A0153722	=A0=A029702	=A0=A0=A01216	=A0184640	=A0=A02d140	drivers/net/wir=
eless/intel/iwlegacy/4965-mac.o.gcc6.allyesconfig.old
> =A0 51813	=A0=A0=A01156	=A0=A0=A0=A0=A0=A00	=A0=A052969	=A0=A0=A0cee9	dri=
vers/net/wireless/intel/iwlegacy/4965-mac.o.gcc6.defconfig.new
> =A0 51893	=A0=A0=A01156	=A0=A0=A0=A0=A0=A00	=A0=A053049	=A0=A0=A0cf39	dri=
vers/net/wireless/intel/iwlegacy/4965-mac.o.gcc6.defconfig.old
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors=
" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
--8323329-1153938889-1506077654=:3170--
