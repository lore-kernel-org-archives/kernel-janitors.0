From: Jiri Kosina <jkosina@suse.cz>
Date: Tue, 22 Dec 2009 13:17:31 +0000
Subject: Re: [PATCH 1/2] misc: add __init/__exit macros to
Message-Id: <alpine.LNX.2.00.0912221416230.3755@pobox.suse.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1261470564-23754-1-git-send-email-peterhuewe@gmx.de> <20091222130246.GA2368@pengutronix.de>
In-Reply-To: <20091222130246.GA2368@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: =?ISO-8859-15?Q?Uwe_Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: peterhuewe@gmx.de, kernel-janitors@vger.kernel.org, Jon Masters <jcm@jonmasters.org>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, linux-kernel@vger.kernel.org

On Tue, 22 Dec 2009, Uwe Kleine-K=F6nig wrote:

> > Trivial patch which adds the __init/__exit macros to the module_init/
> > module_exit functions of
> >=20
> > drivers/misc/hwlat_detector.c
> >=20
> > Please have a look at the small patch and either pull it through
> > your tree, or please ack' it so Jiri can pull it through the trivial
> > tree.
> >=20
> > Patch against linux-next-tree, 22. Dez 08:38:18 CET 2009
> > but also present in linus tree.
> >=20
> > Signed-off-by: Peter Huewe <peterhuewe@gmx.de>
> > ---
> The commit log contains some things that are maybe interesting in this
> mail, but not in git (base tree, plea to look, exact filename).
>=20
> Apart from Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

The changelog claims that this is against current Linus' tree and patches=20
drivers/misc/hwlat_detector.c file, but I can't seem to see anything=20
similar in current Linus' tree (HEAD on f7b84a6ba7e).

	$ find . -name hwlat_detector.c
	$

--=20
Jiri Kosina
SUSE Labs, Novell Inc.
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
