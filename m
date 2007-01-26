From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Fri, 26 Jan 2007 11:59:52 +0000
Subject: [KJ] cleaning dead CONFIG variables out of the tree
Message-Id: <Pine.LNX.4.64.0701260649400.22354@CPE00045a9c397f-CM001225dbafb6>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org


  if people want some simple cleanup jobs to work on, you can try
identifying "dead" CONFIG variables, as i've described here:

http://www.fsdev.dreamhosters.com/wiki/index.php?title=DEad_CONFIG_variables

  as an example, if you run that script, you get well over 200
possibilities (some of which quickly turn out to be false positives).
for demonstration purposes, here's the very last one that's printed
out:

=3D=3D=3D=3D=3D ZS =3D=3D=3D=3D=3D
./drivers/tc/Makefile:obj-$(CONFIG_ZS) +=3D zs.o
./drivers/char/decserial.c:#ifdef CONFIG_ZS
./drivers/char/decserial.c:#ifdef CONFIG_ZS
./drivers/char/decserial.c:#ifdef CONFIG_ZS
./drivers/char/decserial.c:#ifdef CONFIG_ZS
./arch/mips/configs/decstation_defconfig:CONFIG_ZS=3Dy
... snip some irrelevant lines ...

so what can you deduce from the above?

  obviously, the config variable CONFIG_ZS is being tested in the
source file drivers/char/decserial.c, and is also used to
conditionally compile the source file drivers/tc/zs.c.  but that
variable is not being set *anywhere*, so clearly none of the above
references to that variable have any effect.

  is that variable "dead"?  i don't know.  if it is, then certainly
you can clean out everything related to it.  so what can you do to
verify deadness here?

  well, you can check the source to see if that clears things up.
maybe google to see if that variable has been listed as officially
deprecated or obsolete.  maybe run "make allyesconfig" to see if,
somehow, it shows up in the .config file (although i don't see how).
or see if there's an official maintainer or the author's email address
in the source file, and send off a short note and ask, among other
things.

  you get the idea.  if you're interested, run the script, skim
through it, pick something that looks interesting and do some
detective work.  and if things work out, submit a patch.

rday

--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://www.fsdev.dreamhosters.com/wiki/index.php?title=3DMain_Page
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
