From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 11 Aug 2017 07:55:42 +0000
Subject: Re: [PATCH] thermal: ti-soc-thermal: Potential error pointer dereferences
Message-Id: <20170811075510.cnaisfliycev43w4@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170710072422.rs25i5oawmiaofrp@mwanda>
 <1502416833.2598.3.camel@intel.com>
In-Reply-To: <1502416833.2598.3.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Zhang Rui <rui.zhang@intel.com>
Cc: Eduardo Valentin <edubezval@gmail.com>, Keerthy <j-keerthy@ti.com>, linux-pm@vger.kernel.org, linux-omap@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Aug 11, 2017 at 10:00:33AM +0800, Zhang Rui wrote:
> On Mon, 2017-07-10 at 10:24 +0300, Dan Carpenter wrote:
> > ti_bandgap_get_sensor_data() can return error pointers so we should
> > check for that.=A0=A0There is no need to check "data->ti_thermal" for
> > NULL
> > and we removed that from the other cleanup function so we may as well
> > from it in ti_thermal_remove_sensor() to be consistent.
> >=20
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> >=20
> > diff --git a/drivers/thermal/ti-soc-thermal/ti-thermal-common.c
> > b/drivers/thermal/ti-soc-thermal/ti-thermal-common.c
> > index c211a8e4a210..9fea354ca90c 100644
> > --- a/drivers/thermal/ti-soc-thermal/ti-thermal-common.c
> > +++ b/drivers/thermal/ti-soc-thermal/ti-thermal-common.c
> > @@ -210,7 +210,7 @@ int ti_thermal_remove_sensor(struct ti_bandgap
> > *bgp, int id)
> > =A0
> > =A0	data =3D ti_bandgap_get_sensor_data(bgp, id);
> > =A0
> > -	if (data && data->ti_thermal) {
> > +	if (data && !IS_ERR(data)) {
>=20
> what about
> 	if (!IS_ERR_OR_NULL(data))
>=20

Duh.  Of course, let me resend.

regards,
dan carpenter

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
