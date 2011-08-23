From: David Chang <dchang@suse.com>
Date: Tue, 23 Aug 2011 04:59:00 +0000
Subject: Re: [PATCH 1/4] drivers/staging/usbip/userspace/libsrc/vhci_driver.c:
Message-Id: <CAL-cBk1DzOb8Hjj+MzbQ8jSk2PX0cQTfCMWioT=+jOPv5gUNKQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1314021636-11528-1-git-send-email-julia@diku.dk>
In-Reply-To: <1314021636-11528-1-git-send-email-julia@diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Julia Lawall <julia@diku.dk>
Cc: Matt Mooney <mfm@muteddisk.com>, kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@suse.de>, linux-usb@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

2011/8/22 Julia Lawall <julia@diku.dk>:
> From: Julia Lawall <julia@diku.dk>
>
> Test the just-initialized value rather than some other one.
>
> The semantic match that finds this problem is as follows:
> (http://coccinelle.lip6.fr/)
>
> // <smpl>
> @r@
> identifier x,y,f!=3D{PTR_ERR,ERR_PTR,ERR_CAST};
> statement S;
> @@
>
> x =3D f(...);
> (
> if (\(x =3D NULL\|IS_ERR(x)\)) S
> |
> *if (\(y =3D NULL\|IS_ERR(y)\))
> =A0{ ... when !=3D x
> =A0 return ...; }
> )
> // </smpl>
>
> Signed-off-by: Julia Lawall <julia@diku.dk>
>
> ---
> =A0drivers/staging/usbip/userspace/libsrc/vhci_driver.c | =A0 =A02 +-
> =A01 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/staging/usbip/userspace/libsrc/vhci_driver.c b/drive=
rs/staging/usbip/userspace/libsrc/vhci_driver.c
> index abbc285..2697877 100644
> --- a/drivers/staging/usbip/userspace/libsrc/vhci_driver.c
> +++ b/drivers/staging/usbip/userspace/libsrc/vhci_driver.c
> @@ -133,7 +133,7 @@ static int check_usbip_device(struct sysfs_class_devi=
ce *cdev)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 strlen(vhci_drive=
r->hc_device->path))) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/* found usbip device */
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0usbip_cdev =3D calloc(1, s=
izeof(*usbip_cdev));
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (!cdev) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (!usbip_cdev) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0dbg("callo=
c failed");
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return -1;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
>

Acked-by: David Chang <dchang@suse.com>

> --
> To unsubscribe from this list: send the line "unsubscribe linux-usb" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
