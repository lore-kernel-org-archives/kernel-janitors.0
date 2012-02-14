From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 14 Feb 2012 10:48:18 +0000
Subject: Re: [PATCH] make jffs2_initxattrs() static
Message-Id: <20120214104818.GM4141@mwanda>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="+ARLBH93C7pgvpZY"
List-Id: <kernel-janitors.vger.kernel.org>
References: <10498a5ebdf9d4d9f0cfd0c9fe377f0c2b288650.1329214285.git.npajkovs@redhat.com>
In-Reply-To: <10498a5ebdf9d4d9f0cfd0c9fe377f0c2b288650.1329214285.git.npajkovs@redhat.com>
To: kernel-janitors@vger.kernel.org


--+ARLBH93C7pgvpZY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The subject to the patch should have a subsystem prefix.  Normally,
the pattern would be
Subject: [PATCH] jffs2: make jffs2_initxattrs() static
but it varies from subsystem to subsystem.  You have to check with
git log --pretty=oneline fs/jffs2/security.c
or
git log --pretty=oneline fs/jffs2/

Every patch should be CC'd to a subsystem list.  In this case, it's
linux-mtd@lists.infradead.org.  You can find that with
./scripts/get_maintainer.pl.

regards,
dan carpenter

--+ARLBH93C7pgvpZY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJPOjvxAAoJEOnZkXI/YHqRK9AP/iCHAQL+vJ2U+91ObNS+3nDp
5aMR7GcmiEFS71EpNTwWhzM8Uf7kHZQWJZ5g6J97Sx6WpAGiO3KNyKcVaCzBWZNs
DzWoRyEKglHmwv/ciHiS5Xcek0k1HRWR9dJGG3hrJGOjPUNGmArl3VGEe8MJW+o9
iuqeQNEkEK2TRlR5oGEXSvhZG484bI9j73HxdJljwMDsCQv8Gn0W2mEu73JTvPpw
7WMjfROyJunkGZ4kBq7E+FdW1mH18UvxqdhC8bfGI7MYVjE9WCmEzjWyuWleq7i4
W8oMnLMAX3Qqk0VDhBuBhQOaK8SPZntAT9VrURrz3bkB0LYruWNnLm3j1q3NhFqW
njDnbBoykeq9rlVmyyELQ4nXuiSRnQF3kCt1pO8tBOUNMhQq4pJxNNLw99SQpEP/
9/yHHFRmGyLqE1L3VFD0IAj0hkk+ynnsVKea9PD1lIqNt/GsQcLeDSZ1ziPNm5vi
wXZvPkdLEcGZfHdohPfNT4eMDQVLOF7LirrUELizO1FCq2tM31uFcsjdQW+CbLRy
5gXOoaEFR94GY93SgB3WD0as4UNehkxjwssDXCkojZbEo4Hs7Wrmhq+sTVd6zI32
6xqU5qjhRGYhlXxJx5B9Wos+Y5PJ3/7HHdEr7O0DgSHtIe0vrLmBd+2cwePXl5jM
EPjOabJZ3d9ErrJyeLx0
=PMgh
-----END PGP SIGNATURE-----

--+ARLBH93C7pgvpZY--
