From: Mark Brown <broonie@kernel.org>
Date: Thu, 09 Jan 2014 14:10:53 +0000
Subject: Re: [patch] regmap: fix a potential leak in regmap_bulk_write()
Message-Id: <20140109141053.GA24418@sirena.org.uk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="G4iJoqBmSsgzjUCe"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140109054104.GH1265@elgon.mountain>
In-Reply-To: <20140109054104.GH1265@elgon.mountain>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org


--G4iJoqBmSsgzjUCe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 09, 2014 at 08:41:04AM +0300, Dan Carpenter wrote:
> Static checkers complain that there is an error path where
> _regmap_raw_write() fails and we goto out without freeing the "wval"
> buffer.

This doesn't apply against current code (these functions got rewritten),
can you please check?

--G4iJoqBmSsgzjUCe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSzq3qAAoJELSic+t+oim9zfEP/Aq0UGql2MU6+w/g3W1zUy+E
sE19Zxnirwx50KRI4hwGU8D+aAZ5JHuknfbQBkFrvyLtdPBAWvjPnb34/LBDiTsw
c/u7kyv+PPBMxgMgmWpBF7d2thySF/y8T2dWMT9X8f75BWFNyMcdHlGjNkCYa1vI
yU+hQNlzYGOx6jH8QcdVgRVccrc427P6cGuzQ6K3JI+Xl0DNPN7jpUYbFnr/QXpF
IGm/6irUGN5JgacOPY50Ni5jadsGAZT/mpStWs7RAWEPL1f+GgJRvzLPKf6Rboea
w7I/D7NksQIlUxIBjD7vSfIUsnkb6WM/MTzZkXgl4YRyrF22/AZSDXKb55gcmPeC
9yBvBDsvowp+hURqVTAYtZfM8MSP3KzTwMG0wLOys7dx4WEqCJV3CYZWSEZG255S
ZlN1hMJmCvjbN+JOg6wogO/ksNctgnpm0M14A52JkapJQpZFwlvP6Qs5vSB1r7Tw
xbKLMcQSEc7iNdeNy/5ZdXvDFbJFRAATRgkG+se2cwNsKcS1THoePsA34mabM+jt
H/4is3m++heHXN7J1ltkyX6GWBBq14vhpnlyv+MC2b+lKHW5hiB2oOjW0QUhPPRn
Cfi70riXXmGpxXtTdRRRMwh9+zuvm3Z3v5N9XHBXL6Zy5qg8drno7yTCbjysmmf5
hQGf6XwVcnHQTUWoo0Sk
=6FtH
-----END PGP SIGNATURE-----

--G4iJoqBmSsgzjUCe--
