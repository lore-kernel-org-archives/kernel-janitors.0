From: Johannes Thumshirn <jthumshirn@suse.de>
Date: Mon, 23 Jan 2017 09:16:10 +0000
Subject: Re: [PATCH 2/5] blk-throttle: Move an assignment for the variable "ret" in tg_set_conf()
Message-Id: <20170123091610.GB3517@linux-x5ow.site>
List-Id: <kernel-janitors.vger.kernel.org>
References: <e734cafa-eec0-9d5b-b368-2de496a96c80@users.sourceforge.net>
 <d20da6bc-b84a-3b2c-614c-68ace67db7e0@users.sourceforge.net>
In-Reply-To: <d20da6bc-b84a-3b2c-614c-68ace67db7e0@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-block@vger.kernel.org, Jens Axboe <axboe@kernel.dk>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Sun, Jan 22, 2017 at 09:32:19AM +0100, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sat, 21 Jan 2017 21:40:38 +0100
>=20
> A local variable was set to an error code before a concrete error situati=
on
> was detected. Thus move the corresponding assignment into an if branch
> to indicate a software failure there.
>=20
> This issue was detected by using the Coccinelle software.
>=20
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---

See my answer to the last patch.

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
