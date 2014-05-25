From: Greg KH <gregkh@linuxfoundation.org>
Date: Sun, 25 May 2014 18:14:31 +0000
Subject: Re: [PATCH] staging: gdm72xx: use time_before()
Message-Id: <20140525181431.GA20614@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1401023339-29712-1-git-send-email-manuel.schoelling@gmx.de>
In-Reply-To: <1401023339-29712-1-git-send-email-manuel.schoelling@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Manuel =?iso-8859-1?Q?Sch=F6lling?= <manuel.schoelling@gmx.de>
Cc: devel@driverdev.osuosl.org, arnd@arndb.de, peter.p.waskiewicz.jr@intel.com, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, khoroshilov@ispras.ru

On Sun, May 25, 2014 at 03:08:59PM +0200, Manuel Sch=F6lling wrote:
> To be future-proof and for better readability the time comparisons are
> modified to use time_before() instead of plain, error-prone math.
>=20
> Signed-off-by: Manuel Sch=F6lling <manuel.schoelling@gmx.de>
> ---
>  drivers/staging/gdm72xx/gdm_usb.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

This patch doesn't apply, can you please refresh it against my latest
tree and resend?

thanks,

greg k-h
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
