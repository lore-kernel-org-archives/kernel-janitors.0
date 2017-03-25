From: Sebastian Reichel <sre@kernel.org>
Date: Sat, 25 Mar 2017 18:47:34 +0000
Subject: Re: [PATCH 0/3] Add public w1 driver interface
Message-Id: <20170325184734.5ftcu6k47flixrng@earth>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="w6rqzgmuossb2xtr"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170316151955.10710-1-afd@ti.com>
In-Reply-To: <20170316151955.10710-1-afd@ti.com>
To: "Andrew F. Davis" <afd@ti.com>
Cc: Evgeniy Polyakov <zbr@ioremap.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


--w6rqzgmuossb2xtr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Mar 16, 2017 at 10:19:52AM -0500, Andrew F. Davis wrote:
> As part of continuing work to cleanup the BQ27xxx driver I am attempting
> to remove the need for the platform driver interface. For this we first
> need the w1 subsystem to act more like a traditional bus subsystem
> and allow drivers for attached devices to live outside of the w1
> directory.
>=20
> The first couple patches are trivial, the last a bit more involved
> but should make no functional change, just a re-organization of
> header files.
>=20
> Thanks,
> Andrew
>=20
> Andrew F. Davis (3):
>   w1: Use kernel common min() implementation
>   w1: Remove unneeded use of assert() and remove w1_log.h
>   w1: Add subsystem kernel public interface

For the whole series:

Reviewed-by: Sebastian Reichel <sre@kernel.org>

-- Sebastian

--w6rqzgmuossb2xtr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAljWu0YACgkQ2O7X88g7
+pp8Tg//UdyFVd/f8o/mQxik73isavMBuk4AnVH5cTMrSVGhmRM5vF9+iwV01J39
6bixugI6jLdnA85SLWabwtEO9eCXRkndHPiQW4J3CyMz9Oa0IU3gG3MDtxpRTdRH
6qnvkghWmCwEbWa7741yHNNf5FMUWycitffSFXlRJsg3r2lRIP7tHukFZ505TcqZ
ZvtebSQ5n1KfWcWn3fmTEdx2+d9hrF6GI/KYqjDqEcRYJ8Z1F9lXQlURMGCSvKET
tzBXjLtZMF61dnJwgAZy5jc7+nKgeGOsnUqVhYmlxd1E/izn0rdF1anUNmOy1q1p
wXkB++KPSvwEKV8RN/s60nBZ8lmfS4f+SZELLQzu0R6y+QbL+6PXe+PZEdlY+K0O
NXBNWOj1fzqeBGzqSN7fW/IvJ+7hgehZ2EtKZrkUu7sQ5eh5FSFxlp3I3FEZ/MA7
+hFLAwJiTcCxTzIOi1Nug8xuPWhERD4XNIulGmOvl3DZx/aYrkpS9zcrCHESQ+2q
6fXn6hdmoY0C3ZcXEfJ8Pd8pVmvrA4sP+747KjvB3ULotnXwiy22uJzw/6OMKODG
hCWoPep2TtMuLv1S/+v2vlJZrtsDFi0MkRXjf8Gamno4UuwnfAj11C0a14Mm3AxW
Nd7aLE7OHdI4k/K/YaYucysYJ/wt5NrKsoYHD28k6w3PggGXfoE=
=pKl0
-----END PGP SIGNATURE-----

--w6rqzgmuossb2xtr--
