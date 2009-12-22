From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
Date: Tue, 22 Dec 2009 13:02:46 +0000
Subject: Re: [PATCH 1/2] misc: add __init/__exit macros to
Message-Id: <20091222130246.GA2368@pengutronix.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1261470564-23754-1-git-send-email-peterhuewe@gmx.de>
In-Reply-To: <1261470564-23754-1-git-send-email-peterhuewe@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: peterhuewe@gmx.de
Cc: Jiri Kosina <trivial@kernel.org>, kernel-janitors@vger.kernel.org, Jon Masters <jcm@jonmasters.org>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, linux-kernel@vger.kernel.org

Hello,

On Tue, Dec 22, 2009 at 09:29:23AM +0100, peterhuewe@gmx.de wrote:
> From: Peter Huewe <peterhuewe@gmx.de>
>=20
> Trivial patch which adds the __init/__exit macros to the module_init/
> module_exit functions of
>=20
> drivers/misc/hwlat_detector.c
>=20
> Please have a look at the small patch and either pull it through
> your tree, or please ack' it so Jiri can pull it through the trivial
> tree.
>=20
> Patch against linux-next-tree, 22. Dez 08:38:18 CET 2009
> but also present in linus tree.
>=20
> Signed-off-by: Peter Huewe <peterhuewe@gmx.de>
> ---
The commit log contains some things that are maybe interesting in this
mail, but not in git (base tree, plea to look, exact filename).

Apart from Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Best regards
Uwe

--=20
Pengutronix e.K.                              | Uwe Kleine-K=F6nig         =
   |
Industrial Linux Solutions                    | http://www.pengutronix.de/ =
 |
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
