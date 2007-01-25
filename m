From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Thu, 25 Jan 2007 08:06:39 +0000
Subject: Re: [KJ] script to flag "dead" CONFIG variables
Message-Id: <Pine.LNX.4.64.0701250258250.32520@CPE00045a9c397f-CM001225dbafb6>
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

i just uploaded a slightly cleaned-up version to the wiki page.  when
i wrote it, i was guessing i might find a couple dozen variables or
so, and i could do a little cleanup in my spare time to fix them.

at the moment, i get 347 hits, and there's no way i'm going to touch
*that* kind of job.  better if individual subsystem maintainers run
that script on their own stuff and deal with the output, methinks.

rday

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
