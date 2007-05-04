From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 04 May 2007 08:37:16 +0000
Subject: Re: [KJ] what's the point of all those "#if[n]def __KERNEL__"
Message-Id: <200705041037.16959.arnd@arndb.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0705040337450.19670@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0705040337450.19670@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On Friday 04 May 2007, Robert P. J. Day wrote:
> =A0 i'm well aware that the point of the conditional __KERNEL__
> directives is to identify header file content that isn't appropriate
> for userspace, so it can be stripped out when running "make
> headers_install". =A0but is there any *other* purpose to that check?

not any more

> that is, if a header file is not being exported to userspace, is there
> any point to having a test of that sort?

no

> =A0 i'm only asking because i was poking around and noticed that
> lots of header files contain a check of that sort that aren't marked
> for export to userspace. =A0for example. some arch/ppc headers:
>=20
> $ grep -r "#if.*__KERNEL__" arch/ppc
> arch/ppc/platforms/mvme5100.h:#ifdef __KERNEL__
> arch/ppc/platforms/mbx.h:#ifdef __KERNEL__
> arch/ppc/platforms/pq2ads.h:#ifdef __KERNEL__
> arch/ppc/platforms/tqm8xx.h:#ifdef __KERNEL__
> arch/ppc/platforms/ivms8.h:#ifdef __KERNEL__
> ... snip ...
>=20
> those headers certainly don't get anywhere near userspace, so what
> exactly are they testing for? =A0i'm just curious.

This is historic baggage. ppc used to install all headers
and therefore we had #ifdf __KERNEL__ in most of them to avoid
the contents to be seen.

> p.s. =A0just to clarify something about "make headers_install", as i
> understand it, headers that are listed in Kbuild files with
> "headers-y" are exported as is, while those listed with "unifdef-y" ar
> first unifdef'ed, then exported. =A0is that correct?

yes

	Arnd <><

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
