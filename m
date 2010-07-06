From: Nicolas Palix <npalix@diku.dk>
Date: Tue, 06 Jul 2010 08:28:59 +0000
Subject: Re: Keeping up to date with the upstream
Message-Id: <201007061029.00055.npalix@diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1278362590.5396.35.camel@dermezel>
In-Reply-To: <1278362590.5396.35.camel@dermezel>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On Monday 05 July 2010 23:44:18 Joe Eloff wrote:
> On Mon, 2010-07-05 at 23:37 +0200, Peter H=C3=BCwe wrote:
> > Am Montag 05 Juli 2010 23:11:22 schrieben Sie:
> > > So if I understand you correctly should finish my patching first on my
> > > current branch then checkout master and git reset --hard origin and do
> > > clean up then go on with something else as obviously those patches wi=
ll
> > > not be in and the work I have done is now the patch.
> > >=20
> > > And then from now on just make patches on the master and not worry ab=
out
> > > branches since I will keep up to date with the upstream anyway, must
> > > just make sure I have created my patches before syncing the upstream =
as
> > > to not loose the work I have done.
> >=20
> >=20
> > That's at least how I handle the linux-next tree for my buildfailure fi=
xes.
> > I'm not sure if it is the 'correct' way, however it works quite well fo=
r me.
> >=20
> > The advantages are that your patch is always up to date with upstream -=
 since=20
> > you're usually less than one day behind.
> >=20
> > The drawback is that you lose your changes with each --reset -- however=
 when=20
> > you create a patch with git format-patch you have a copy of your change=
s=20
> > always at hand - and you can perhaps reapply them.
> >=20
> > Peter
> >=20
> >=20
> Agree, it will work well and yes you have all your patches on hand so
> can't see any problem with this you can always just re-apply if need be.
>=20
> 'Correct' I guess is what works well for you and I can't see why this
> approach won't work well, seems pretty logical and is the way I am going
> to use.
>=20
> Thanks for this info was exactly what I wanted!

In the end, I think you are *manually* rebasing your work on top of the
daily released linux-next.

I think most of the time, you can to it automatically with git rebase
after a git remote update instead of reset + pull.



>=20
> Joe
>=20
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors=
" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20

--=20
Nicolas Palix
Tel: (+33) 1 44 27 87 25
Tel: (+33) 6 81 07 91 72
Web: http://www.diku.dk/~npalix/
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
