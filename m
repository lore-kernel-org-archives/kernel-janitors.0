From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 07 Oct 2016 06:23:20 +0000
Subject: Re: scripts/coccicheck: Update for a comment?
Message-Id: <8d36952c-1dbb-bb26-ee57-3e1540c042c0@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <ea62a1ea-c566-65a0-e2fd-2ee96839cf48@users.sourceforge.net>
 <alpine.DEB.2.10.1610070749420.3074@hadrien>
 <76a6d8fa-03b9-5589-2885-fa62933dd391@users.sourceforge.net>
 <alpine.DEB.2.10.1610070803550.3074@hadrien>
In-Reply-To: <alpine.DEB.2.10.1610070803550.3074@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: cocci@systeme.lip6.fr

>>>> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/tree/=
scripts/coccicheck?id=C802e87fbe2d4dd58982d01b3c39bc5a781223aa#n4
>>>
>>> How about submitting a patch to fix the problem?
>>
>> I would appreciate to become a bit more sure about the current storage l=
ocation
>> which should be referenced in this file.
>=20
> In the Documentation directory find . -name "*cocci*"
>=20
> gives
>=20
> ./dev-tools/coccinelle.rst
>=20
> I think you could have done that yourself.

Does the usage of the format "reStructuredText" trigger further considerati=
ons
like the following?

* Does your feedback suggest that the path from this source file should be =
put
  in related places?

* Would it make sense to store such a file name in a special variable?

* When would you refer to generated file formats (like PDF) for this use ca=
se?

Regards,
Markus
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
