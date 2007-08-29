From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Wed, 29 Aug 2007 12:01:36 +0000
Subject: collective project:  identify dead but still documented kernel parms
Message-Id: <Pine.LNX.4.64.0708290749560.12361@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org


  given the two(?) files in the kernel source tree that allegedly
document valid kernel parameters:

  Documentation/kernel-parameters.txt
  Documentation/m68k/kernel-options.txt

it's obvious that there are a number of still-documented parms that
are long deceased.  for example:

  $ grep -rw sg_def_reserved_size *
  Documentation/kernel-parameters.txt:    sg_def_reserved_size=3D   [SCSI]

that suggests pretty clearly that that entry can be tossed from the
Doc file.

  there's a wiki page that i set up a while back for collecting
examples like this:

http://fsdev.net/wiki/index.php?title=DEfunct_kernel_parameters

feel free to ignore the crap on most of that page and, if you want,
just add other examples of dead parms to the first section.  then a
single patch can be sent in to remove all of them at once.

(note:  it may be that the removal of a dead parm represents more than
just deleting a line from one of those files.  if that's the case, you
can expand on that when you add its entry.  no need to be too formal
about it, i can tidy things up later.)

rday
--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://crashcourse.ca
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
