From: Namhyung Kim <namhyung@gmail.com>
Date: Tue, 03 Aug 2010 13:00:45 +0000
Subject: Re: [PATCH 2/2] kprobes: verify jprobe entry point
Message-Id: <1280840445.1677.7.camel@leonhard>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1280820323-18929-2-git-send-email-namhyung@gmail.com>
In-Reply-To: <1280820323-18929-2-git-send-email-namhyung@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

2010-08-03 (=ED=99=94), 20:27 +0900, Masami Hiramatsu:
> Namhyung Kim wrote:
> > verify jprobe's entry point is a function entry point
> > using kallsyms' offset value.
> >=20
> > Signed-off-by: Namhyung Kim <namhyung@gmail.com>
> >=20
> > diff --git a/kernel/kprobes.c b/kernel/kprobes.c
> > index 8f96701..c7295f9 100644
> > --- a/kernel/kprobes.c
> > +++ b/kernel/kprobes.c
> > @@ -1334,19 +1334,25 @@ unsigned long __weak arch_deref_entry_point(voi=
d *entry)
> >  int __kprobes register_jprobes(struct jprobe **jps, int num)
> >  {
> >  	struct jprobe *jp;
> > -	int ret =3D 0, i;
> > +	int ret =3D -EINVAL, i;
> > =20
> >  	if (num <=3D 0)
> > -		return -EINVAL;
> > +		return ret;
> >  	for (i =3D 0; i < num; i++) {
> >  		unsigned long addr;
> > +		unsigned long size, offset;
> > +		char namebuf[KSYM_NAME_LEN];
> > +
>=20
> You need to re-initialize "ret" in each iteration,
> or "ret" will be 0 except for the 1st iteration.
>=20
> >  		jp =3D jps[i];
> >  		addr =3D arch_deref_entry_point(jp->entry);
> > =20
> > -		/* Todo: Verify probepoint is a function entry point */
> > -		jp->kp.pre_handler =3D setjmp_pre_handler;
> > -		jp->kp.break_handler =3D longjmp_break_handler;
> > -		ret =3D register_kprobe(&jp->kp);
> > +		/* Verify probepoint is a function entry point */
> > +		if (kallsyms_lookup(addr, &size, &offset, NULL, namebuf) &&
> > +		    offset =3D 0) {
> > +			jp->kp.pre_handler =3D setjmp_pre_handler;
> > +			jp->kp.break_handler =3D longjmp_break_handler;
> > +			ret =3D register_kprobe(&jp->kp);
>=20
> 		because, this line assigns 0 to ret if no error.
>=20
> > +		}
>=20
> I think here is a good point to do that. (in else block)
>=20
> > =20
> >  		if (ret < 0) {
> >  			if (i > 0)
>=20
> Thank you,

Thanks for reviewing.
I'll resend the fix soon after.


--=20
Regards,
Namhyung Kim


--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
