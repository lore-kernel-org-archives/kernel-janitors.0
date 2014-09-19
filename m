From: Julia Lawall <julia.lawall@lip6.fr>
Date: Fri, 19 Sep 2014 13:50:01 +0000
Subject: Re: [HPDD-discuss] [PATCH] staging: lustre: llite: Use kzalloc and rewrite null tests
Message-Id: <alpine.DEB.2.10.1409191546440.2525@hadrien>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="8323329-123650081-1411134607=:2525"
List-Id: <kernel-janitors.vger.kernel.org>
References: <1411071842-24714-1-git-send-email-Julia.Lawall@lip6.fr> <1411071842-24714-2-git-send-email-Julia.Lawall@lip6.fr> <20140918234309.GP17875@mwanda> <E43F4FD2-3A79-485E-960B-A12960B3D2B7@intel.com> <517B3353-BD3C-4326-A8F4-F1775B4865E5@intel.com>
 <alpine.DEB.2.10.1409190637190.2507@hadrien> <4533064F-A093-4DED-8294-CF049CB591A8@intel.com>
In-Reply-To: <4533064F-A093-4DED-8294-CF049CB591A8@intel.com>
To: "Drokin, Oleg" <oleg.drokin@intel.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, "<devel@driverdev.osuosl.org>" <devel@driverdev.osuosl.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "<kernel-janitors@vger.kernel.org>" <kernel-janitors@vger.kernel.org>, "<linux-kernel@vger.kernel.org>" <linux-kernel@vger.kernel.org>, "<HPDD-discuss@ml01.01.org>" <HPDD-discuss@ml01.01.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-123650081-1411134607=:2525
Content-Type: TEXT/PLAIN; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable



On Fri, 19 Sep 2014, Drokin, Oleg wrote:

> Hello!
>
>    First, thanks for your patches and efforts spent on these cleanups.
>
> On Sep 19, 2014, at 12:45 AM, Julia Lawall wrote:
>
> > With respect to the upper case lower case issue, does the thing need to=
 be
> > a macro?  I think that the lowercase is more or less fine, but only if
> > what is behind it is a function.
>
> I don't have a strong opinion either way as long as we have all the funct=
ionality
> we need.
>
> > I say more or less fine, because normally in the kernel the special
> > allocators have special purposes, eg allocating and initializing the xyz
> > structure.  Here what is wanted is a general purpose allocator with lots
> > of special tracing features, so it is not quite the same thing.  And one
> > can wonder why all of these special tracing features are not relevant to
> > the kernel as a whole?
>
> Like I explained in my previous email, many of the tracing features are a=
lready
> possible to replace with other existing in-kernel mechanisms like kmemlea=
k.
>
> Except the total tally of allocations/frees so that a memleak could be vi=
sibly
> easily seen on module unload time. I think this would be useful for other
> kinds of modules too, not just lustre, so having that as a generic alloca=
tor
> feature would be cool too.
>
> > In reading through the description of the needed features, it seems like
> > only the _ptr extension requires being a macro.  Do we need that?  The
>
> We only need that as a less error-prone way of having
> x =3D obd_kzalloc(sizeof(*x), =85.)
> =85
> obd_free(=85, sizeof(*x))
>
> Real free function does not take size argument, but we need that for
> total allocated/freed accounting. Easy to have disconnect with
> the size argument of obd_free to be wrong.
>
> > rest of the kernel manages to do x =3D kzalloc(sizeof(*x),...) ok.  It's
> > unpleasant to have an assignment hidden in this way.  And currently it =
is
> > not used consistently.  There are some OBD_ALLOCs that have the same fo=
rm.
>
> Yes, those are converted as thy are noticed.
>
> > Sorry for overlooking the frees.  I was focusing on trying one thing at=
 a
> > time...
>
> I kind of think it's a related issue.
> Touching ones needs to touch the other if not in the same patch then in
> a next patch. And that's why I think consideations for what FREEs would n=
eed
> is needed from the start, so the FREEs removal patch does not goes and pa=
tches a bunch of just patched allocs.

Sure, it's fine.

Where do you want to go from here?  Should I propose function definitions
for obd_alloc and obd_free?  Could we leave the vmalloc issue for a future
set of changes?

julia
--8323329-123650081-1411134607=:2525--
