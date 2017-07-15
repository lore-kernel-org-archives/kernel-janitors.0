From: Pavel Machek <pavel@ucw.cz>
Date: Sat, 15 Jul 2017 18:55:00 +0000
Subject: Re: [PATCH 0/2 v2] leds: tlc591xx: add missing of_node_put
Message-Id: <20170715185500.GA8487@amd>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="6TrnltStXW4iwmi0"
List-Id: <kernel-janitors.vger.kernel.org>
References: <1500112699-770-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1500112699-770-1-git-send-email-Julia.Lawall@lip6.fr>
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Richard Purdie <rpurdie@rpsys.net>, kernel-janitors@vger.kernel.org, Jacek Anaszewski <jacek.anaszewski@gmail.com>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org


--6TrnltStXW4iwmi0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat 2017-07-15 11:58:17, Julia Lawall wrote:
> This series first merges two conditionals and then adds of_node_put on
> jumping out of for_each_child_of_node.
>=20
> v2 adds the merge of conditionals, resulting in fewer of_node_put
calls.

Both patches:

Acked-by: Pavel Machek <pavel@ucw.cz>

Thanks,
									Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--6TrnltStXW4iwmi0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAllqZQQACgkQMOfwapXb+vIqigCgolTwhL/MnegkhgAZ2egKB9xA
kZoAnA93UqDJzgKqLhXBy8rfdloJt+wK
=HNMA
-----END PGP SIGNATURE-----

--6TrnltStXW4iwmi0--
