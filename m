From: Felipe Balbi <felipe.balbi@linux.intel.com>
Date: Mon, 13 Feb 2017 10:45:19 +0000
Subject: Re: [PATCH] usb: misc: usbtest: remove redundant check on retval < 0
Message-Id: <8760keqshs.fsf@linux.intel.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="=-=-="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170212183518.22528-1-colin.king@canonical.com>
In-Reply-To: <20170212183518.22528-1-colin.king@canonical.com>
To: Colin King <colin.king@canonical.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Peter Chen <peter.chen@nxp.com>, Alan Stern <stern@rowland.harvard.edu>, Mathias Nyman <mathias.nyman@linux.intel.com>, Lu Baolu <baolu.lu@linux.intel.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-usb@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Colin King <colin.king@canonical.com> writes:
> From: Colin Ian King <colin.king@canonical.com>
>
> The check for retval being less than zero is always true since
> retval equal to -EPIPE at that point.  Replace the existing
> conditional with just return retval.
>
> Detected with CoverityScan, CID#114349 ("Logically dead code")
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/usb/misc/usbtest.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/usb/misc/usbtest.c b/drivers/usb/misc/usbtest.c
> index 3525626..17c0810 100644
> --- a/drivers/usb/misc/usbtest.c
> +++ b/drivers/usb/misc/usbtest.c
> @@ -992,7 +992,7 @@ static int ch9_postconfig(struct usbtest_dev *dev)
>  				dev_err(&iface->dev,
>  						"hs dev qualifier --> %d\n",
>  						retval);
> -				return (retval < 0) ? retval : -EDOM;
> +				return retval;

you're changing return value here, are you sure there's nothing else
depending on this error?

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAlihjj8ACgkQzL64meEa
mQYvtg/9HhgZ4m7JdUhu+TRvdcFdq2v7K7kZONnLXsC9IOGYWq+/OpNUnYXN3JI3
0300LtgNp21G9SjOMcGx3654UVPtS7gBLvRVdCnSFyAVM8TlM4GL1OvFwZUPeuYE
FLQN5q2/QVi01PCfMXDdd2vwDsmraOrcTihi+Om29xx26gYsrH9R7CTjj5mQj/4k
xvbsnWtCMJhReUpPxfqHn7uPAZNDTTutctIHC+x1Et471bZtWF0azphAwtigIvak
9xoG7cGU7Vlt8NWfSHSjJ0scf9bTaFN/khdC2D2cLfZe7rrpYFEvEz9tH3hjdHaT
PUljULcYxTa44RChCK1MgmhOuRbhnoewnKm+HwONDYianKcO9FwlXjtZMapuTawk
hbJTGW+pa3O4VgmmmKcvunPhp+6eM97pUoDS+8T+7RndERVa7RlnM5DdrnaKDsJL
pSJtMJrHZWRKT9mt0++IFdNY88xz4Bh1VHirx3odB08OS9k3+QIweYTYXQFnPDKc
brGMnkZj/k58bmTXg6Y6Jez2Yxb+qtPizjHiXOtlVjr1fyBrB487rBJsrwQt9ECy
puUnpaB1lkOKLnFXmbMAoYBC2lG2L8/BDCjc75HIxCAuqEnJ/0sFQw1c/3zLvJVN
h+fg6N8C+BbufNvW94CYc3OzIpGPyZh7VQJk7ZBdSCqDyB1vc0Y=
=Ut3O
-----END PGP SIGNATURE-----
--=-=-=--
