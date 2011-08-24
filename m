From: David Herrmann <dh.herrmann@googlemail.com>
Date: Wed, 24 Aug 2011 12:26:34 +0000
Subject: Re: [patch -next] HID: unlock on error path in hid_device_probe()
Message-Id: <CANq1E4T5YNYtxtY+XKQc=ogSXsdy7N5d37BBT=+zkw1oexU2Og@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110824112745.GB5975@shale.localdomain>
In-Reply-To: <20110824112745.GB5975@shale.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <error27@gmail.com>
Cc: Jiri Kosina <jkosina@suse.cz>, "open list:HID CORE LAYER" <linux-input@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Wed, Aug 24, 2011 at 1:27 PM, Dan Carpenter <error27@gmail.com> wrote:
> We recently introduced locking into this function, but we missed an
> error path which needs an unlock.
>
> Signed-off-by: Dan Carpenter <error27@gmail.com>
>
> diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
> index 582be00..ed0cd09 100644
> --- a/drivers/hid/hid-core.c
> +++ b/drivers/hid/hid-core.c
> @@ -1643,8 +1643,10 @@ static int hid_device_probe(struct device *dev)
>
> =A0 =A0 =A0 =A0if (!hdev->driver) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0id =3D hid_match_device(hdev, hdrv);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (id =3D NULL)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -ENODEV;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (id =3D NULL) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -ENODEV;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto unlock;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0hdev->driver =3D hdrv;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (hdrv->probe) {
> @@ -1657,7 +1659,7 @@ static int hid_device_probe(struct device *dev)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (ret)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0hdev->driver =3D NULL;
> =A0 =A0 =A0 =A0}
> -
> +unlock:
> =A0 =A0 =A0 =A0up(&hdev->driver_lock);
> =A0 =A0 =A0 =A0return ret;
> =A0}
>

How could I miss that... Thanks. I tested this locking patch only with
one driver so this problem did not occur. However, using two HID
devices will deadlock the drivers. Nice catch.
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
