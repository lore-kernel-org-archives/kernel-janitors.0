From: Corentin Chary <corentin.chary@gmail.com>
Date: Tue, 06 Apr 2010 18:46:06 +0000
Subject: Re: [patch] asus: don't modify bluetooth/wlan on boot
Message-Id: <p2x71cd59b01004061146x25f04dfy82e1aba72ddfd3ff@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100406104429.GB21229@bicker>
In-Reply-To: <20100406104429.GB21229@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <error27@gmail.com>, Corentin Chary <corentincj@iksaif.net>, Matthew Garrett <mjg@redhat.com>, Len Brown <len.brown@intel.com>, Alan Jenkins <alan-jenkins@tuffmail.co.uk>, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Apr 6, 2010 at 12:44 PM, Dan Carpenter <error27@gmail.com> wrote:
> We were storing -1 as an unsigned int and as a result the effect of
> passing -1 was the same as using 1.
>
> Signed-off-by: Dan Carpenter <error27@gmail.com>
>
> diff --git a/drivers/platform/x86/asus-laptop.c b/drivers/platform/x86/as=
us-laptop.c
> index 475ab50..f532336 100644
> --- a/drivers/platform/x86/asus-laptop.c
> +++ b/drivers/platform/x86/asus-laptop.c
> @@ -78,15 +78,15 @@ static uint wapf =3D 1;
> =A0module_param(wapf, uint, 0644);
> =A0MODULE_PARM_DESC(wapf, "WAPF value");
>
> -static uint wlan_status =3D 1;
> -static uint bluetooth_status =3D 1;
> +static int wlan_status =3D 1;
> +static int bluetooth_status =3D 1;
>
> -module_param(wlan_status, uint, 0644);
> +module_param(wlan_status, int, 0644);
> =A0MODULE_PARM_DESC(wlan_status, "Set the wireless status on boot "
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 "(0 =3D disabled, 1 =3D enabled, -1 =3D d=
on't do anything). "
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 "default is 1");
>
> -module_param(bluetooth_status, uint, 0644);
> +module_param(bluetooth_status, int, 0644);
> =A0MODULE_PARM_DESC(bluetooth_status, "Set the wireless status on boot "
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 "(0 =3D disabled, 1 =3D enabled, -1 =3D d=
on't do anything). "
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 "default is 1");
> --

Thanks !
Acked-by: Corentin Chary <corentincj@iksaif.net>


--=20
Corentin Chary
http://xf.iksaif.net
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
