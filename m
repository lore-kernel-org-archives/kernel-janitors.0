From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Sat, 06 Jan 2007 08:23:34 +0000
Subject: Re: [KJ] proper casting (if any) in copy_to_user() calls?
Message-Id: <Pine.LNX.4.64.0701060319320.8011@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="8323328-198246036-1168071704=:8011"
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0701050850140.1045@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0701050850140.1045@localhost.localdomain>
To: kernel-janitors@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-198246036-1168071704=:8011
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-ID: <Pine.LNX.4.64.0701060322321.8036@localhost.localdomain>

On Sat, 6 Jan 2007, Ahmed S. Darwish wrote:

> On Fri, Jan 05, 2007 at 08:54:28AM -0500, Robert P. J. Day wrote:
> > you'll notice that numerous calls to copy_to_user() insist on casting
> > the pointer type of the first argument, despite the fact that that
> > first pointer is declared as being of type "void __user *" for the
> > routine itself, so it would seem no pointer is casting is required.
> >
> >   and yet, you can see that calls to copy_to_user() are casting the
> > first argument to (among other types) "char *" and "char __user *" and
> > "void *" and "void __user *" and "unsigned long *" and ... well, you
> > get the idea.  (the same can be said for the second argument to
> > copy_from_user().)
> >
> >   what is the proper rule for casting in this situation?  one would
> > think most of those casts are totally superfluous, no?
>
> I've written a patch to remove 30 unneeded copy_to_user casts in the
> infinband subsystem (drivers/infiniband/core) and the result ?. I
> got 30 warning from gcc while compiling :(.
>
> The reason of the warnings was that the first argument of
> copy_to_user is unsigned long and not a pointer. so I get the
> infamous warning:

>  warning: passing argument 1 of =FF=FFcopy_to_user=FF=FF makes pointer fr=
om integer
>  without a cast
>
> So Janitors, I think it's better to remove the casts _only_ when the
> given argument is a pointer and not an unsigned long (why do people
> use unsigned long and not void* in the beginning anyway ?).

whoa, i wasn't suggesting to just *remove* all of those casts.  i was
more interested in establishing a general rule to be used in all of
those cases.  certainly, if a pointer cast is used, it's not
unreasonable to suggest that they be all of the same type (rather than
the current variety).

so what *should* calls to copy_to_user() and copy_from_user() look
like, in general?  and how much of all of that casting is superfluous?
i'm just curious.

rday
--8323328-198246036-1168071704=:8011
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--8323328-198246036-1168071704=:8011--
