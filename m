From: Miklos Vajna <vmiklos@frugalware.org>
Date: Sun, 19 Dec 2010 02:03:13 +0000
Subject: Re: [PATCH] avoid race condition in pick_next_task_fair in
Message-Id: <20101219020313.GJ31750@genesis.frugalware.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="XbHSybK3LHOYQtWI"
List-Id: <kernel-janitors.vger.kernel.org>
References: <AANLkTin49UHeVhfS-iFwWvPIg29HPhXaP3DorBAa-a0I@mail.gmail.com>
 <1277808215.1868.5.camel@laptop>
In-Reply-To: <1277808215.1868.5.camel@laptop>
To: Peter Zijlstra <peterz@infradead.org>
Cc: shenghui <crosslonelyover@gmail.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, mingo@elte.hu, Greg KH <greg@kroah.com>


--XbHSybK3LHOYQtWI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 29, 2010 at 12:43:35PM +0200, Peter Zijlstra <peterz@infradead.=
org> wrote:
> On Tue, 2010-06-29 at 15:10 +0800, shenghui wrote:
> > I think some lock on the metadata can fix this issue, but we may
> > change plenty of code to add support for lock. I think the easist
> > way is just substacting nr_running before dequing tasks.=20
>=20
> But all that is fully serialized by the rq->lock.. so I'm really not
> seeing how this can happen.

Hi,

Here is a panic I got today:

http://frugalware.org/~vmiklos/pics/bug/2.6.37-rc6.png

More details:

I get this sometimes on boot or shutdown when testing systemd. I did not
get it with sysvinit, so I guess it may be related to systemd's heavy
cgroups usage, but I'm not sure. Sadly it isn't 100% reproducible but I
usually hit it at least once a day.

The config is here:
http://frugalware.org/~vmiklos/logs/2.6.37-rc6.config (I just did a
yes "" | make config to update it to 2.6.37-rc6.)

I got something similar with 2.6.36.1 as well:

http://frugalware.org/~vmiklos/pics/bug/2.6.36.1.png

Ah, and this is on i686 in VMware - though given that I never had this
problem with systemd, I guess it won't be an emulator bug. :)

I'm not familiar with the sched code, is it possible that this is
related?

Thanks,

Miklos

--XbHSybK3LHOYQtWI
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAk0NZ+EACgkQe81tAgORUJZIhwCgo4frOYAEfEX8RWWxIUrKFtZK
XTEAniwYuFB7UsKLSSgtKUAaqJkRzqi0
=XIDa
-----END PGP SIGNATURE-----

--XbHSybK3LHOYQtWI--
