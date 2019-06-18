From: Benson Leung <bleung@google.com>
Date: Tue, 18 Jun 2019 19:50:11 +0000
Subject: Re: [PATCH][next] platform/chrome: wilco_ec: fix null pointer dereference on failed kzalloc
Message-Id: <20190618195011.GB209269@google.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="6sX45UoQRIJXqkqR"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190618153924.19491-1-colin.king@canonical.com>
In-Reply-To: <20190618153924.19491-1-colin.king@canonical.com>
To: Colin King <colin.king@canonical.com>
Cc: Benson Leung <bleung@chromium.org>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, Nick Crews <ncrews@chromium.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


--6sX45UoQRIJXqkqR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Colin,

On Tue, Jun 18, 2019 at 04:39:24PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>=20
> If the kzalloc of the entries queue q fails a null pointer dereference
> occurs when accessing q->capacity and q->lock.  Add a kzalloc failure
> check and handle the null return case in the calling function
> event_device_add.
>=20
> Addresses-Coverity: ("Dereference null return")
> Fixes: 75589e37d1dc ("platform/chrome: wilco_ec: Add circular buffer as e=
vent queue")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied. Thanks.

Benson

> ---
>  drivers/platform/chrome/wilco_ec/event.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/platform/chrome/wilco_ec/event.c b/drivers/platform/=
chrome/wilco_ec/event.c
> index c975b76e6255..e251a989b152 100644
> --- a/drivers/platform/chrome/wilco_ec/event.c
> +++ b/drivers/platform/chrome/wilco_ec/event.c
> @@ -112,8 +112,11 @@ module_param(queue_size, int, 0644);
>  static struct ec_event_queue *event_queue_new(int capacity)
>  {
>  	size_t entries_size =3D sizeof(struct ec_event *) * capacity;
> -	struct ec_event_queue *q =3D kzalloc(sizeof(*q) + entries_size,
> -					   GFP_KERNEL);
> +	struct ec_event_queue *q;
> +
> +	q =3D kzalloc(sizeof(*q) + entries_size, GFP_KERNEL);
> +	if (!q)
> +		return NULL;
> =20
>  	q->capacity =3D capacity;
>  	spin_lock_init(&q->lock);
> @@ -474,6 +477,11 @@ static int event_device_add(struct acpi_device *adev)
>  	/* Initialize the device data. */
>  	adev->driver_data =3D dev_data;
>  	dev_data->events =3D event_queue_new(queue_size);
> +	if (!dev_data->events) {
> +		kfree(dev_data);
> +		error =3D -ENOMEM;
> +		goto free_minor;
> +	}
>  	init_waitqueue_head(&dev_data->wq);
>  	dev_data->exist =3D true;
>  	atomic_set(&dev_data->available, 1);
> --=20
> 2.20.1
>=20

--=20
Benson Leung
Staff Software Engineer
Chrome OS Kernel
Google Inc.
bleung@google.com
Chromium OS Project
bleung@chromium.org

--6sX45UoQRIJXqkqR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCXQlAcwAKCRBzbaomhzOw
wr+OAQDkPiwWk7AV6oZD5PfPYh/XkD9jN7eDN/xgit4T9H45EAEA7vDa2nw7IoFX
InIF4BYsfI/ilZ9ZuBM8hpW43YKKswg=
=s73v
-----END PGP SIGNATURE-----

--6sX45UoQRIJXqkqR--
