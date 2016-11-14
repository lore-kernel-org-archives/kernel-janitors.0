From: Jason Gerecke <killertofu@gmail.com>
Date: Mon, 14 Nov 2016 18:31:52 +0000
Subject: Re: [patch] HID: wacom: Don't clear bits unintentionally
Message-Id: <56caefcd-93d6-201d-f597-2d651cbe68ba@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161110192539.GA32533@mwanda>
In-Reply-To: <20161110192539.GA32533@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <dan.carpenter@oracle.com>, Jiri Kosina <jikos@kernel.org>
Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>, Henrik Rydberg <rydberg@bitmath.org>, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 11/10/2016 11:25 AM, Dan Carpenter wrote:
> This is trying to clear the lower 32 bits but the type is wrong so it
> clears everything.
>=20
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>=20

Reviewed-by: Jason Gerecke <jason.gerecke@wacom.com>

Jason
---
Now instead of four in the eights place /
you=92ve got three, =91Cause you added one /
(That is to say, eight) to the two, /
But you can=92t take seven from three, /
So you look at the sixty-fours....

> diff --git a/drivers/hid/wacom_wac.c b/drivers/hid/wacom_wac.c
> index 0723ba8..1cf4608 100644
> --- a/drivers/hid/wacom_wac.c
> +++ b/drivers/hid/wacom_wac.c
> @@ -1765,7 +1765,7 @@ static int wacom_wac_pen_event(struct hid_device *h=
dev, struct hid_field *field,
>  		wacom_wac->hid_data.tipswitch |=3D value;
>  		return 0;
>  	case HID_DG_TOOLSERIALNUMBER:
> -		wacom_wac->serial[0] =3D (wacom_wac->serial[0] & ~0xFFFFFFFF);
> +		wacom_wac->serial[0] =3D (wacom_wac->serial[0] & ~0xFFFFFFFFULL);
>  		wacom_wac->serial[0] |=3D value;
>  		return 0;
>  	case WACOM_HID_WD_SENSE:
> --


--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
