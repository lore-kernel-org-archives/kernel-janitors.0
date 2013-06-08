From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Date: Sat, 08 Jun 2013 15:50:59 +0000
Subject: Re: [PATCH] drivers/mtd/devices/bcm47xxsflash.c: correct argument to kfree
Message-Id: <CACna6rwKDKriiw2Q+et02ZmhHU9U+7ni3ik=14XZDEnN54J3YQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1370705783-2140-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1370705783-2140-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: kernel-janitors@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>

2013/6/8 Julia Lawall <Julia.Lawall@lip6.fr>:
> From: Julia Lawall <Julia.Lawall@lip6.fr>
>
> The argument to kfree should not be the address of a structure field.
> The argument is adjusted to correspond to what is found in the subsequent
> remove function.

This was already addressed in
[PATCH RESEND 1/2] mtd: bcm47: convert kzalloc to avoid invalid access

Artem: can you pick pointed patch, please? So people don't report it
over and over ;)

--=20
Rafa=C5=82
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
