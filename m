From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 18 Jan 2012 07:39:22 +0000
Subject: Re: busy loops in kernel
Message-Id: <20120118073922.GH3294@mwanda>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="PW0Eas8rCkcu1VkF"
List-Id: <kernel-janitors.vger.kernel.org>
References: <CAFTXME+fNAqqZjO4oRmbwt2cFbaDgbLW9gg94tzJvF4bwy7DtQ@mail.gmail.com>
In-Reply-To: <CAFTXME+fNAqqZjO4oRmbwt2cFbaDgbLW9gg94tzJvF4bwy7DtQ@mail.gmail.com>
To: kernel-janitors@vger.kernel.org


--PW0Eas8rCkcu1VkF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 18, 2012 at 10:37:30AM +0300, Dan Carpenter wrote:
> Interesting stuff.  You guys are doing static analysis on the .o
> files?  I'm looking at the first line.
>=20
> ticks 25 What does the ticks count mean?

I figured it out.  Ticks is the number of infinite loops found in
the .o file.

regards,
dan carpenter


--PW0Eas8rCkcu1VkF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJPFncpAAoJEOnZkXI/YHqRszwP/25H6lAda3KrOcGryYvxoQn2
zHPLpu81wTHXK7FYmRhZSP8dlffPQJI/pndBGWu0n3Ai5BRU/aUMYsaiMTHWHUt+
VwaZCbKGkk6TdDBm5aIgJT3X4GkoSthSYNYY6h3hKIZRXwLhTMMa3/sNRiMhR698
I3VlkouLDFgEPvWhs2CdnSy/nmB3wcNYPnJSfhK1fMNLbTzL3nZ3EFilLnbRTOYa
WWknU1L5kiug6zrbljyGKteeD/yLFnOLEDQbmJNBMwRt0IAqxyNHVFvfWgTRxte8
6UVQbK2FZrWGL7eCyi8nihZG8VbZtf3qFyC0sH6q7saC0xRhliok6x+WkC6/zvwc
VDI9N3/ql9sJYrWJY0UV9t3L3BWMZe2Ll7/1ysQm6Y/ZLAoz1WA45mMmBkfpqSZn
g9D+U5sQ8hB7ULHRzoamnONQQsbU/vOvG0+hf1D/WyXpgip3cvgFlJxHV89Iw/MY
d24N1WIUejX2KtMw4i7EQyHYzQFSsMAxM+G0HHBGc8m/zB+8o/PEBrLiqYVI85WT
02lUPrNwOvUPeUYX7+/3i5jgbKcNSAh/vIt3hx01qczNTv9d1HJvGB3sEhUodYyX
H0IjHTRu3YaHrlV+b80t2qXjtsuATV3nXThKx9D5NMgD2jUTBxc97czY2cGk+NrR
NGU26LxsJMqSuHO8JCok
=fZdJ
-----END PGP SIGNATURE-----

--PW0Eas8rCkcu1VkF--
