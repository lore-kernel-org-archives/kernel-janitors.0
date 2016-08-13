From: Joe Perches <joe@perches.com>
Date: Sat, 13 Aug 2016 19:54:48 +0000
Subject: Re: staging: ks7010: Replace three printk() calls by pr_err()
Message-Id: <1471118088.3467.55.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5307CAA2.8060406@users.sourceforge.net>
	 <530A72AA.3000601@users.sourceforge.net>
	 <alpine.DEB.2.02.1402240658210.2090@localhost6.localdomain6>
	 <530B5FB6.6010207@users.sourceforge.net>
	 <alpine.DEB.2.10.1402241710370.2074@hadrien>
	 <530C5E18.1020800@users.sourceforge.net>
	 <alpine.DEB.2.10.1402251014170.2080@hadrien>
	 <530CD2C4.4050903@users.sourceforge.net>
	 <alpine.DEB.2.10.1402251840450.7035@hadrien>
	 <530CF8FF.8080600@users.sourceforge.net>
	 <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6>
	 <530DD06F.4090703@users.sourceforge.net>
	 <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
	 <5317A59D.4@users.sourceforge.net>
	 <66bd684a-98f1-0ec4-aa95-1a966d7c4e90@users.sourceforge.net>
	 <7fcc8cb1-012a-a66e-6563-6867862f3229@users.sourceforge.net>
	 <1471e8af-129d-8a7a-c7d9-1e1fbe0237ec@users.sourceforge.net>
	 <1471031030.18251.18.camel@perches.com>
	 <a6b96b51-a602-f22d-b853-0ee2f142fb67@users.sourceforge.net>
	 <1471109478.3467.33.camel@perches.com>
	 <3837d167-b920-d36f-3b75-f37d4b92031d@users.sourceforge.net>
In-Reply-To: <3837d167-b920-d36f-3b75-f37d4b92031d@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: devel@driverdev.osuosl.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Wolfram Sang <wsa@the-dreams.de>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>, Jean Delvare <jdelvare@suse.de>

On Sat, 2016-08-13 at 21:30 +0200, SF Markus Elfring wrote:
> >=20
> > I think pr_ is OK if reworking the code
> > to support dev_ is not easy.
> Thanks for this explanation. - It sounds more constructive than the previ=
ous short
> feedback "Not correct".

<frustration>
How do you need your food prepared?
Do others need to cut it for you to bite sized pieces?
</frustration>

You might have noticed I also wrote in the same reply:

"All of these pr_fmt uses are redundant as pr_err already does pr_fmt"

> > > Would you accept that another update will be appended to the discusse=
d patch series?
> > No.=A0=A0Patches should not knowingly introduce defects
> > that are corrected in follow-on patches.
> This view is fine in principle.

It is not just principle.
It is a fundamental for kernel patch submission.

> I am just curious on the preferred sequence to fix the affected implement=
ation details.
>=20
> 1. I imagine that my questionable update suggestion "[PATCH v2 08/10] sta=
ging: ks7010:
> =A0=A0=A0Replace three printk() calls by pr_err()" can be skipped and the=
 remaining logging
> =A0=A0=A0calls will be improved somehow a bit later.
>=20
> Or:
>=20
> 2. Do you want a resend of this whole patch series?

I am not an upstream path.
Greg KH generally serves that function here.
My suggestion would be to resend the entire patchset as V(n+1).
> It might be that I can occasionally become picky to check if other contri=
butors
> insist on the usage of a specific error message.

You can be prone to understatement.

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
