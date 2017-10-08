From: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
Date: Sun, 08 Oct 2017 20:32:58 +0000
Subject: Re: [PATCH 0/2] detect identical chip data arrays
Message-Id: <20171008203258.y7kqx7ipondxlsix@earth>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="54lkl2rmnrnhktmt"
List-Id: <kernel-janitors.vger.kernel.org>
References: <1507490321-24900-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1507490321-24900-1-git-send-email-Julia.Lawall@lip6.fr>
To: cocci@systeme.lip6.fr


--54lkl2rmnrnhktmt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, Oct 08, 2017 at 09:18:39PM +0200, Julia Lawall wrote:
> Rename battery.cocci as check_bq27xxx_data.cocci and adjust the warning
> messages to indicate that some structures are the same, in response to
> feedback from Liam Breck.
>=20
> Although check_bq27xxx_data.cocci says is requires Coccinelle 1.0.7, which
> is not yet released, it actually works with the version currently availab=
le
> on Github, eg from Coccinelle commit 3ba77b3a0f91.

I think the rename makes sense, but I would expect the move to
happen in one go with "git send-email -M", so that it detects the
rename.

-- Sebastian

--54lkl2rmnrnhktmt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAlnai3cACgkQ2O7X88g7
+pqQ0Q/+JhdIm50SLAMLzmo3sIj60lmBwS/mwxToJSUTKgtwhFsDOVxEYAWxo3sM
eAUQ5p/J9yevy3H1t6BYFpVzzDL3sXYd8rUe9o5G26PLF0TFxvPnrUWdwerQSNtR
hSftiGvVFwp8Vf55jXaBBV4EbpEo8RSrGSiWDzXztL2rut9HuW3X6Vk2sUN41qcm
6t3z+yPfuL8sykNW1MvB0MXUE27HXzZ/nslKVtYZ/iN0aXBxiuCuvzH//W48s2C0
2o1Rlv4HDwu5aLv+jICk9JiPu6ljoWO0/3xKOlvVT4mZRbDmTxCKZa2UAAzbmWQz
6x4PUnsqFXOZKbiSNT/SpYzF/WEbgojZzrzm/BZweD12eLUJmzvlNZpe5J1+LZXr
b/un7IpdnfRNwh9P87s72X3x9vDM7d5cmNvNIDniCL0zKSvdOJ/gQpD9YKnyVJZH
AfCfUtuZLw3rtJKGNQfPUR+xjSRR5gZUx4lQAM3cpTXoSmMLs6gR/XrfSX0FQWwE
zxLL539Urc2++WMyATcb/vy8ztrLlwEuNEZCwTfXAjrzsB2zYhZG6wmFs0o2sWYB
L0URi8acRkylmTwDKFMFpca2FCNUmClxZLfvV9fe206CweoyJWWNC90bG37XdbNG
US8ZaaMvqUaat36x/bYJcmcqjWhZ+Q8/MxmjN/bHEkHWPjRnp7w=
=/Q5j
-----END PGP SIGNATURE-----

--54lkl2rmnrnhktmt--
