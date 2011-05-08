From: David Miller <davem@davemloft.net>
Date: Sun, 08 May 2011 23:10:12 +0000
Subject: Re: [PATCH] net/bonding: adjust codingstyle for bond_3ad files
Message-Id: <20110508.161012.258121848.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1304791360.1738.6.camel@Joe-Laptop>
	<BANLkTimKs39m_htMFEygR+3Bfu7Butc-zQ@mail.gmail.com>
	<BANLkTik_gMCHYp4sOnzzR1Gs=bn2pkpjfQ@mail.gmail.com>
In-Reply-To: <BANLkTik_gMCHYp4sOnzzR1Gs=bn2pkpjfQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: hlovdal@gmail.com
Cc: mfmooney@gmail.com, joe@perches.com, aquini@linux.com, kernel-janitors@vger.kernel.org, fubar@us.ibm.com, andy@greyhouse.net, shemminger@vyatta.com, netdev@vger.kernel.org, nikai@nikai.net

From: H=E5kon L=F8vdal <hlovdal@gmail.com>
Date: Mon, 9 May 2011 01:08:44 +0200

> On 7 May 2011 21:35, matt mooney <mfmooney@gmail.com> wrote:
>> But isn't the preferred style to have a single exit point?
>=20
> This is generally considered to be a bad advice, see
> http://stackoverflow.com/questions/1701686/why-should-methods-have-a-sing=
le-entry-and-exit-points/1701721#1701721
> for instance.

That article totally ignores the issue of locking and how hard it is
to get right without single exit points, and how unlocking in
multiple spots bloats up the code.

Definitely don't take that article's advice when working on the
kernel.
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
