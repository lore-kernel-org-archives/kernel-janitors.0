From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Sat, 17 Feb 2007 13:58:33 +0000
Subject: Re: [KJ] using "mutexes" in place of semaphores
Message-Id: <Pine.LNX.4.64.0702170856280.24256@CPE00045a9c397f-CM001225dbafb6>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="0-1884884494-1171720713=:24256"
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0702170735460.23474@CPE00045a9c397f-CM001225dbafb6>
In-Reply-To: <Pine.LNX.4.64.0702170735460.23474@CPE00045a9c397f-CM001225dbafb6>
To: kernel-janitors@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--0-1884884494-1171720713=:24256
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Sat, 17 Feb 2007, Arnd Bergmann wrote:

> On Saturday 17 February 2007 13:48, Robert P. J. Day wrote:
> > a quick count shows that there's only a couple dozen instances of
> > calling sema_init() with a count of 1, while there are many more calls
> > of init_MUTEX() in the tree, suggesting that init_MUTEX() really is
> > the preferred standard.
> >
> > =A0 thoughts? =A0is this worth it?
>
> I guess you missed the important point here, which is that we're also
> trying to get rid of the usage of a struct semaphore as a mutex.
>
> Basically, every instance of init_MUTEX() can (and should) be converted
> to using mutex_init() on a struct mutex. Those few places that call
> sema_init with a count of one are probably just a subset of these.
> Similarly, most of the occurences of sema_init(sem, 0) seem to be
> the kind that should be converted to 'struct completion'.

ah, i wasn't aware that there even *was* a "struct mutex" -- i thought
a general semaphore was used for that.  thanks.

rday
--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://fsdev.net/wiki/index.php?title=3DMain_Page
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--0-1884884494-1171720713=:24256
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--0-1884884494-1171720713=:24256--
