From: Florian Fainelli <florian.fainelli@telecomint.eu>
Date: Tue, 24 Jun 2008 08:54:18 +0000
Subject: Re: [PATCH] drivers/net/r6040.c: Eliminate double sizeof
Message-Id: <200806241054.19392.florian.fainelli@telecomint.eu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0806232311570.13402@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0806232311570.13402@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Julia Lawall <julia@diku.dk>
Cc: jgarzik@pobox.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Hello Julia,

Le Monday 23 June 2008 23:12:31 Julia Lawall, vous avez =E9crit=A0:
> From: Julia Lawall <julia@diku.dk>
>
> Taking sizeof the result of sizeof is quite strange and does not seem to =
be
> what is wanted here.

Yes, definitively.

> Signed-off-by: Julia Lawall <julia@diku.dk>

Acked-by: Florian Fainelli <florian.fainelli@telecomint.eu>
--=20
Cordialement, Florian Fainelli
------------------------------
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
