From: Joe Perches <joe@perches.com>
Date: Fri, 01 Jul 2016 16:23:19 +0000
Subject: Re: mfd: dm355evm_msp: Refactoring for add_child()
Message-Id: <1467390199.21157.5.camel@perches.com>
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
	 <1467318883.24287.171.camel@perches.com>
	 <447162e7-5183-e589-74bc-0023a1442ebd@users.sourceforge.net>
In-Reply-To: <447162e7-5183-e589-74bc-0023a1442ebd@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: Lee Jones <lee.jones@linaro.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

On Fri, 2016-07-01 at 16:40 +0200, SF Markus Elfring wrote:
> >=20
> > Can you please fix your email client to _not_ send References:
> > and In-reply-to: headers when sending new patches?
> I prefer to associate some patches with previous relevant
> discussion directly.
>=20
>=20
> >=20
> > Even better would be to use git send-email for these patches.
> This command can also support a parameter like "--thread", can't it?

yes, good to see you can read documentation.

> Would you like point any more views out about communication styles?

Actually, yes.

Just because you've submitted a similar patch, an
independent patch like this one, doesn't need to
refer to those patches you've previously submitted.

For instance, your "References:" for this email
imply some association to a patch series you submitted
"[PATCH v3 0/3] gianfar: Fine-tuning for gfar_ethflow_to_filer_table()"
for no obvious reason. =A0What is this reason?

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
