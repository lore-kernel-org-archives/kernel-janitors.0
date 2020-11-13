From: Luis Chamberlain <mcgrof@kernel.org>
Date: Fri, 13 Nov 2020 14:17:02 +0000
Subject: Re: [PATCH] sysctl: move local variable in proc_do_large_bitmap() to proper scope
Message-Id: <20201113141702.GI4332@42.do-not-panic.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201109071107.22560-1-lukas.bulwahn@gmail.com>
 <e0cf83dc-2978-70ce-aeb2-37873cc81c03@redhat.com>
In-Reply-To: <e0cf83dc-2978-70ce-aeb2-37873cc81c03@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Tom Rix <trix@redhat.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>, Kees Cook <keescook@chromium.org>, Iurii Zaikin <yzaikin@google.com>, linux-fsdevel@vger.kernel.org, Nathan Chancellor <natechancellor@gmail.com>, Nick Desaulniers <ndesaulniers@google.com>, clang-built-linux@googlegroups.com, kernel-janitors@vger.kernel.org, linux-safety@lists.elisa.tech, linux-kernel@vger.kernel.org

On Mon, Nov 09, 2020 at 05:26:37PM -0800, Tom Rix wrote:
>=20
> On 11/8/20 11:11 PM, Lukas Bulwahn wrote:
> > make clang-analyzer caught my attention with:
> >
> >   kernel/sysctl.c:1511:4: warning: Value stored to 'first' is never rea=
d \
> >   [clang-analyzer-deadcode.DeadStores]
> >                           first =3D 0;
> >                           ^
> >
> > Commit 9f977fb7ae9d ("sysctl: add proc_do_large_bitmap") introduced
> > proc_do_large_bitmap(), where the variable first is only effectively us=
ed
> > when write is false; when write is true, the variable first is only use=
d in
> > a dead assignment.
> >
> > So, simply remove this dead assignment and put the variable in local sc=
ope.
> >
> > As compilers will detect this unneeded assignment and optimize this any=
way,
> > the resulting object code is identical before and after this change.
> >
> > No functional change. No change to object code.
> >
> > Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> > ---
> > applies cleanly on v5.10-rc3 and next-20201106
> >
> > Luis, Kees, Iurii, please pick this minor non-urgent clean-up patch.
> >
> >  kernel/sysctl.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/kernel/sysctl.c b/kernel/sysctl.c
> > index ce75c67572b9..cc274a431d91 100644
> > --- a/kernel/sysctl.c
> > +++ b/kernel/sysctl.c
> > @@ -1423,7 +1423,6 @@ int proc_do_large_bitmap(struct ctl_table *table,=
 int write,
> >  			 void *buffer, size_t *lenp, loff_t *ppos)
> >  {
> >  	int err =3D 0;
> > -	bool first =3D 1;
> >  	size_t left =3D *lenp;
> >  	unsigned long bitmap_len =3D table->maxlen;
> >  	unsigned long *bitmap =3D *(unsigned long **) table->data;
> > @@ -1508,12 +1507,12 @@ int proc_do_large_bitmap(struct ctl_table *tabl=
e, int write,
> >  			}
> > =20
> >  			bitmap_set(tmp_bitmap, val_a, val_b - val_a + 1);
> > -			first =3D 0;
> >  			proc_skip_char(&p, &left, '\n');
> >  		}
> >  		left +=3D skipped;
> >  	} else {
> >  		unsigned long bit_a, bit_b =3D 0;
> > +		bool first =3D 1;
>=20
> This looks fine, but while you are here how about setting, to match the t=
ype
>=20
> first =3D true
>=20
> And then only clearing first once
>=20
> if (!first) =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0
> =A0 proc_put_char(&buffer, &left, ',');
>=20
> else
>=20
> =A0 first =3D false
>=20
> Instead of at every loop iteraction

Thanks for your patch Lukas!

Agreed, please resend with that change as requested by Tom. And also
please add Andrew Morton <akpm@linux-foundation.org> to your To address.

  Luis
