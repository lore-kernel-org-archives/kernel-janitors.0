From: Chris Bagwell <chris@cnpbagwell.com>
Date: Tue, 27 Mar 2012 20:39:10 +0000
Subject: Re: [patch] Input: wacom - check for allocation failure in probe()
Message-Id: <CAGzDe_a+RWkXz5UA39Bv51sm+Gb=0_5ZnmJMd_CJDmr2jRhtdg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120327201511.GA9197@elgon.mountain>
In-Reply-To: <20120327201511.GA9197@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Ping Cheng <pingc@wacom.com>, Eduard Hasenleithner <eduard@hasenleithner.at>, Jason Gerecke <killertofu@gmail.com>, linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org

Thanks for catch.

Reviewed-by: Chris Bagwell <chris@cnpbagwell.com>

On Tue, Mar 27, 2012 at 3:15 PM, Dan Carpenter <dan.carpenter@oracle.com> w=
rote:
> We accidentally removed the check for NULL in 3aac0ef10b "Input: wacom -
> isolate input registration".
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> diff --git a/drivers/input/tablet/wacom_sys.c b/drivers/input/tablet/waco=
m_sys.c
> index 19ba586..0d26921 100644
> --- a/drivers/input/tablet/wacom_sys.c
> +++ b/drivers/input/tablet/wacom_sys.c
> @@ -1002,6 +1002,8 @@ static int wacom_probe(struct usb_interface *intf, =
const struct usb_device_id *i
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return -EINVAL;
>
> =A0 =A0 =A0 =A0wacom =3D kzalloc(sizeof(struct wacom), GFP_KERNEL);
> + =A0 =A0 =A0 if (!wacom)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -ENOMEM;
>
> =A0 =A0 =A0 =A0wacom_wac =3D &wacom->wacom_wac;
> =A0 =A0 =A0 =A0wacom_wac->features =3D *((struct wacom_features *)id->dri=
ver_info);
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
