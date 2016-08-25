From: Jan Kasprzak <kas@fi.muni.cz>
Date: Thu, 25 Aug 2016 09:13:52 +0000
Subject: Re: wan-cosa: Use memdup_user() rather than duplicating its implementation
Message-Id: <20160825091352.GZ10241@fi.muni.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5d335025-5f52-d4b6-0b60-89a2fd354694@users.sourceforge.net>
 <20160824152154.GT10241@fi.muni.cz>
 <375bce2b-6c19-902e-65ce-cccaedd2184e@users.sourceforge.net>
In-Reply-To: <375bce2b-6c19-902e-65ce-cccaedd2184e@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>, Nicolas Palix <nicolas.palix@imag.fr>

SF Markus Elfring wrote:
: > 	What about the GFP_DMA attribute, which your patch deletes?
: > The buffer in question has to be ISA DMA-able.
:=20
: Thanks for your constructive feedback.
:=20
: Would you be interested in using a variant of the function "memdup_=E2=80=
=A6"
: with which the corresponding memory allocation option can be preserved?

	I am not sure that extending an in-kernel API just for one
legacy driver is what we want. As I said, I would prefer the driver
unchanged, if possible.

	Maybe it is the time for gradually phasing out ISA DMA support and
all the legacy drivers which use it?

	Sincerely,

-Yenya

--=20
| Jan "Yenya" Kasprzak <kas at {fi.muni.cz - work | yenya.net - private}> |
| http://www.fi.muni.cz/~kas/                         GPG: 4096R/A45477D5 |
         Like most things in Windows, on the surface it looks great.
                         -- Jeremy Allison, A Tale of Two Standards
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
