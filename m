From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 30 Jan 2012 14:01:34 +0000
Subject: Re: [patch] exofs: add a cap on the memcpy() size
Message-Id: <20120130140134.GW3294@mwanda>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="kjzasy1UhXmRStS5"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120130075949.GA22364@elgon.mountain>
In-Reply-To: <20120130075949.GA22364@elgon.mountain>
To: kernel-janitors@vger.kernel.org


--kjzasy1UhXmRStS5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 30, 2012 at 03:50:05PM +0200, Boaz Harrosh wrote:
> On 01/30/2012 03:44 PM, Dan Carpenter wrote:
> > On Mon, Jan 30, 2012 at 03:37:29PM +0200, Boaz Harrosh wrote:
> >> I think I'd like something like:
> >> -  	memcpy(odi->systemid, dt_dev->systemid, odi->systemid_len);
> >> +	if (likely(odi->systemid_len))
> >> + 		memcpy(odi->systemid, dt_dev->systemid, OSD_SYSTEMID_LEN);
> >>
> >> Which should also make the static checkers happy. What do you think?
> >>
> >=20
> > Sounds good to me.
> >=20
> > regards,
> > dan carpenter
> >=20
>=20
> OK I'll make a patch. Please send your review-by

Could you give me a Reported-by cookie instead?  No one pays any
special attention to Reviewed-by tags when they come from newbies
like me...  :P

regards,
dan carpenter


--kjzasy1UhXmRStS5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJPJqK9AAoJEOnZkXI/YHqRupwP/0KlBVaq2hKq+T0U3LYqr7Rz
hO+UvbuJCXL56PgQNGfC4Mxmufp3h2YFiEF1ZCYrzJBl56wnYjTpznfa2ZtDwCXY
eoc+pPhV+pMYipJ+LqaGQ4hxqp1XuV3PpJKy0GLpNJ9C5AtiG6jQd4O7bmnvJn00
00aYzUF674k7RZZoJYt1YJWRdiFI7Jq62RaQkNxdeX8psTcXBN8F6Y9AxOuXwooK
iyUjLv0zZEMuPgC5xwME9UUfjaxbbSoxMOpfhV6wHPhLBC2UmLDG7wWjRX29zE69
gbFec3coPv3YQBZFhpidldcGmuuSY51s9ADSv0A2eu/jbC1cPS9aLsgjGncuXrmW
uqc+DEw30yrXTwNncfZR/ASEe2VzxzZtY12kIyH0wZPe6OtRgecGmVYTpN3Lc34S
Nt3qAiSfpy22aZxw50DpjSIgSHs6+5uDj6NkZIYsHyE115ZvYK17sonCHm0wKaDZ
08URq7PC/Ul90Td7osAyAgL2zoxdmIXYBrxPjQWsStC7TPqScvtxWnDtjA5L3oIy
AU+zBkSojqux1YlSEcWZUFpnMVwh/1mCmSAMmkJcC4RyZ9WEACwkW8pshc2TcjOv
MHWRbriNT0pVbN67urDoaXSHFWe5wmsnHyYR2bNvSq49WU9aw2eltik7houZlHQF
f3eaiMV8gEraB9uW5EG1
=nl9x
-----END PGP SIGNATURE-----

--kjzasy1UhXmRStS5--
