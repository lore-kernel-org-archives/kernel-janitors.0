From: Joe Perches <joe@perches.com>
Date: Sun, 25 Sep 2016 07:31:29 +0000
Subject: Re: [PATCH v2 3/3] Input-gameport: Replace some printk() calls by pr_info() in joydump_connect()
Message-Id: <1474788689.2238.3.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <d8da8333-d83a-ca61-b887-7fd7528c63a4@users.sourceforge.net>
         <f486d64d-0759-9cd6-1e4e-df723acb6fea@users.sourceforge.net>
         <1474733610.23838.2.camel@perches.com>
         <814f7993-de4b-05d8-845e-3f0230122061@users.sourceforge.net>
In-Reply-To: <814f7993-de4b-05d8-845e-3f0230122061@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: SF Markus Elfring <elfring@users.sourceforge.net>, linux-input@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

On Sun, 2016-09-25 at 09:15 +0200, SF Markus Elfring wrote:
> 1. Add a definition for the macros "MY_LOG_PREFIX" and "pr_fmt" so that
> =A0  their information can be used for consistent message output.
>=20
>=20
> 2. Prefer usage of the macro "pr_info" over the interface "printk"
> =A0  in this function.
>=20
>=20
> 3. Reduce number of output function calls.
>=20
>=20
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>=20
>=20
> v2: Yesterday a software development discussion pointed weaknesses out ar=
ound
> =A0   the previous update steps "3" and "4".
> =A0   Now I propose this update variant in the hope that my second approa=
ch
> =A0   for this software module will work as desired and can be accepted
> =A0   a bit easier.

No thank you.

This is not a good change as it messes with dmesg timestamps.

Simpler to read and more straightforward is multiple
individual function calls.
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
