From: Joe Perches <joe@perches.com>
Date: Thu, 30 Jun 2016 20:34:43 +0000
Subject: Re: [PATCH] mfd: dm355evm_msp: Refactoring for add_child()
Message-Id: <1467318883.24287.171.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
	 <5682D228.7070902@users.sourceforge.net> <20160111082922.GB14104@x1>
	 <05b7db2a-437a-60ac-d289-71d2150e7f5f@users.sourceforge.net>
	 <de3598c4-f85a-6807-303a-55ee0ac707f2@users.sourceforge.net>
	 <20160608111442.GB14888@dell>
	 <e4eaf0b4-e539-b400-c8a2-70f210cee1fa@users.sourceforge.net>
	 <75c1cc23-3a2d-db78-d0f2-b5934b18e828@users.sourceforge.net>
	 <20160628150725.GL24982@dell>
	 <c220895b-e56f-dc95-500d-0cf9d2f51777@users.sourceforge.net>
	 <20160628163146.GG29166@dell>
	 <69e96aa0-f3d9-d70d-c3ec-d39b5e9d9f14@users.sourceforge.net>
In-Reply-To: <69e96aa0-f3d9-d70d-c3ec-d39b5e9d9f14@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: SF Markus Elfring <elfring@users.sourceforge.net>, Lee Jones <lee.jones@linaro.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

On Thu, 2016-06-30 at 22:15 +0200, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Thu, 30 Jun 2016 21:54:51 +0200
>=20
> Adjust jump targets according to the Linux coding style convention.
> Another check for the variable "status" can be omitted then at the
> end.

Two headers in this email:

References: <566ABCD9.1060404@users.sourceforge.net> <5682D228.7070902@user=
s.sourceforge.net> <20160111082922.GB14104@x1> <05b7db2a-437a-60ac-d289-71d=
2150e7f5f@users.sourceforge.net> <de3598c4-f85a-6807-303a-55ee0ac707f2@user=
s.sourceforge.net> <20160608111442.GB14888@dell> <e4eaf0b4-e539-b400-c8a2-7=
0f210cee1fa@users.sourceforge.net> <75c1cc23-3a2d-db78-d0f2-b5934b18e828@us=
ers.sourceforge.net> <20160628150725.GL24982@dell> <c220895b-e56f-dc95-500d=
-0cf9d2f51777@users.sourceforge.net> <20160628163146.GG29166@dell>
In-reply-to: <20160628163146.GG29166@dell>=A0

Can you please fix your email client to _not_ send References:
and In-reply-to: headers when sending new patches? =A0Thanks.

Even better would be to use git send-email for these patches.

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
