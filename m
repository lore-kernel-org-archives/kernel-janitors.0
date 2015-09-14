From: Mark Brown <broonie@kernel.org>
Date: Mon, 14 Sep 2015 18:04:25 +0000
Subject: Re: [PATCH 1/2] ASoC: qcom: change PTR_ERR argument
Message-Id: <20150914180425.GB12027@sirena.org.uk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="N5b0NsBGdE2hIyw+"
List-Id: <kernel-janitors.vger.kernel.org>
References: <1440957911-7687-1-git-send-email-Julia.Lawall@lip6.fr>
 <1440957911-7687-2-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1440957911-7687-2-git-send-email-Julia.Lawall@lip6.fr>
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>, linux-kernel@vger.kernel.org, Patrick Lai <plai@codeaurora.org>, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>


--N5b0NsBGdE2hIyw+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 30, 2015 at 08:05:10PM +0200, Julia Lawall wrote:
> Apply PTR_ERR to the value that was recently assigned.
>=20
> The semantic match that finds this problem is as follows:
> (http://coccinelle.lip6.fr/)

I have no idea what's going on with this stuff without spending more
time than it looks like should need, there's a moderately big thread and
some patches posted in the middle of it.  Can you repost whatever the
current state is please?

--N5b0NsBGdE2hIyw+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJV9wwoAAoJECTWi3JdVIfQmj0H/3lruYh3O9vUoAvbLXz6pz64
BC05jzlUO0BqyTEMtUIf8fysl0AJMpQwUW+z1BzrERsdYuJnA/LhsVdK65AkRbmj
5xuZM+QXBjbCwH9k0rUJLOE36XtUY4PT9l2NG06NGc/esmuzfEUFAq9VWSrh0Vv/
otwUkz4Tlb4kLjGTlzQW8u6RzKRBQfLaYxyTVcI7a+4q4lYnlcOm5JObkuEy7WKl
/4yUYDg4sL5xjDHgHOlxYeTwwFsQN1kTcVgu+jjZ3K6OKWbt2NY6f39BPBwSL/FP
1h6uqeEjS5yKv9YqVN3UpmM2GUY3YgR4xOncSl5QydX53kMmMDrdQBbLJt9gkK8=
=qkwL
-----END PGP SIGNATURE-----

--N5b0NsBGdE2hIyw+--
