From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Wed, 23 May 2007 08:18:37 +0000
Subject: Re: [KJ] [PATCH] potential parse error in ifdef
Message-Id: <Pine.LNX.4.64.0705230415540.21775@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="8323328-164181347-1179908317=:21775"
List-Id: <kernel-janitors.vger.kernel.org>
References: <87fy5q5dxr.fsf@wanadoo.fr>
In-Reply-To: <87fy5q5dxr.fsf@wanadoo.fr>
To: kernel-janitors@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-164181347-1179908317=:21775
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Wed, 23 May 2007, Yoann Padioleau wrote:

> "H=E5kon L=F8vdal" <hlovdal@gmail.com> writes:
>
> > On 21/05/07, Matthew Wilcox <matthew@wil.cx> wrote:
> >> On Mon, May 21, 2007 at 06:39:12PM +0200, Yoann Padioleau wrote:
> >> > I have made a tool to parse the kernel that does not pre-process the
> >> > source. That means that my parser tries to parse all the code, inclu=
ding
> >> > code in the #else branch or code that is not often compiled because
> >> > the driver is not very used (or not used at all). So, my parser
> >> > sometimes reports parse error not originally detected by gcc.
> >> > Here is my (first) patch.
> >>
> >> These all look good to me.
> >
> > But one question. His tool has found some code segments
> > that obviously never have been compiled
>
> I think so
>
> > and most likely are
> > not included in the kernel in any way (because otherwise
> > I would assume that allyesconfig would have caught them).
>
> Allyesconfig does not compile everything. It does not compile for
> example source code for other architectures, nor drivers made for
> other architectures and it does not try all the ifdef combinaisons.

i wrote a script that did something sort of like this a while back.
after a build with "allyesconfig", the script scanned for all source
files for which a corresponding object file wasn't generated.

needless to say, there were *lots* of those since some source files
represent a choice among several possibilities, while there were
entire subdirectories that weren't compiled for that very reason above
-- they were for a different arch.

but digging into the output, i did find a few cases where some source
files were simply not part of the build process anymore, and submitted
patches to have them removed.

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
--8323328-164181347-1179908317=:21775
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
--8323328-164181347-1179908317=:21775--
