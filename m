From: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Wed, 08 Jul 2009 11:50:52 +0000
Subject: Re: [PATCH] vlynq: remove duplicated #include
Message-Id: <alpine.LFD.2.00.0907080750100.23552@localhost>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="8323328-1840098635-1247053852=:23552"
List-Id: <kernel-janitors.vger.kernel.org>
References: <200907072336.14767.florian@openwrt.org> <154e089b0907071654o46145717h17ac558aa4d524e0@mail.gmail.com> <200907080840.44451.florian@openwrt.org>
In-Reply-To: <200907080840.44451.florian@openwrt.org>
To: Florian Fainelli <florian@openwrt.org>
Cc: Hannes Eder <hannes@hanneseder.net>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Huang Weiyi <weiyi.huang@gmail.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1840098635-1247053852=:23552
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 8 Jul 2009, Florian Fainelli wrote:

> Hi Hannes,
>
> Le Wednesday 08 July 2009 01:54:14 Hannes Eder, vous avez =C3=A9crit=C2=
=A0:
> > On Tue, Jul 7, 2009 at 23:36, Florian Fainelli<florian@openwrt.org> wro=
te:
> > > Remove duplicated #include('s) in drivers/vlynq/vlynq.c
> >
> > The following little script catches more of these issues, though it
> > might be a bit fragile:
> >
> > #!/bin/bash
> > find . -name "*.c" | \
> > while read file; do
> >     dblinc=3D$(grep "^#include <" $file | sort | uniq -c | grep -v "^  =
    1
> > ") [ "$dblinc" !=3D "" ] && echo $file: $dblinc
> > done
> >
> > when ran from the linux-2.6 src tree, the output is something like
> > (lines starting with '#' are my annotations):
> >
> > ./mm/slab.c: 3 #include <linux/kmalloc_sizes.h>
> > # this is a false positive
> > ./mm/slqb.c: 2 #include <linux/seq_file.h>
> > # I did not look a this one
> > ./mm/shmem.c: 2 #include <linux/vfs.h>
> > # this is a hit
> > # the rest (about 50 hits) skipped
> >
> > Do you want to investigate this issues?
>
> I will not, at least not now, but Huang (CC'd) might be interested.

  isn't "make includecheck" supposed to identify duplicated includes?
why aren't you using that?

rday
--

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Robert P. J. Day                               Waterloo, Ontario, CANADA

        Linux Consulting, Training and Annoying Kernel Pedantry.

Web page:                                          http://crashcourse.ca
Linked In:                             http://www.linkedin.com/in/rpjday
Twitter:                                       http://twitter.com/rpjday
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--8323328-1840098635-1247053852=:23552--
