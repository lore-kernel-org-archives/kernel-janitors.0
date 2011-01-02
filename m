From: Dan Carpenter <error27@gmail.com>
Date: Sun, 02 Jan 2011 05:34:09 +0000
Subject: Re: [PATCH 2/2] staging: keucr: Use memcpy() instad of custom
Message-Id: <20110102053409.GK1886@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1293823712-6273-3-git-send-email-martinez.javier@gmail.com>
In-Reply-To: <1293823712-6273-3-git-send-email-martinez.javier@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On Sun, Jan 02, 2011 at 12:41:33AM +0100, G=E1bor Stefanik wrote:
> On Fri, Dec 31, 2010 at 8:28 PM, Javier Martinez Canillas
> <martinez.javier@gmail.com> wrote:
> > + =A0 =A0 =A0 DWORD err;
> > + =A0 =A0 =A0 err =3D correct_data(buf, redundant_ecc, *(calculate_ecc+=
1),
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*(calculate_ecc), =
*(calculate_ecc+2));
>=20
> Any reason why you didn't unify these 2 lines? Like this: DWORD err > cor=
rect_data(...);
>=20

These kind of things aren't described in CodingStyle so they're up to
whoever writes the code to decide.  Or if the maintainer is a
micromanager the maintainer can decide.

But personally I much prefer to put anything complicated on separate
lines.  No one reads the initializers.  In my work with Smatch I see a
lot of bugs like this:

	int x =3D foo->bar;

	if (!foo)
		return -EINVAL;

It's astounding how many.  The famous tun.c security bug was one of
these.

But there should  have been a blank line between the initializers and
the code.  Otherwise people will think the code is initiliazation and
ignore it.  That is in CodingStyle I think.  We can fix that when we get
rid of the DWORD data type in a later patch (don't resend).

regards,
dan carpenter

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
