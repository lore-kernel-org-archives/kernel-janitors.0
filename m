From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Wed, 24 Jan 2007 23:48:11 +0000
Subject: Re: [KJ] script to flag "dead" CONFIG variables
Message-Id: <Pine.LNX.4.64.0701241843010.25693@CPE00045a9c397f-CM001225dbafb6>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0701240736110.7569@CPE00045a9c397f-CM001225dbafb6>
In-Reply-To: <Pine.LNX.4.64.0701240736110.7569@CPE00045a9c397f-CM001225dbafb6>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On Thu, 25 Jan 2007, Alexey Dobriyan wrote:

> On Wed, Jan 24, 2007 at 07:36:54AM -0500, Robert P. J. Day wrote:
> >   it's all written up here:
> >
> > http://www.fsdev.dreamhosters.com/wiki/index.php?title=DEad_CONFIG_vari=
ables
>
> That's a good script.
>
> There is another failure mode: CONFIG_FOO is defined, all right, but
> code tests for FOO. ARCH_HAS_ILOG2_U32 and _U64, haven't seen more.

hmmmmmm ... that could be trickier since, if you see code testing for
FOO, maybe it's the case that it really *should* be testing for FOO
(which isn't defined anywhere), and the fact that some Kconfig file
defines CONFIG_FOO is a complete coincidence.  stranger things have
happened, but i suspect i can add some kind of check for that.

also, based on what i saw in some early runs, am i right in assuming
that, if you select the kernel feature FUBAR to be built as a module,
that will define the macro CONFIG_FUBAR_MODULE as opposed to just
CONFIG_FUBAR?  that's the assumption i was making, and i can probably
clean up that script a bit more.

rday

p.s.  if that MODULE assumption is correct, where in the configuration
process does that macro get defined that way?  i'm just curious.

--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://www.fsdev.dreamhosters.com/wiki/index.php?title=3DKernel_Janitor%27s=
_Todo_List
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
