From: Devin Heitmueller <dheitmueller@kernellabs.com>
Date: Tue, 25 Jan 2011 23:05:37 +0000
Subject: Re: [PATCH] video/saa7164: Fix sparse warning: Using plain integer as
Message-Id: <AANLkTinap-4djdUORmOnnnVFtTm4wSxMqTNVxrfg2jYw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1295988851-23561-1-git-send-email-peterhuewe@gmx.de>
	<Pine.LNX.4.64.1101252319570.3668@ask.diku.dk>
	<201101252354.31217.PeterHuewe@gmx.de>
In-Reply-To: <201101252354.31217.PeterHuewe@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: =?ISO-8859-1?Q?Peter_H=FCwe?= <PeterHuewe@gmx.de>
Cc: Julia Lawall <julia@diku.dk>, Mauro Carvalho Chehab <mchehab@infradead.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Steven Toth <stoth@kernellabs.com>, Tejun Heo <tj@kernel.org>, Dan Carpenter <error27@gmail.com>

On Tue, Jan 25, 2011 at 5:54 PM, Peter H=FCwe <PeterHuewe@gmx.de> wrote:
> Hi Julia,
>
> thanks for your input.
> So do I understand you correctly if I say
> if(!x) is better than if(x=3DNULL) in any case?
>
> Or only for the kmalloc family?
>
> Do you remember the reason why !x should be preferred?
>
> In Documentation/CodingStyle , =A0Chapter 7: Centralized exiting of funct=
ions
> there is a function fun with looks like this:
> int fun(int a)
> {
> =A0 =A0int result =3D 0;
> =A0 =A0char *buffer =3D kmalloc(SIZE);
>
> =A0 =A0if (buffer =3D NULL)
> =A0 =A0 =A0 =A0return -ENOMEM;
>
> =A0 =A0if (condition1) {
> =A0 =A0 =A0 =A0while (loop1) {
> =A0 =A0 =A0 =A0 =A0 =A0...
> =A0 =A0 =A0 =A0}
> =A0 =A0 =A0 =A0result =3D 1;
> =A0 =A0 =A0 =A0goto out;
> =A0 =A0}
> =A0 =A0...
> out:
> =A0 =A0kfree(buffer);
> =A0 =A0return result;
> }
>
>
> --> =A0So =A0 if (buffer =3D NULL) is in the official CodingStyle - maybe=
 we should
> add a paragraph there as well ;)
>
>
> Don't get me wrong, I just want to learn ;)

To my knowledge, the current CodingStyle doesn't enforce a particular
standard in this regard, leaving it at the discretion of the author.

Whether to do (!foo) or (foo =3D NULL) is one of those debates people
have similar to whether to use tabs as whitespace.  People have
differing opinions and there is no clearly "right" answer.  Personally
I strongly prefer (foo =3D NULL) as it makes it blindingly obvious that
it's a pointer comparison, whereas (!foo) leaves you wondering whether
it's an integer or pointer comparison.

All that said, you shouldn't submit patches which arbitrarily change
from one format to the other.  With regards to the proposed patch, you
should follow whatever style the author employed in the rest of the
file.

Cheers,

Devin

--=20
Devin J. Heitmueller - Kernel Labs
http://www.kernellabs.com
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
