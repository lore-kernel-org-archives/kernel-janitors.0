From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 04 Nov 2011 17:37:23 +0000
Subject: Re: Fwd: [PATCH 2/4] drivers/staging/vt6656/upc.h: Remove ttype.h
Message-Id: <20111104173723.GI4751@mwanda>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="16qp2B0xu0fRvRD7"
List-Id: <kernel-janitors.vger.kernel.org>
References: <CAGkUK2vW+MJmfisno1m8jpUvfMX3uFrgDy-hKXSHVJW6gatdsw@mail.gmail.com>
In-Reply-To: <CAGkUK2vW+MJmfisno1m8jpUvfMX3uFrgDy-hKXSHVJW6gatdsw@mail.gmail.com>
To: kernel-janitors@vger.kernel.org


--16qp2B0xu0fRvRD7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 04, 2011 at 08:40:30AM -0300, Marcos Souza wrote:
> 2011/11/4, Dan Carpenter <dan.carpenter@oracle.com>:
> > This doesn't apply to my copy of linux-next.  But that could be my
> > fault.  I'm not at my normal network right now, and my copy of
> > linux-next is two weeks old on this computer.  All patches should be
> > written against linux-next.
> >
> > http://git.kernel.org/?p=3Dlinux/kernel/git/next/linux-next.git;a=3Dsum=
mary
> >
> > If you already wrote it against the latest linux-next then ignore me
> > and keep up the good work etc.  :)
> Once, I cloned the linux-next tree. But after one day, my git pull
                                                            ^^^^^^^^
> gives a lot of errors(on that time I don't knew half that I know now
> about the kernel...).
>=20

Don't do a git pull of linux-next.  A git pull is short for:
git fetch git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
git merge FETCH_HEAD

The way to use linux-next is first do a fetch then a checkout:
git fetch git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
git checkout FETCH_HEAD

Longer explanation:

Normally in version control the whole point is to keep the history,
but for linux-next we redo it every day.  So you can't merge today's
history with yesterdays history.  You just take whatever is in
linux-next for today.

So let's say you are Linus and you apply a patch that later on turns
out to be a mistake.  The only thing he can do is apply another
patch on top of the first patch to fix the problem.  Maintainer trees
are more flexible if they find a mistake then they just edit the git
history so it looks like that patch was never applied.  We rebuild
linux next from scratch using the maintainer trees every day and
everyone is happy.  But once the patch hit Linus's tree it's set in
stone and you can't edit the git history anymore.

It's because we edit the history in linux-next that your pull failed.

regards,
dan carpenter


--16qp2B0xu0fRvRD7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJOtCLTAAoJEOnZkXI/YHqRTY8P/2LNKbqy91raJAWyzOoVs5px
8SRWaRAa6w1HKagtNq3cDWA23GWFUL+RARmyNDARwgu0bTsnVj/VJnZ7hqil93wZ
izDlRuAV7sxUhsEQaHg410J/gA282P7LBtGP3bDu42jTUY627sxXci4RVQ06CzZl
cnIdPTAyp35IeTs5dSGb6sAGQK3kgA0zTJniSKM2VpIwWiYIl0JRHFSTe5IWx7RF
Kq74pt9gsdI9/VhA7t1JXeMLZ7AOHjnPFJLrAhhJuLmyhba9j74n40YMP26sHjFw
RLx88FCLKajIWnJazPEesi9WbOIy30MILjGMGW1EYvDiD6d7hrzaa2UeW/x59f0R
clG6Q5CerFRVBeZankei2EyUFDhlq1MUf0/mBQTEW9lId+WgFmAWfMqo0Bf1wZ6z
tRHSsTR8lqBXKx/OX23/PrebEhc5Z9FpY/dY8fKuzBW6ZG7Wenl69RmJtpo6MStQ
raexLxGfHtzYWqNc+NxtWnsca2X2XYJ12ORl7qwcQ3pse+f/QfLRXC3RY6VO4njK
/Ru8RvfIhmxjB7mJ/WKGa7tbcehpgWpOqQRBTLJh3zz7WM0rFAuEI4lRX6Lv+NZe
7itoOnw/gFwGUCuwftQBVf0pyckOlNpA/OaZDWT5dkvEcyRBGnrq9pU1lb8ujDrV
L5DD+78QikTDSYFN4snF
=uOSu
-----END PGP SIGNATURE-----

--16qp2B0xu0fRvRD7--
