From: Hannes Reinecke <hare@suse.de>
Date: Fri, 20 Jul 2012 14:41:34 +0000
Subject: Re: [patch] [SCSI] aic79xx: NULL dereference in debug code
Message-Id: <50096E1E.60709@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120720113057.GC22245@elgon.mountain>
In-Reply-To: <20120720113057.GC22245@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "James E.J. Bottomley" <JBottomley@parallels.com>, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 07/20/2012 01:30 PM, Dan Carpenter wrote:
> "ahd" can be NULL here and it gets dereferenced inside the call to
> ahd_name().
>=20
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>=20
Acked-by: Hannes Reinecke <hare@suse.de>

Cheers,

Hannes
--=20
Dr. Hannes Reinecke		      zSeries & Storage
hare@suse.de			      +49 911 74053 688
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg
GF: J. Hawn, J. Guild, F. Imend=F6rffer, HRB 16746 (AG N=FCrnberg)


--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
