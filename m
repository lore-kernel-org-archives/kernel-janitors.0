From: Johannes Thumshirn <jthumshirn@suse.de>
Date: Wed, 12 Jul 2017 07:54:14 +0000
Subject: Re: [PATCH] scsi: libfc: pass an error pointer to fc_disc_error()
Message-Id: <20170712075414.GB4115@linux-x5ow.site>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170712073022.e24r3iad7jqxarn6@mwanda>
In-Reply-To: <20170712073022.e24r3iad7jqxarn6@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Johannes Thumshirn <jth@kernel.org>, Robert Love <rml@tech9.net>, "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, fcoe-devel@open-fcoe.org, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Jul 12, 2017 at 10:30:22AM +0300, Dan Carpenter wrote:
> This patch is basically to silence a static checker warning.
>=20
>     drivers/scsi/libfc/fc_disc.c:326 fc_disc_error()
>     warn: passing a valid pointer to 'PTR_ERR'
>=20
> It doesn't affect runtime because it treats -ENOMEM and a valid pointer
> the same.  But the documentation says we should be passing an error
> pointer.

Acked-by: Johannes Thumshirn <jth@kernel.org>
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
