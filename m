From: Johannes Thumshirn <jthumshirn@suse.de>
Date: Mon, 23 Jan 2017 09:20:17 +0000
Subject: Re: [PATCH 3/5] blk-throttle: Adjust two function calls together with a variable assignment
Message-Id: <20170123091821.GC3517@linux-x5ow.site>
List-Id: <kernel-janitors.vger.kernel.org>
References: <e734cafa-eec0-9d5b-b368-2de496a96c80@users.sourceforge.net>
 <7d68f93d-c14c-60aa-2b02-5005a0a62cad@users.sourceforge.net>
In-Reply-To: <7d68f93d-c14c-60aa-2b02-5005a0a62cad@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-block@vger.kernel.org, Jens Axboe <axboe@kernel.dk>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Sun, Jan 22, 2017 at 09:33:08AM +0100, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sat, 21 Jan 2017 22:15:33 +0100
>=20
> The script "checkpatch.pl" pointed information out like the following.
>=20
> ERROR: do not use assignment in if condition
>=20
> Thus fix the affected source code places.
>=20
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---

Reviewed-by: Johannes Thumshirn <jthumshirn@suse.de>
if Jens wants doesn't mind.

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
