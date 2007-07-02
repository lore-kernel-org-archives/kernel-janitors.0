From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Mon, 02 Jul 2007 09:47:58 +0000
Subject: Re: [KJ] another KJ project: identifying worthless Documentation/
Message-Id: <Pine.LNX.4.64.0707020546530.28776@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0707020534150.28225@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0707020534150.28225@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On Mon, 2 Jul 2007, Jesper Juhl wrote:

> On 02/07/07, Robert P. J. Day <rpjday@mindspring.com> wrote:
> >
> >   it's fairly obvious that there's content under the Documentation/
> > directory that is way obsolete, so i've started another wiki page to
> > keep track of stuff that appears to be removable in its entirety:
> >
> >   http://fsdev.net/wiki/index.php?title=DEad_Documentation_files
> >
> >   as a first example, i've added "crypto/descore-readme.txt", which
> > certainly appears to have no value, but maybe i just didn't look hard
> > enough.
> >
> >   anyway, you get the idea -- feel free to add more content to that
> > page and we can eventually submit a patch to get rid of it all at
> > once.

> Since different people wrote the different documents and the
> different documents touch on different subjects, I'd say it would be
> better to remove them one at a time - one document removed per
> patch. That way it's easier to Cc the patch to the relevant people
> who can comment on it.

good point, of course.  so let's just start the list and, at some
point, someone can start working their way through it one at a time.

rday
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
