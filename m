From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Mon, 02 Jul 2007 10:11:18 +0000
Subject: [KJ] update:  dead doc files and dead features
Message-Id: <Pine.LNX.4.64.0707020606150.29616@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org


  after a bit of thought (and more coffee), i decided that we needed
two categories of "dead" stuff:

1) strictly dead Doc files, for which there is absolutely nothing else
related in the tree:

  http://fsdev.net/wiki/index.php?title=DEad_Documentation_files

2) dead "features", for which the removal might involve the deletion
of a bunch of "stuff" in the tree:

  http://fsdev.net/wiki/index.php?title=DEad_features

you can see that, at that second page, i added a first example of
"digiepca", whose removal would involve tossing a source file and a
Kconfig entry and some documentation, etc.

  the above distinction seems to make more sense than my earlier
posting.

rday

p.s.  that whole wiki is getting a bit out of hand, and i'm going to
put some work into cleaning it up totally one of these days.

--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://fsdev.net/wiki/index.php?title=3DMain_Page
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
