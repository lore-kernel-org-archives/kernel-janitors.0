From: Johannes Thumshirn <jthumshirn@suse.de>
Date: Mon, 23 Jan 2017 11:47:20 +0000
Subject: Re: [PATCH 1/5] blk-throttle: Move three assignments for the variable "ret" in tg_set_max()
Message-Id: <20170123114609.GA8200@linux-x5ow.site>
List-Id: <kernel-janitors.vger.kernel.org>
References: <e734cafa-eec0-9d5b-b368-2de496a96c80@users.sourceforge.net>
 <75495d45-cfc4-9740-39e4-bd4c3e71232b@users.sourceforge.net>
 <20170123091510.GA3517@linux-x5ow.site>
 <130ce081-e9a2-4744-c74b-b73bea5ae98c@users.sourceforge.net>
In-Reply-To: <130ce081-e9a2-4744-c74b-b73bea5ae98c@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-block@vger.kernel.org, Jens Axboe <axboe@kernel.dk>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Mon, Jan 23, 2017 at 11:00:15AM +0100, SF Markus Elfring wrote:
> >> @@ -1327,27 +1327,30 @@ static ssize_t tg_set_max(struct kernfs_open_f=
ile *of,
> >>  			break;
> >>  		ctx.body +=3D len;
> >> =20
> >> -		ret =3D -EINVAL;
> >>  		p =3D tok;
> >>  		strsep(&p, "=3D");
> >> -		if (!p || (sscanf(p, "%llu", &val) !=3D 1 && strcmp(p, "max")))
> >> +		if (!p || (sscanf(p, "%llu", &val) !=3D 1 && strcmp(p, "max"))) {
> >> +			ret =3D -EINVAL;
> >>  			goto out_finish;
> >> +		}
> >=20
> > Sorry, I don't like this patch. We know the next error if we encounter =
one
> > will be EINVAL until we change it.
>=20
> Thanks for your constructive feedback.
>=20
>=20
> > Your patch doesn't introduce a functual change and doesn't improve read=
ability,
> > so I don't really see a point for it.
>=20
> We have got different preferences for the placement of error code setting=
s.
Yes we do, so what's the point? Both are OK. Please don't go down that road=
 it
opens so much potential for needless bikeshedding and waste all of our
(including your) time.

Thanks,
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
