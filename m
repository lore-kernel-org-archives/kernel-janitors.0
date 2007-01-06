From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Sat, 06 Jan 2007 09:07:53 +0000
Subject: Re: [KJ] proper casting (if any) in copy_to_user() calls?
Message-Id: <Pine.LNX.4.64.0701060407470.8690@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="8323328-1045055926-1168074467=:8690"
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0701050850140.1045@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0701050850140.1045@localhost.localdomain>
To: kernel-janitors@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1045055926-1168074467=:8690
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Sat, 6 Jan 2007, Jaco Kroon wrote:

> Ahmed S. Darwish wrote:
> > I've written a patch to remove 30 unneeded copy_to_user casts in
> > the infinband subsystem (drivers/infiniband/core) and the result
> > ?. I got 30 warning from gcc while compiling :(.
> >
> > The reason of the warnings was that the first argument of
> > copy_to_user is unsigned long and not a pointer. so I get the
> > infamous warning:
> >  warning: passing argument 1 of =FF=FFcopy_to_user=FF=FF makes pointer =
from integer
> >  without a cast
> >
> > So Janitors, I think it's better to remove the casts _only_ when
> > the given argument is a pointer and not an unsigned long (why do
> > people use unsigned long and not void* in the beginning anyway ?).
>
> To prevent dereferencing an __user pointer?  But then imho that
> should be standard right through the kernel and copy_(to,from)_user
> should take unsigned long to begin with.

that's a good point.  sadly, i think it's a bit late to make that
suggestion.

rday
--8323328-1045055926-1168074467=:8690
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--8323328-1045055926-1168074467=:8690--
