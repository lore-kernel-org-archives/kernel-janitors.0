From: "Randy.Dunlap" <rdunlap@xenotime.net>
Date: Fri, 17 Feb 2006 16:47:54 +0000
Subject: Re: [KJ][Patch] make storage class first in pwc-kiara.h
Message-Id: <Pine.LNX.4.58.0602170847330.23987@shark.he.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============41219658999794162=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1140174003.7789.14.camel@localhost.localdomain>
In-Reply-To: <1140174003.7789.14.camel@localhost.localdomain>
To: kernel-janitors@vger.kernel.org

--===============41219658999794162==
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Fri, 17 Feb 2006, Adrian Bunk wrote:

> On Fri, Feb 17, 2006 at 08:12:51AM -0800, Randy.Dunlap wrote:
> > On Fri, 17 Feb 2006, Darren Jenkins\ wrote:
> >
> > > G'day list
> > >
> > > ICC complains about : Remark #82: Storage Class is not First.
> > >
> > > http://linuxicc.sourceforge.net/
> > >
> > > @ line 40 & 41 of pwc-kiara.h.
> > >
> > > The patch below re-orders the modifiers to make extern before const.
> >
> > Is that a C-language standard requirement?
> > IOW, that would be a reason to make such a change.
> >...
>
> It's a coding style issue - different orders of the modifiers only cause
> confusion.

Maybe, but that wasn't his justification for the patch.

-- 
~Randy

--===============41219658999794162==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============41219658999794162==--
