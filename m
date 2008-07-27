From: Julia Lawall <julia@diku.dk>
Date: Sun, 27 Jul 2008 08:15:10 +0000
Subject: Re: [PATCH 1/14 v2] drivers/isdn/hisax/telespci.c: fix warning
Message-Id: <Pine.LNX.4.64.0807271014330.303@ask.diku.dk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="-511516320-1099352142-1217146510=:303"
List-Id: <kernel-janitors.vger.kernel.org>
References: <1217145098.6042.2.camel@inlin>
In-Reply-To: <1217145098.6042.2.camel@inlin>
To: kernel-janitors@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---511516320-1099352142-1217146510=:303
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Sun, 27 Jul 2008, Michael Borisov wrote:

> Probably now it is correct ?=20

Please explain why.

julia

> This patch fixes the following compile warning:
>=20
> drivers/isdn/hisax/telespci.c: In function =FF=FFsetup_telespci=FF=FF:
> drivers/isdn/hisax/telespci.c:303: warning: =FF=FFpci_find_device=FF=FF is
> deprecated (declared at include/linux/pci.h:535)
>=20
> Signed-off-by: Michael Borisov <niro@tut.by>
> ---
> diff --git a/drivers/isdn/hisax/telespci.c
> b/drivers/isdn/hisax/telespci.c
> index 28b08de..1142f35 100644
> --- a/drivers/isdn/hisax/telespci.c
> +++ b/drivers/isdn/hisax/telespci.c
> @@ -300,7 +300,9 @@ setup_telespci(struct IsdnCard *card)
>  	if (cs->typ !=3D ISDN_CTYPE_TELESPCI)
>  		return (0);
> =20
> -	if ((dev_tel =3D pci_find_device (PCI_VENDOR_ID_ZORAN,
> PCI_DEVICE_ID_ZORAN_36120, dev_tel))) {
> +	dev_tel =3D pci_get_device (PCI_VENDOR_ID_ZORAN,
> PCI_DEVICE_ID_ZORAN_36120, NULL);
> +	if (dev_tel) {
> +		pci_dev_put(dev_tel);
>  		if (pci_enable_device(dev_tel))
>  			return(0);
>  		cs->irq =3D dev_tel->irq;
>=20
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors=
" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20
---511516320-1099352142-1217146510=:303--
