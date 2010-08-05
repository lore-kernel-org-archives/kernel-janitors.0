From: Changli Gao <xiaosuo@gmail.com>
Date: Thu, 05 Aug 2010 13:18:00 +0000
Subject: Re: [patch] isdn: fix information leak
Message-Id: <AANLkTikGNr8aVV7Rryq_dvSuYjUbEo_gRDLW3d49YwF-@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100805093806.GF9031@bicker> <AANLkTin4jtYuaxYfxDAgST857sD2K4Q28mPcPW=xd-V3@mail.gmail.com>
	<20100805101938.GH9031@bicker> <AANLkTi=8ThVqTHpQmDfoon02C-VZ0JwBRtSrU7dzvvNt@mail.gmail.com>
	<20100805113721.GI9031@bicker>
In-Reply-To: <20100805113721.GI9031@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <error27@gmail.com>
Cc: Karsten Keil <isdn@linux-pingi.de>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Aug 5, 2010 at 7:37 PM, Dan Carpenter <error27@gmail.com> wrote:
>
> Both strncpy() and strlcpy() take a limitter. =A0The difference is that
> strlcpy() always takes on a terminator and strncpy() only adds a
> terminator if there is space.
>
> strlcpy() is a BSD function that never caught on in Linux. =A0The glibc
> maintainers think that if you accidentally chop off the last part of a
> word that makes you an idiot. =A0They think you should known the length of
> your data at all times and use memcpy() or a proper string library.
>
> I prefer strlcpy() to strncpy(). =A0Some people do stuff like:
> =A0 =A0 =A0 =A0strncpy(bar, foo, n);
> =A0 =A0 =A0 =A0bar[n] =3D '\0';
> You have to read through the code to find if n is "sizeof(bar)" or
> "sizeof(bar) - 1". =A0Which is a pain in the arse. =A0strlcpy() is explic=
it
> and it's just one line of code instead of two.
>
> The other tricky thing you should remember about strncpy() is that the
> posix version writes NUL chars from the end of the string to the
> limitter but the kernel version only copies one NUL character.
>

You should spend some time on reading the source code of strlcpy() and
strncpy().

the example use of them is:

char dst[24];
char *src =3D "test";

strncpy(dst, src, sizeof(dst) - 1);
strlcpy(dst, src, sizeof(dst));

both of them don't need to zero dst, and they don't need to pad zero
at then end of the dst.

--=20
Regards,
Changli Gao(xiaosuo@gmail.com)
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
