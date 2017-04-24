From: Leon Romanovsky <leon@kernel.org>
Date: Mon, 24 Apr 2017 14:33:32 +0000
Subject: Re: IB/ocrdma: Improve size determinations in ten functions
Message-Id: <20170424143332.GK14088@mtr-leonro.local>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="SKW69dzTt3T8RCN0"
List-Id: <kernel-janitors.vger.kernel.org>
References: <fc421509-4069-da8a-b308-60b49ea91ada@users.sourceforge.net>
 <1492720999.3041.18.camel@redhat.com>
 <86425035-7da8-d2b1-8544-d4f7540d50c6@users.sourceforge.net>
 <755f6c2c-03a2-7248-a5e3-9190d119cdaf@users.sourceforge.net>
 <20170423073311.GA14088@mtr-leonro.local>
 <1f122892-7e67-a7ca-ae7f-7ac8e2b7a037@intel.com>
 <a2b014f3-7674-6e33-3b22-72594b38a6b6@users.sourceforge.net>
In-Reply-To: <a2b014f3-7674-6e33-3b22-72594b38a6b6-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
To: Dennis Dalessandro <dennis.dalessandro-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: SF Markus Elfring <elfring-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>, Doug Ledford <dledford-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Devesh Sharma <devesh.sharma-1wcpHE2jlwO1Z/+hSey0Gg@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Selvin Xavier <selvin.xavier-1wcpHE2jlwO1Z/+hSey0Gg@public.gmane.org>, Yuval Shaia <yuval.shaia-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--SKW69dzTt3T8RCN0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 24, 2017 at 03:23:52PM +0200, SF Markus Elfring wrote:
> > Markus, what have you done to ensure your patches don't break anything?
>
> I would expect that this update step will not change the run time behaviour
> for the OCRDMA module. I guess that it will influence the run time
> characteristics for compilation of three adjusted source files besides
> the proposed coding style improvements.
>
> Further update steps change other source code places. I hope that their
> impact can be clarified according to your expectations for each shown update
> possibility separately. Some of them got a bit of acceptance already.
>
> How would you like to reduce any remaining software development concerns here?
>

Dennis,

He didn't check it, this is why in most susbsystems his patches are
ignored.

Thanks

> Regards,
> Markus

--SKW69dzTt3T8RCN0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEkhr/r4Op1/04yqaB5GN7iDZyWKcFAlj+DLwACgkQ5GN7iDZy
WKehlg/6AlY2QCEs6aN9ds686v2lAvSupX3PdKoAu90zLPvkxeJAVTwlA1FY5D/e
erBIghqEJnq364T8qr641JZt8HfczSQLZx5nrerQyUXo6BBAz1rsCsx7TA8Eto6+
VwAZ1Aer+u7CHcuBOa2yE2fkOET7uM1CBsHRYnIzdjIiwsnhuEEbHCfmg7s6GyBT
f3cMJkBsqhU8Gza/Lt+CCEsYz0jEuPeF0Y+e/xAljcXe3IXIXrfSCYkjvCwxRE3x
/PklieRcDnz7A7f1DUu+NmvoNoP+NGdzw59SJkuv78btkmErYWDRKX9D5SYKjBSS
pQxUJGtlofVJcFm3ZIIB6HTyBxxhlbWLDLVnMFW22fVG1NQFY0bLPm023lIBu2Q9
AyBu0KofdNaCQQGKpqkiHxeFgBtY4KmHraMYUxBQnCZuKE9ujQuSrxnUNF4hx0em
tNqHJ240IhpxjKAtFgAvD+OUYRSiPrnv4k6aA1eNC/XUIXnJ0Ga9CDRdEGW3SyOc
NENIevZvb9nWuoeE15DxrtzYyDvVsNevz7Svsg07J+TdxuUU3xgdeBALqxSwh8Ov
e3nIRTFB4hHHx4BnzAt1UJ4ZJEZiRh50duUU4WO5i0WflHdxpDfm98YJdFIv1AKd
Q2zapznkvIbYkcTbPA6IWlEli4XT/Voxj1W5nkQHmZ+3XOUTJFE=
=9MOP
-----END PGP SIGNATURE-----

--SKW69dzTt3T8RCN0--
