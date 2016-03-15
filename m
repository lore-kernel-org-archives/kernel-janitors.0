From: Joe Perches <joe@perches.com>
Date: Tue, 15 Mar 2016 08:33:29 +0000
Subject: Re: [patch] Input: synaptics-rmi4 - using logical instead of bitwise AND
Message-Id: <1458030809.11972.178.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160315071140.GF13560@mwanda>
In-Reply-To: <20160315071140.GF13560@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <dan.carpenter@oracle.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Andrew Duggan <aduggan@synaptics.com>
Cc: Henrik Rydberg <rydberg@bitmath.org>, Christopher Heiny <cheiny@synaptics.com>, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, 2016-03-15 at 10:11 +0300, Dan Carpenter wrote:
> There is a typo so we have && instead of &.
>=20
> Fixes: ff8f83708b3e ('Input: synaptics-rmi4 - add support for 2D sensors =
and F11')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>=20
> diff --git a/drivers/input/rmi4/rmi_f11.c b/drivers/input/rmi4/rmi_f11.c
[]
> @@ -775,7 +775,7 @@ static int rmi_f11_get_query_parameters(struct rmi_de=
vice *rmi_dev,
> =A0	sensor_query->has_abs =3D !!(query_buf[0] & RMI_F11_HAS_ABS);
> =A0	sensor_query->has_gestures =3D !!(query_buf[0] & RMI_F11_HAS_GESTURES=
);
> =A0	sensor_query->has_sensitivity_adjust > -		!!(query_buf[0] && RMI_F11_=
HAS_SENSITIVITY_ADJ);
> +		!!(query_buf[0] & RMI_F11_HAS_SENSITIVITY_ADJ);
> =A0	sensor_query->configurable =3D !!(query_buf[0] & RMI_F11_CONFIGURABLE=
);
> =A0
> =A0	sensor_query->nr_x_electrodes > @@ -803,7 +803,7 @@ static int rmi_f1=
1_get_query_parameters(struct rmi_device *rmi_dev,
> =A0		sensor_query->has_bending_correction > =A0			!!(query_buf[0] & RMI_F=
11_HAS_BENDING_CORRECTION);
> =A0		sensor_query->has_large_object_suppression > -		!!(query_buf[0] && R=
MI_F11_HAS_LARGE_OBJECT_SUPPRESSION);
> +			!!(query_buf[0] & RMI_F11_HAS_LARGE_OBJECT_SUPPRESSION);
> =A0		sensor_query->has_jitter_filter > =A0			!!(query_buf[0] & RMI_F11_HA=
S_JITTER_FILTER);
> =A0		query_size++;

Right and as well these are bool so the !! isn't necessary.
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
