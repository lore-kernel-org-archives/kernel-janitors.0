From: Hannes Reinecke <hare@suse.de>
Date: Thu, 30 Jul 2015 06:54:51 +0000
Subject: Re: [patch] [SCSI] atp870u: 64 bit bug in probe()
Message-Id: <55B9CA3B.1030205@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150729213605.GD21784@mwanda>
In-Reply-To: <20150729213605.GD21784@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <dan.carpenter@oracle.com>, "James E.J. Bottomley" <JBottomley@odin.com>
Cc: linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org

On 07/29/2015 11:36 PM, Dan Carpenter wrote:
> On 64 bit CPUs there is a memory corruption bug on probe().  It should
> be a u32 pointer instead of an unsigned long pointer or we write past
> the end of the setupdata[] array.
>=20
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> Someone reported in 2003 that probe has a NULL deref so maybe it's
> related to this memory corruption?
> https://bugzilla.kernel.org/show_bug.cgi?id=1118
>=20
> If only we had applied this patch when I originally sent it two years
> ago, then it would only be 10 years too late instead of 12!  :P
>=20
Reviewed-by: Hannes Reinecke <hare@suse.com>

Cheers,

Hannes
--=20
Dr. Hannes Reinecke		               zSeries & Storage
hare@suse.de			               +49 911 74053 688
SUSE LINUX GmbH, Maxfeldstr. 5, 90409 N=FCrnberg
GF: F. Imend=F6rffer, J. Smithard, J. Guild, D. Upmanyu, G. Norton
HRB 21284 (AG N=FCrnberg)
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
