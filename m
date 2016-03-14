From: Julia Lawall <julia.lawall@lip6.fr>
Date: Mon, 14 Mar 2016 08:29:43 +0000
Subject: Re: [RFC PATCH V2] checkpatch: Check output format style of __func__ uses
Message-Id: <alpine.DEB.2.10.1603140929150.2688@hadrien>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="8323329-1209541255-1457944183=:2688"
List-Id: <kernel-janitors.vger.kernel.org>
References: <83a6236111861645daa6dee9ae7f7aeb03cd7b14.1457896085.git.joe@perches.com>  <5db4d45c04c506d23ab5b35527e2a544e86c4c6d.1457915615.git.joe@perches.com>  <alpine.DEB.2.02.1603140619030.2139@localhost6.localdomain6>
 <1457940942.11972.69.camel@perches.com>
In-Reply-To: <1457940942.11972.69.camel@perches.com>
To: Joe Perches <joe@perches.com>
Cc: Julia Lawall <julia.lawall@lip6.fr>, Andrew Morton <akpm@linux-foundation.org>, Andy Whitcroft <apw@canonical.com>, Dan Carpenter <error27@gmail.com>, kernel-janitors <kernel-janitors@vger.kernel.org>, linux-kernel@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1209541255-1457944183=:2688
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable



On Mon, 14 Mar 2016, Joe Perches wrote:

> On Mon, 2016-03-14 at 06:19 +0100, Julia Lawall wrote:
> > On Sun, 13 Mar 2016, Joe Perches wrote:
> > > Loggng messages that emit function names have many different forms.
> > > Perhaps it'd be better for logging consistency and grep ease to
> > > exclusively use "%s:"
> > >=A0
> > > As well, function tracing logging uses are generally unnecessary given
> > > the kernel's function tracing (ftrace) capability.
> > >=A0
> > > Right now, grep shows these mixtures of forms:
> > >=A0
> > > 13704=A0"%s:"
> > > 3839=A0=A0"%s "
> > > 2787=A0=A0"%s()"
> > >=A0
> > > Some of these are macros definitions of various styles.
> > >=A0
> > > Unfortunately, given the complexity of these macro definition styles,
> > > checkpatch isn't an ideal tool to find these macros.
> > >=A0
> > > Maybe a coccinelle script might be better suited to find and fix all
> > > the various types of uses.
> > >=A0
> > > Add a --fix option for these logging messages with __func__.
> >
> > I'm not good enough at perl to really understand this.=A0 Coudl you giv=
e an=A0
> > example of what it does, and of what it does not do?
>
> For instance, this could do simple conversions like:
>
> $ diff --git a/arch/arm/common/mcpm_entry.c b/arch/arm/common/mcpm_entry.c
> @@ -416 +416 @@ int __init mcpm_loopback(void (*cache_disable)(void))
> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0pr_err("%s returned %d\n", =
__func__, ret);
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0pr_err("%s: returned %d\n",=
 __func__, ret);
>
> But it couldn't find/convert a string concatenation:
>
> #define pch_dbg(adap, fmt, arg...)=A0=A0\
> =A0=A0=A0=A0=A0=A0=A0=A0dev_dbg(adap->pch_adapter.dev.parent, "%s :" fmt,=
 __func__, ##arg)

OK, are there any thoughts about what to do when __func__ is not in the
first position?

julia
--8323329-1209541255-1457944183=:2688--
