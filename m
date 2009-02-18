From: David Miller <davem@davemloft.net>
Date: Wed, 18 Feb 2009 01:22:16 +0000
Subject: Re: [PATCH 09/43] drivers/net/r6040.c: fix sparse warning: Using
Message-Id: <20090217.172216.152466500.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090214210940.23489.95001.stgit@vmbox.hanneseder.net>
	<20090214211400.23489.24726.stgit@vmbox.hanneseder.net>
	<200902151500.06516.florian@openwrt.org>
In-Reply-To: <200902151500.06516.florian@openwrt.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: florian@openwrt.org
Cc: hannes@hanneseder.net, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Florian Fainelli <florian@openwrt.org>
Date: Sun, 15 Feb 2009 15:00:06 +0100

> Hello Hannes,
>=20
> Le Saturday 14 February 2009 22:14:04 Hannes Eder, vous avez =E9crit=A0:
> > Fix this sparse warnings:
> >   drivers/net/r6040.c:487:31: warning: Using plain integer as NULL poin=
ter
> >   drivers/net/r6040.c:492:31: warning: Using plain integer as NULL poin=
ter
>=20
> Good catch, thanks.
> >
> > Signed-off-by: Hannes Eder <hannes@hanneseder.net>
>=20
> Acked-by: Florian Fainelli <florian@openwrt.org>

Applied.
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
