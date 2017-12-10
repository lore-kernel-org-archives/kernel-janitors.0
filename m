From: Jonathan Cameron <jic23@kernel.org>
Date: Sun, 10 Dec 2017 16:08:29 +0000
Subject: Re: =?UTF-8?B?aWlvL+KApjo=?= Use common error handling code
Message-Id: <20171210160829.16128419@archlinux>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5ab7e200-2dea-63e2-06db-0e185f563d16@users.sourceforge.net>
        <0f26a13b-7bbf-525b-a864-8aa8e13c3aef@users.sourceforge.net>
        <20171026174200.5c00b06d@archlinux>
        <e7292cc3-e4e2-0943-7cf9-4852cf37ef36@users.sourceforge.net>
In-Reply-To: <e7292cc3-e4e2-0943-7cf9-4852cf37ef36@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-iio@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>

On Sun, 10 Dec 2017 13:33:01 +0100
SF Markus Elfring <elfring@users.sourceforge.net> wrote:

> > Again, a general kernel development rule is to float only one
> > patch of a given type until you have had feedback on it. =20
>=20
> A few weeks later =E2=80=A6
>=20
>=20
> > As I said in one of the other patches, I always reply to all
> > patches I am rejecting so that anyone coming across them later
> > on their own from an archive or similar can immediately see the
> > reasons why they are a bad idea without having to know the mailing
> > list context. =20
>=20
> Can you get into the mood to clarify any remaining change possibilities
> a bit more?

Hi Markus, I've accepted the ones that I think made an improvement
outweighing the inherent small costs of making any change.

So in short, any changes around common error handling need to
improve the maintainability of the code.  So if we are unifying error
paths they need to be simple and obviously the same.

We also need to avoid code constructs that are unusual in error handling
such as backwards gotos.

Note however that most of the changes made so far are only minor improvemen=
ts.
I am not saying I don't appreciate them, but rather than that they are of
of low importance.

Thanks,

Jonathan


--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
