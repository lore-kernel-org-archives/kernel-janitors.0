From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Mon, 28 May 2007 19:13:21 +0000
Subject: Re: [KJ] replacing old-style "non-seekable" errors with "no_llseek"
Message-Id: <Pine.LNX.4.64.0705281505340.14889@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="8323328-1305901846-1180379601=:14889"
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0705271722580.13051@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0705271722580.13051@localhost.localdomain>
To: kernel-janitors@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1305901846-1180379601=:14889
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Mon, 28 May 2007, Arnd Bergmann wrote:

> On Sunday 27 May 2007, Robert P. J. Day wrote:
> > can be rewritten more cleanly using the no_llseek() helper routine,
> > and just assigning no_llseek to the llseek member of the
> > file_operations struct, as in:
> >
> > =A0 =A0 .llseek =3D no_llseek
> >
> > and deleting the old routine. =A0am i reading that correctly? =A0or is
> > there more to it than that?
>
> Actually, that is outdated as well.
>
> If the file descriptor cannot be seeked, you should set the open
> operation to nonseekable_open, or call that function from the
> driver's own open function.

  ok, after poking around in the code and submitting a few cleanup
patches, i want to make sure i'm doing this correctly.  once the
open() routine for a device invokes nonseekable_open(), does that mean
that *all* of those old-style tests for seekability can be removed?

  first, it seems obvious that declaring bogus llseek methods like
this can be deleted:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
loff_t my_llseek(...)
{
	return -ESPIPE;  /* Not seekable. */
}
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D

  next, there were explicit tests in the device read() and write()
methods that checked if pread() or pwrite() had been invoked:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
...
if (ppos !=3D &filp->f_pos)
    return -ESPIPE;
}
...
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D

as i read it, those can also be removed.  and, finally, i notice a few
read() (and perhaps write()) implementations that contain the check:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
...
if (*ppos)
    return -ESPIPE;
...
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D

  that appears to simply be checking if you're trying to read from
anywhere but the beginning of the file.  is that also covered under
the nonseekable_open() call?  what exactly does that test represent?
should it be removed once nonseekable_open() is being invoked?

  thanks for any clarification.

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
--8323328-1305901846-1180379601=:14889
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
--8323328-1305901846-1180379601=:14889--
