From: Hannes Reinecke <hare@suse.de>
Date: Wed, 22 Feb 2017 06:47:56 +0000
Subject: Re: [patch] scsi_dh_emc: return success in clariion_std_inquiry()
Message-Id: <cbee4bad-ea00-1c2b-4e0d-c925e35cd45c@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170221183050.GB28595@mwanda>
In-Reply-To: <20170221183050.GB28595@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <dan.carpenter@oracle.com>, "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>, Jens Axboe <axboe@fb.com>, Johannes Thumshirn <jthumshirn@suse.de>, Shaun Tancheff <shaun.tancheff@seagate.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org

On 02/21/2017 07:46 PM, Dan Carpenter wrote:
> We accidentally return an uninitialized variable on success.
>=20
> Fixes: b6ff1b14cdf4 ("[SCSI] scsi_dh: Update EMC handler")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>=20
> diff --git a/drivers/scsi/device_handler/scsi_dh_emc.c b/drivers/scsi/dev=
ice_handler/scsi_dh_emc.c
> index 4a7679f6c73d..f1578832ec7a 100644
> --- a/drivers/scsi/device_handler/scsi_dh_emc.c
> +++ b/drivers/scsi/device_handler/scsi_dh_emc.c
> @@ -358,7 +358,7 @@ static int clariion_prep_fn(struct scsi_device *sdev,=
 struct request *req)
>  static int clariion_std_inquiry(struct scsi_device *sdev,
>  				struct clariion_dh_data *csdev)
>  {
> -	int err;
> +	int err =3D SCSI_DH_OK;
>  	char *sp_model;
> =20
>  	sp_model =3D parse_sp_model(sdev, sdev->inquiry);
>=20
Reviewed-by: Hannes Reinecke <hare@suse.com>

Cheers,

Hannes
--=20
Dr. Hannes Reinecke		   Teamlead Storage & Networking
hare@suse.de			               +49 911 74053 688
SUSE LINUX GmbH, Maxfeldstr. 5, 90409 N=FCrnberg
GF: F. Imend=F6rffer, J. Smithard, J. Guild, D. Upmanyu, G. Norton
HRB 21284 (AG N=FCrnberg)
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
