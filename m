From: Doug Ledford <dledford@redhat.com>
Date: Sat, 22 Jul 2017 17:26:43 +0000
Subject: Re: [PATCH] RDMA/bnxt_re: checking for NULL instead of IS_ERR()
Message-Id: <7e6b5e72-c33d-ddfa-c0d2-35f1f9a37d31@redhat.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="GDk1eE6S2Rj89imKe8nMOLs04qgGteavn"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170710072247.6eczlwcxu5mt5jry@mwanda>
In-Reply-To: <20170710072247.6eczlwcxu5mt5jry@mwanda>
To: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, Selvin Xavier <selvin.xavier-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Eddie Wai <eddie.wai-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Cc: Devesh Sharma <devesh.sharma-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Somnath Kotur <somnath.kotur-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Sriharsha Basavapatna <sriharsha.basavapatna-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--GDk1eE6S2Rj89imKe8nMOLs04qgGteavn
Content-Type: multipart/mixed; boundary="Ug3AveXibHqPsumOj5eWPppvUXhpji9cw";
 protected-headers="v1"
From: Doug Ledford <dledford@redhat.com>
To: Dan Carpenter <dan.carpenter@oracle.com>,
 Selvin Xavier <selvin.xavier@broadcom.com>,
 Eddie Wai <eddie.wai@broadcom.com>
Cc: Devesh Sharma <devesh.sharma@broadcom.com>,
 Somnath Kotur <somnath.kotur@broadcom.com>,
 Sriharsha Basavapatna <sriharsha.basavapatna@broadcom.com>,
 Sean Hefty <sean.hefty@intel.com>, Hal Rosenstock
 <hal.rosenstock@gmail.com>, linux-rdma@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Message-ID: <7e6b5e72-c33d-ddfa-c0d2-35f1f9a37d31@redhat.com>
Subject: Re: [PATCH] RDMA/bnxt_re: checking for NULL instead of IS_ERR()
References: <20170710072247.6eczlwcxu5mt5jry@mwanda>
In-Reply-To: <20170710072247.6eczlwcxu5mt5jry@mwanda>

--Ug3AveXibHqPsumOj5eWPppvUXhpji9cw
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 7/10/2017 3:22 AM, Dan Carpenter wrote:
> bnxt_re_alloc_mw() doesn't return NULL, it returns error pointers.
>=20
> Fixes: 9152e0b722b2 ("RDMA/bnxt_re: HW workarounds for handling specifi=
c conditions")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

This was accepted into 4.13-rc, thanks.

--=20
Doug Ledford <dledford@redhat.com>
    GPG Key ID: B826A3330E572FDD
    Key fingerprint =3D AE6B 1BDA 122B 23B4 265B  1274 B826 A333 0E57 2FD=
D


--Ug3AveXibHqPsumOj5eWPppvUXhpji9cw--

--GDk1eE6S2Rj89imKe8nMOLs04qgGteavn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQIcBAEBCAAGBQJZc4rUAAoJELgmozMOVy/dcAYP/31e0Zc5XaEc6FYdo6zNDhsy
W+4QgdzYO9jd/dB/X+BbIn/909lft3ZcUlK6aUUbJE2SDll3LwEUxc64ZYQLAQ6Y
yUoaQ25+5khVsr9WHk5QCcHBiNK2jpU1seOOs5hXwGrdTZnYlGNFMIBxD1IvFGhv
011AwqfUZ+pTd5QjW2IOVQqtaLR/K8zuXB3J/Ux8gDMj3GICeEssBZSxQe8ZRvmI
pZVNDxSNxohoO5TeJGdBCPxhckibdvHKWrtW9KxpoyOtwn2GdDUOlffGyWvHQiy4
kWsy5uMgCctXAlMAV+evOIoSWhRnG937oaEViLR3pDg4dpvkCS42rfKZKTXHB0VI
jDY5/p3VhohLZ0cRkewMBR2o4vy8ViC5v0RB0T1Uqdx6ER9DlRw9QpgUbk8srk7l
cEgHQG13+S6Bq4F0hxEw5NzyE/pVS01akToHMD8cXEiVMgvRZ661RGiPZGoldvcY
UGSGvEoJgmNJnMlE45ywCWAPR3pS89ABIS+B2ROExLKcn6Lg81kfyV/U/y3TFzs5
TYdgZY0rEfBUvu+h3YQTjpLUEceWDNNk55jeE024qcGDmbZcjTr5Sr7iw+V/Owxo
wuN0xJbDFuGlgo6wm+fTRt4CpiwYFUkErFCljrW4hpXjuVCLRgI5A5ZW4obGw1YQ
IPJXpWZ0ARTI531+ZKYn
=zJoj
-----END PGP SIGNATURE-----

--GDk1eE6S2Rj89imKe8nMOLs04qgGteavn--
