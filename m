From: Joe Perches <joe@perches.com>
Date: Thu, 07 Jan 2016 20:28:50 +0000
Subject: Re: net-thunder: One check less in nicvf_register_interrupts() after error detection
Message-Id: <1452198530.4028.43.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <5685A273.6070607@users.sourceforge.net>
 <20160107110701.GE25086@rric.localdomain>
 <568EBCE7.4060502@users.sourceforge.net>
 <1452195846.4028.24.camel@perches.com>
 <568EC2FD.9000702@users.sourceforge.net>
 <1452196790.4028.33.camel@perches.com> <568EC56A.402@users.sourceforge.net>
In-Reply-To: <568EC56A.402@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-arm-kernel@lists.infradead.org

On Thu, 2016-01-07 at 21:07 +0100, SF Markus Elfring wrote:
> > > * Which object code representations would you find representative
> > > =A0 for a further constructive discussion around this
> > > =A0 software component?
> >=20
> > Evidence of actual object code improvement
>=20
> How do you think about to provide a function implementation
> which looks a bit more efficient by default?

It's not a matter of "looks a bit more efficient".
it's taste, style, and repetition for various functions.

Some prefer that source code be "templatized" regardless
of the number of exit points that any particular use of a
specific function type.

Some of your patches are converting these templatized
functions to a different form for no added value.

These patches make the local source code inconsistent
and generally goes against the authors preferred style.

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
