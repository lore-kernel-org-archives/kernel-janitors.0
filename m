From: Samuel Thibault <samuel.thibault@ens-lyon.org>
Date: Wed, 22 May 2013 21:49:07 +0000
Subject: Re: [PATCH] staging: speakup: fix warnings by adding __user annotations
Message-Id: <20130522214907.GY6142@type.youpi.perso.aquilenet.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1369248789-25957-1-git-send-email-emilgoode@gmail.com>
In-Reply-To: <1369248789-25957-1-git-send-email-emilgoode@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Emil Goode <emilgoode@gmail.com>
Cc: w.d.hubbs@gmail.com, chris@the-brannons.com, kirk@reisers.ca, gregkh@linuxfoundation.org, ben@decadent.org.uk, speakup@braille.uwo.ca, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Emil Goode, le Wed 22 May 2013 20:53:09 +0200, a =E9crit :
> This patch fixes the following sparse warnings by adding
> __user annotations.
>=20
> drivers/staging/speakup/speakup_soft.c:248:34: warning:
>         incorrect type in argument 1 (different address spaces)
>         drivers/staging/speakup/speakup_soft.c:248:34:
>         expected void [noderef] <asn:1>*dst
>         drivers/staging/speakup/speakup_soft.c:248:34:
>         got char *[assigned] cp
> drivers/staging/speakup/speakup_soft.c:272:40: warning:
>         incorrect type in argument 1 (different address spaces)
>         drivers/staging/speakup/speakup_soft.c:272:40:
>         expected char const [noderef] <asn:1>*s
>         drivers/staging/speakup/speakup_soft.c:272:40:
>         got char const *buf
> drivers/staging/speakup/speakup_soft.c:306:17: warning:
>         incorrect type in initializer (incompatible argument 2
>         (different address spaces))
>         drivers/staging/speakup/speakup_soft.c:306:17:
>         expected long ( *read )( ... )
>         drivers/staging/speakup/speakup_soft.c:306:17:
>         got long ( static [toplevel] *<noident> )( ... )
> drivers/staging/speakup/speakup_soft.c:307:18: warning:
>         incorrect type in initializer (incompatible argument 2
>         (different address spaces))
>         drivers/staging/speakup/speakup_soft.c:307:18:
>         expected long ( *write )( ... )
>         drivers/staging/speakup/speakup_soft.c:307:18:
>         got long ( static [toplevel] *<nfile_operationsoident> )( ... )
>=20
> drivers/staging/speakup/devsynth.c:29:41: warning:
>         incorrect type in argument 2 (different address spaces)
>         drivers/staging/speakup/devsynth.c:29:41:
>         expected void const [noderef] <asn:1>*from
>         drivers/staging/speakup/devsynth.c:29:41:    got char const *ptr
> drivers/staging/speakup/devsynth.c:62:17: warning:
>         incorrect type in initializer (incompatible argument 2
>         (different address spaces))
>         drivers/staging/speakup/devsynth.c:62:17:
>         expected long ( *read )( ... )
>         drivers/staging/speakup/devsynth.c:62:17:
>         got long ( static [toplevel] *<noident> )( ... )
> drivers/staging/speakup/devsynth.c:63:18: warning:
>         incorrect type in initializer (incompatible argument 2
>         (different address spaces))
>         drivers/staging/speakup/devsynth.c:63:18:
>         expected long ( *write )( ... )
>         drivers/staging/speakup/devsynth.c:63:18:
>         got long ( static [toplevel] *<noident> )( ... )
>=20
> Signed-off-by: Emil Goode <emilgoode@gmail.com>

Acked-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
