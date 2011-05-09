From: David Miller <davem@davemloft.net>
Date: Mon, 09 May 2011 00:12:04 +0000
Subject: Re: [PATCH] net/bonding: adjust codingstyle for bond_3ad files
Message-Id: <20110508.171204.27789908.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <BANLkTik_gMCHYp4sOnzzR1Gs=bn2pkpjfQ@mail.gmail.com>
	<20110508.161012.258121848.davem@davemloft.net>
	<BANLkTimao-Zyk6ypW3UxzqtsgmQ-6qvYng@mail.gmail.com>
In-Reply-To: <BANLkTimao-Zyk6ypW3UxzqtsgmQ-6qvYng@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: hlovdal@gmail.com
Cc: mfmooney@gmail.com, joe@perches.com, aquini@linux.com, kernel-janitors@vger.kernel.org, fubar@us.ibm.com, andy@greyhouse.net, shemminger@vyatta.com, netdev@vger.kernel.org, nikai@nikai.net

From: H=E5kon L=F8vdal <hlovdal@gmail.com>
Date: Mon, 9 May 2011 02:08:41 +0200

> void bond_3ad_state_machine_handler(struct work_struct *work)
> {
>         struct bonding *bond =3D container_of(work, struct bonding,
>                                             ad_work.work);
>         struct port *port;
>         struct aggregator *aggregator;
>=20
>         read_lock(&bond->lock);
>=20
>         if (! bond->kill_timers) {
>=20
>                 //check if there are any slaves
>                 if (bond->slave_cnt !=3D 0) {
>                         ...
>                 }
>                 queue_delayed_work(bond->wq, &bond->ad_work, ad_delta_in_=
ticks);
>         }
>         read_unlock(&bond->lock);
> }
>=20
>=20
> And this was what I trying to reccommend against (and which the
> stackoverflow question is about).

I really don't see anything wrong with either approach.

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
