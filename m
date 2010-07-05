From: Joe Eloff <kagen101@gmail.com>
Date: Mon, 05 Jul 2010 21:11:22 +0000
Subject: Re: Keeping up to date with the upstream
Message-Id: <1278364282.5396.50.camel@dermezel>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1278362590.5396.35.camel@dermezel>
In-Reply-To: <1278362590.5396.35.camel@dermezel>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

=20
On Mon, 2010-07-05 at 22:52 +0200, Peter H=C3=BCwe wrote:
> Am Montag 05 Juli 2010 22:43:10 schrieb Joe Eloff:
> > Hi
> >=20
> > Just need clarification on this procedure:
> >=20
> > What to do when git fetch origin tells you origin/master has diverged f=
rom
> >  your local master and you are working on a branch making patches?
> >=20
> > A link or search words will be fine will do reading myself.
>=20
>=20
> Hi Joe,
>=20
> quite often a simple=20
> git merge master
> should do the job
>=20
> git fetch + git merge =3D git pull
> --> So you should perhaps try git pull instead.
>=20
> However on trees that get rebased quite often (e.g. linux-next) the merge=
 may=20
> fail.
>=20
> With linux next I simply do something like
> git fetch=20
> git reset --hard origin
> on the master branch and not using any branches at all.
>=20
> But this is only a good approach if you start working on a patch - otherw=
ise=20
> you'd lose your changes.
> But as a janitor you usually don't do large (multiple workday) patches so=
 this=20
> might work for you too.
> git fetch
> git reset --hard origin
> #start working
> #when finished
> git commit -a
> git format-patch -s origin
>=20
> --> Your (hopefully) ready to send patch is created.
>=20
> Works fine for me, for janitorial tasks.
>=20
> Thanks,
> Peter
>=20
Hi Peter,

Thanks for the reply, use git as primary repo system for all projects I
work on so am pretty familiar with what the commands do, was just not
sure in this environment and just wanted to make sure I don't mess up.

I saw there where conflicts when I tried to merge origin/master so that
was not going to work like you said working on linux-next that gets
rebased quite often that might not work.

So if I understand you correctly should finish my patching first on my
current branch then checkout master and git reset --hard origin and do
clean up then go on with something else as obviously those patches will
not be in and the work I have done is now the patch.

And then from now on just make patches on the master and not worry about
branches since I will keep up to date with the upstream anyway, must
just make sure I have created my patches before syncing the upstream as
to not loose the work I have done.

Gotchya, =20

Regards,

Joe



--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
