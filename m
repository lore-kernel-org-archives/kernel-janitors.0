From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 23 Jul 2010 19:21:35 +0000
Subject: Re: [patch -next] ath5k: snprintf() returns largish values
Message-Id: <AANLkTi==h70Cgj-SzRShVU1eJ1CGkL93-5XV55Ry6-eD@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100722085202.GV17585@bicker> <201007231744.14922.br1@einfach.org>
	<20100723095252.GA26313@bicker> <1279907297.24768.1678.camel@Joe-Laptop.home>
In-Reply-To: <1279907297.24768.1678.camel@Joe-Laptop.home>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Joe Perches <joe@perches.com>
Cc: Dan Carpenter <error27@gmail.com>, Bruno Randolf <br1@einfach.org>, "Luis R. Rodriguez" <lrodriguez@atheros.com>, Nick Kossifidis <mickflemm@gmail.com>, Jiri Slaby <jirislaby@gmail.com>, Bob Copeland <me@bobcopeland.com>, "John W. Linville" <linville@tuxdriver.com>, linux-wireless@vger.kernel.org, ath5k-devel@venema.h4ckr.net, kernel-janitors <kernel-janitors@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

On Fri, Jul 23, 2010 at 10:48 AM, Joe Perches <joe@perches.com> wrote:
>
> There are also many repeated uses of snprintf in kernel sources
> that could similarly be a problem.
>
> =A0 =A0 =A0 =A0bar +=3D snprintf(foo + bar, ...)
> =A0 =A0 =A0 =A0bar +=3D snprintf(foo + bar, ...)
> or
> =A0 =A0 =A0 =A0foo +=3D snprintf(foo, ...)
> =A0 =A0 =A0 =A0foo +=3D snprintf(foo, ...)

As long as the number of bytes is updated correctly, this won't be a
security problem, although it can cause a (single) warning. The kernel
vsnprintf does

        if (WARN_ON_ONCE((int) size < 0))
                return 0;

so if somebody overflows a buffer with multiple snprintf calls, it
will all be ok as long as the buffer size thing is updated the natural
way (possibly using pointer arithmetic, eg "end - bar").

                Linus
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
