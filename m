From: Joe Perches <joe@perches.com>
Date: Sat, 23 Sep 2017 17:13:06 +0000
Subject: Re: [PATCH] net: dsa: avoid null pointer dereference on p->phy
Message-Id: <1506186786.11186.1.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170923165720.18560-1-colin.king@canonical.com>
In-Reply-To: <20170923165720.18560-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Colin King <colin.king@canonical.com>, Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@savoirfairelinux.com>, Florian Fainelli <f.fainelli@gmail.com>, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, 2017-09-23 at 17:57 +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>=20
> Currently p->phy is being null checked in several places to avoid
> null pointer dereferences on p->phy, however, the final call
> to phy_attached_info on p->phy when p->phy will perform a null
> pointer dereference. Fix this by simply moving the call into
> the previous code block that is only executed if p->phy is
> not null.
>=20
> Detected by CoverityScan, CID#1457034 ("Dereference after null check")
>=20
> Fixes: 2220943a21e2 ("phy: Centralise print about attached phy")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  net/dsa/slave.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/net/dsa/slave.c b/net/dsa/slave.c
> index 02ace7d462c4..29ab4e98639b 100644
> --- a/net/dsa/slave.c
> +++ b/net/dsa/slave.c
> @@ -1115,10 +1115,9 @@ static int dsa_slave_phy_setup(struct net_device *=
slave_dev)
>  				of_phy_deregister_fixed_link(port_dn);
>  			return ret;
>  		}
> +		phy_attached_info(p->phy);
>  	}
> =20
> -	phy_attached_info(p->phy);
> -
>  	return 0;
>  }

Huh?  Why move this into the test?

The test of the block above this change is

	if (!p->phy) {

Perhaps this should be
'
	if (p->phy)
		phy_attached_info(p->phy);

or simpler

	} else {
		phy_attached_info(p->phy);
	}

or maybe reverse the block

	if (p->phy) {
		phy_attached_info(p->phy);
	} else {
		ret =3D dsa_slave_phy_connect(slave_dev, p->dp->index);
		if (ret) {
			netdev_err(slave_dev, "failed to connect to port %d: %d\n",
				=A0=A0=A0p->dp->index, ret);
			if (phy_is_fixed)
				of_phy_deregister_fixed_link(port_dn);
			return ret;
		}
	}

	return 0;
}
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
