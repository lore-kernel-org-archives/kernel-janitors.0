From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 01 Feb 2018 12:28:40 +0000
Subject: Re: Coccinelle: reduce false positives
Message-Id: <9878b76a-bbd5-94d9-a08f-711a3c2abf30@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1517478532-5444-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1517478532-5444-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: cocci@systeme.lip6.fr, Julia Lawall <julia.lawall@lip6.fr>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>

> +@safe depends on context || org || report exists@
> +expression x;
> +position p;
> +@@
> +
> +(
> + x =3D kmalloc(...)
> +|
> + x =3D kvasprintf(...)
=E2=80=A6

* How do you think about to reduce also a bit of duplicate SmPL code?

* Can it help to work with nested SmPL disjunctions here?

Regards,
Markus
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
