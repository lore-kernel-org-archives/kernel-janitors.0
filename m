From: mcgrof@studorgs.rutgers.edu (Luis R. Rodriguez)
Date: Thu, 23 Sep 2004 22:55:07 +0000
Subject: [Kernel-janitors] Re: [PATCH 2.6.9-rc2 17/38] net/islpci_dev:
Message-Id: <20040923225507.GI30131@ruslug.rutgers.edu>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============42016482439796166=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040923221303.GB13244@us.ibm.com>
In-Reply-To: <20040923221303.GB13244@us.ibm.com>
To: Nishanth Aravamudan <nacc@us.ibm.com>
Cc: Netdev <netdev@oss.sgi.com>, mcgrof@studorgs.rutgers.edu, hvr@gnu.org, margitsw@t-online.de, kernel-janitors@lists.osdl.org, prism54-devel@prism54.org


--===============42016482439796166==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="df+09Je9rNq3P+GE"
Content-Disposition: inline


--df+09Je9rNq3P+GE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 23, 2004 at 03:13:03PM -0700, Nishanth Aravamudan wrote:
> Any comments would be appreciated.
>=20
> Description: Use msleep() instead of schedule_timeout()
> to guarantee the task delays as expected. Also set_current_state() is
> inserted before schedule_timeout(). If the for-loop were to execute
> twice, the second time would not set the state before sleeping in the
> current code; this causes schedule_timeout() to return immediately.
>=20
> Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>
>=20
> --- 2.6.9-rc2-vanilla/drivers/net/wireless/prism54/islpci_dev.c	2004-09-1=
3 17:15:41.000000000 -0700
> +++ 2.6.9-rc2/drivers/net/wireless/prism54/islpci_dev.c	2004-09-23 13:58:=
42.000000000 -0700
> @@ -436,8 +436,7 @@ prism54_bring_down(islpci_private *priv)
>  	wmb();
> =20
>  	/* wait a while for the device to reset */
> -	set_current_state(TASK_UNINTERRUPTIBLE);
> -	schedule_timeout(50*HZ/1000);
> +	msleep(50);
> =20
>  	return 0;
>  }
> @@ -489,6 +488,7 @@ islpci_reset_if(islpci_private *priv)
>  		/* The software reset acknowledge needs about 220 msec here.
>  		 * Be conservative and wait for up to one second. */
>  =09
> +		set_current_state(TASK_UNINTERRUPTIBLE);
>  		remaining =3D schedule_timeout(HZ);
> =20
>  		if(remaining > 0) {


Looks good to me. IIRC Margit had something to say about this last time
this popped around -- CC'ing her to see if there are any outstanding
comments.

PS. For future prism54 patches please feel free to CC prism54-devel and
netdev.

	Luis

--=20
GnuPG Key fingerprint =3D 113F B290 C6D2 0251 4D84  A34A 6ADD 4937 E20A 525E

--df+09Je9rNq3P+GE
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFBU1RLat1JN+IKUl4RAk9+AJ9KiSJszt4vr2I7L1igpeJB4SNe5QCgrIa8
SUQv0TM059cGvmMHKU73qhw=
=JuFF
-----END PGP SIGNATURE-----

--df+09Je9rNq3P+GE--

--===============42016482439796166==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============42016482439796166==--
