From: Julia Lawall <julia.lawall@lip6.fr>
Date: Sun, 20 Dec 2015 19:00:02 +0000
Subject: Re: [patch -next] ath9k: fix ath9k_hw_nvram_check_version()
Message-Id: <alpine.DEB.2.02.1512201959090.2055@localhost6.localdomain6>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="8323328-1604696573-1450638003=:2055"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20151219105919.GB3749@mwanda> <1450637228.3430.30.camel@perches.com>
In-Reply-To: <1450637228.3430.30.camel@perches.com>
To: Joe Perches <joe@perches.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, QCA ath9k Development <ath9k-devel@qca.qualcomm.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Kalle Valo <kvalo@codeaurora.org>, linux-wireless@vger.kernel.org, ath9k-devel@venema.h4ckr.net, kernel-janitors@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1604696573-1450638003=:2055
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Sun, 20 Dec 2015, Joe Perches wrote:

> On Sat, 2015-12-19 at 13:59 +0300, Dan Carpenter wrote:
> > There is a type bug so it always returns success.
>=20
> How many false positives do you have to sift
> through to find this sort of error?

The return type is thoughtfully bool, so it should be easy in this case. =20
The function has a return -EINVAL and a return true, so even without the=20
return type it would be locally apparent that there is an inconsistency.

julia

>=20
> > +++ b/drivers/net/wireless/ath/ath9k/eeprom.c
> > @@ -206,7 +206,7 @@ bool ath9k_hw_nvram_check_version(struct ath_hw *ah=
, int version, int minrev)
> > =A0		ath_err(common, "Bad EEPROM VER 0x%04x or REV 0x%04x\n",
> > =A0			ah->eep_ops->get_eeprom_ver(ah),
> > =A0			ah->eep_ops->get_eeprom_rev(ah));
> > -		return -EINVAL;
> > +		return false;
> > =A0	}
> > =A0
> > =A0	return true;
>=20
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors=
" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20
--8323328-1604696573-1450638003=:2055--
