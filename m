From: Joe Perches <joe@perches.com>
Date: Sat, 06 Feb 2016 17:20:15 +0000
Subject: Re: [PATCH] checkpatch.pl: fix naked sscanf false positives
Message-Id: <1454779215.21293.4.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160205082952.GA18361@kwern-VirtualBox>
In-Reply-To: <20160205082952.GA18361@kwern-VirtualBox>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

(Robo Bot?, I think he prefers Andy)

On Fri, 2016-02-05 at 22:58 -0800, Kevin Wern wrote:
> On Fri, Feb 5, 2016 at 1:46 AM, Dan Carpenter  wrote:
> > On Fri, Feb 05, 2016 at 12:29:52AM -0800, Kevin Wern wrote:
> > > There is a section of checkpatch.pl that intends to ensure the return
> > > value of sscanf is always checked.=A0=A0However, in certain cases, li=
ke in
> > > drivers/staging/dgnc/dgnc.mod.c
> >=20
> > You shouldn't be running checkpatch.pl on a mod.c file.=A0=A0Those are =
just
> > a build artifact and not code.
> >=20
> > regards,
> > dan carpenter
>=20
> Whoops, guess I'm being a bit of a newb there. Regardless, isn't it still=
 more
> precise to narrow this conditional down to function calls, rather than ju=
st
> the symbol itself?
>=20
> I can eliminate the bad use case from the commit.
>=20
> On Fri, Feb 5, 2016 at 9:26 PM, Joe Perches <joe@perches.com> wrote:
> > On Fri, 2016-02-05 at 00:29 -0800, Kevin Wern wrote:
> > > There is a section of checkpatch.pl that intends to ensure the return
> > > value of sscanf is always checked.=A0=A0However, in certain cases, li=
ke in
> > > drivers/staging/dgnc/dgnc.mod.c, the symbol for sscanf is used without
> > > calling the function:
> > >=20
> > > static const struct modversion_info ____versions[]
> > > __used
> > > __attribute__((section("__versions"))) =3D {
> > > ...
> > > { 0x20c55ae0, __VMLINUX_SYMBOL_STR(sscanf) },
> > > ...
> > > };
> > >=20
> > > This currently results in a warning, which is undesirable. We should
> > > adjust the script's first regex condition to match *calls* to sscanf,
> > > not just the symbol itself.
> > >=20
> > > Signed-off-by: Kevin Wern <kevin.m.wern@gmail.com>
> > > ---
> > > =A0scripts/checkpatch.pl | 2 +-
> > > =A01 file changed, 1 insertion(+), 1 deletion(-)
> > >=20
> > > diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> > > index 0147c91..199247d 100755
> > > --- a/scripts/checkpatch.pl
> > > +++ b/scripts/checkpatch.pl
> > > @@ -5452,7 +5452,7 @@ sub process {
> > > =A0# check for naked sscanf
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0if ($^V && $^V ge 5.10.0 &&
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0defined $stat &&
> > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0$line =3D~ /\bssc=
anf\b/ &&
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0$line =3D~ /\bssc=
anf\b\s*$balanced_parens/ &&
> >=20
> > No, that won't work.=A0=A0That's what the $stat line is for
> >=20
> > I suppose it could be /\bsscanf\s*\(/ though
>=20
> I thought the $stat line's purpose was to ensure a statement was being
> evaluated in the current context. I tested the change with the example
> statement, and it both eliminated the original example and retained the
> ability to recognize unchecked sscanf return values.=A0=A0Although the ex=
ample
> statement is from an artifact that shouldn't be checked by the script, it=
 is
> still a valid example.

It's a single line sscanf vs multi-line sscanf issue

$line works on
	ret =3D sscanf(buf, &foo, &bar);

$stat works on that and
	ret =3D sscanf(buf,
		=A0 =A0 =A0&foo,
		=A0 =A0 =A0&bar);
>=20


--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
