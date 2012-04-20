From: Julian Calaby <julian.calaby@gmail.com>
Date: Fri, 20 Apr 2012 08:57:00 +0000
Subject: Re: [patch] wireless: at76c50x: allocating too much data
Message-Id: <CAGRGNgVgtAYknmpB_8Q0OpcUWFjTxBistG+RNs1ORDZeckGsWw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120420064705.GE22649@elgon.mountain>
In-Reply-To: <20120420064705.GE22649@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "John W. Linville" <linville@tuxdriver.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi Dan,

On Fri, Apr 20, 2012 at 16:47, Dan Carpenter <dan.carpenter@oracle.com> wro=
te:
> This is a cut and paste mistake, sizeof(struct mib_local) was intended
> instead of sizeof(struct mib_phy). =A0The call to at76_get_mib() uses
> sizeof(struct mib_local) correctly.
>
> The current code works fine because mib_phy structs are larger than
> mib_local structs. =A0But we may as well clean it up.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> diff --git a/drivers/net/wireless/at76c50x-usb.c b/drivers/net/wireless/a=
t76c50x-usb.c
> index faa8bcb..0bba5ea 100644
> --- a/drivers/net/wireless/at76c50x-usb.c
> +++ b/drivers/net/wireless/at76c50x-usb.c
> @@ -1122,7 +1122,7 @@ exit:
> =A0static void at76_dump_mib_local(struct at76_priv *priv)
> =A0{
> =A0 =A0 =A0 =A0int ret;
> - =A0 =A0 =A0 struct mib_local *m =3D kmalloc(sizeof(struct mib_phy), GFP=
_KERNEL);
> + =A0 =A0 =A0 struct mib_local *m =3D kmalloc(sizeof(struct mib_local), G=
FP_KERNEL);

Would it be better practice to use sizeof(*m)?

Thanks,

--=20
Julian Calaby

Email: julian.calaby@gmail.com
Profile: http://www.google.com/profiles/julian.calaby/
.Plan: http://sites.google.com/site/juliancalaby/
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
