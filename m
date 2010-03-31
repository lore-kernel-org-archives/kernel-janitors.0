From: Christian Casteyde <casteyde.christian@free.fr>
Date: Wed, 31 Mar 2010 20:17:32 +0000
Subject: Re: [patch] thermal: make lockdep happy
Message-Id: <201003312217.33392.casteyde.christian@free.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100331170916.GA13784@bicker>
In-Reply-To: <20100331170916.GA13784@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <error27@gmail.com>, Zhang Rui <rui.zhang@intel.com>, Andrew Morton <akpm@linux-foundation.org>, Len Brown <len.brown@intel.com>, Matthew Garrett <mjg@redhat.com>, Frans Pop <elendil@planet.nl>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Seems to fix it, at least when applied on -rc3.
I'm updating the bugzilla entry.

Thanks.

Le mercredi 31 mars 2010, Dan Carpenter a =E9crit=A0:
> Hi Christian,
>
> Can you test this patch?
>
> I wrote this to address bugzilla bug:
> 	https://bugzilla.kernel.org/show_bug.cgi?id=15504
> 	BUG: key ffff88004c3811e0 not in .data! occured in lockdep.c
>
> We now have to call sysfs_attr_init() for dynamically allocated sysfs
> attributes or lockdep complains.
>
> Signed-off-by: Dan Carpenter <error27@gmail.com>
>
> diff --git a/drivers/thermal/thermal_sys.c b/drivers/thermal/thermal_sys.c
> index 5066de5..d4fec47 100644
> --- a/drivers/thermal/thermal_sys.c
> +++ b/drivers/thermal/thermal_sys.c
> @@ -725,6 +725,7 @@ int thermal_zone_bind_cooling_device(struct
> thermal_zone_device *tz, goto release_idr;
>
>  	sprintf(dev->attr_name, "cdev%d_trip_point", dev->id);
> +	sysfs_attr_init(&dev->attr.attr);
>  	dev->attr.attr.name =3D dev->attr_name;
>  	dev->attr.attr.mode =3D 0444;
>  	dev->attr.show =3D thermal_cooling_device_trip_point_show;


--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
