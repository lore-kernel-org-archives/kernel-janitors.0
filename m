From: Johannes Thumshirn <jthumshirn@suse.de>
Date: Tue, 18 Apr 2017 12:05:16 +0000
Subject: Re: [PATCH] [SCSI] aic7xxx: remove redundant assignment to error
Message-Id: <20170418120516.GF6056@linux-x5ow.site>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170418115327.6833-1-colin.king@canonical.com>
In-Reply-To: <20170418115327.6833-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Colin King <colin.king@canonical.com>
Cc: Hannes Reinecke <hare@suse.com>, "James E . J . Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Apr 18, 2017 at 12:53:27PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>=20
> error is initially assigned to ENOENT and a few statements later
> is re-assigned to the error return from the call to ahd_wait_seeprom,
> hence the initial assignment is redundant and can be removed.
>=20
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/scsi/aic7xxx/aic79xx_core.c | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/drivers/scsi/aic7xxx/aic79xx_core.c b/drivers/scsi/aic7xxx/a=
ic79xx_core.c
> index 95d8f25cbcca..f5a2714ed82c 100644
> --- a/drivers/scsi/aic7xxx/aic79xx_core.c
> +++ b/drivers/scsi/aic7xxx/aic79xx_core.c
> @@ -10077,7 +10077,6 @@ ahd_write_seeprom(struct ahd_softc *ahd, uint16_t=
 *buf,
>  	int   retval;
> =20
>  	AHD_ASSERT_MODES(ahd, AHD_MODE_SCSI_MSK, AHD_MODE_SCSI_MSK);
> -	error =3D ENOENT;
> =20
>  	/* Place the chip into write-enable mode */
>  	ahd_outb(ahd, SEEADR, SEEOP_EWEN_ADDR);
> --=20

Well,
a) the return value of ahd_write_seeprom() is never checked (the only caller
   is ahd_proc_write_seeprom(),
b) Linux error codes are negative,
c) ahd_write_seeprom() has 'retval' and 'error' for returning error values
   back to the caller (which doesn't care...)

So to sum it up, this change doesn't change anything here. But "fixing" the
list above would make a change.

HTH,
	Johannes

--=20
Johannes Thumshirn                                          Storage
jthumshirn@suse.de                                +49 911 74053 689
SUSE LINUX GmbH, Maxfeldstr. 5, 90409 N=FCrnberg
GF: Felix Imend=F6rffer, Jane Smithard, Graham Norton
HRB 21284 (AG N=FCrnberg)
Key fingerprint =3D EC38 9CAB C2C4 F25D 8600 D0D0 0393 969D 2D76 0850
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
