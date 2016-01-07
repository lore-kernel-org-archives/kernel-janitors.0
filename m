From: Joe Perches <joe@perches.com>
Date: Thu, 07 Jan 2016 19:59:50 +0000
Subject: Re: net-thunder: One check less in nicvf_register_interrupts() after error detection
Message-Id: <1452196790.4028.33.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <5685A273.6070607@users.sourceforge.net>
 <20160107110701.GE25086@rric.localdomain>
 <568EBCE7.4060502@users.sourceforge.net>
 <1452195846.4028.24.camel@perches.com>
 <568EC2FD.9000702@users.sourceforge.net>
In-Reply-To: <568EC2FD.9000702@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-arm-kernel@lists.infradead.org

On Thu, 2016-01-07 at 20:56 +0100, SF Markus Elfring wrote:
> > > Is it a bit more efficient to avoid a double check for the
> > > variable "ret" at the end of the current implementation for the
> > > discussed function?
> >=20
> > Before asking questions you could answer yourself,
> > please look at object code produced by the compiler
> > before and after your proposed changes.
>=20
> * Do any more source code reviewers wonder about the need
> =A0 for such a double check?

Given the feedback you've already received,
it seems so.

> * Which object code representations would you find representative
> =A0 for a further constructive discussion around this
> =A0 software component?

Evidence of actual object code improvement when
with compiled with optimizations.

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
