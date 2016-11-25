From: Johannes Thumshirn <jthumshirn@suse.de>
Date: Fri, 25 Nov 2016 08:59:23 +0000
Subject: Re: [patch] scsi: libfc: Remove an unneeded condition
Message-Id: <20161125085923.6otsquagucobujhj@linux-x5ow.site>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161124105238.GB17225@mwanda>
In-Reply-To: <20161124105238.GB17225@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Johannes Thumshirn <jth@kernel.org>, Hannes Reinecke <hare@suse.de>, "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, fcoe-devel@open-fcoe.org, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Nov 24, 2016 at 01:52:38PM +0300, Dan Carpenter wrote:
> We verified that resp_code is FC_SPP_RESP_ACK earlier so we don't need
> to check again here.
>=20
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>=20

Looks good,
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
