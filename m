From: Arnaldo Carvalho de Melo <acme@conectiva.com.br>
Date: Sun, 18 Jan 2004 08:51:55 +0000
Subject: [Kernel-janitors] [akpm@osdl.org: Re: 2.6.1-mm4]
Message-Id: <20040118085155.GF3461@conectiva.com.br>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

This is something interesting to have in the TODO list... It requires a
new gcc version to test tho. Andrew was using a cvs snapshot gcc, perhaps
this started happening from 2.6 on, notice that one has to compile _and_
try to load the m=F3dule.

Patterns, perhaps this happens elsewhere... :)

- Arnaldo

----- Forwarded message from Andrew Morton <akpm@osdl.org> -----

Date: Sun, 18 Jan 2004 00:17:08 -0800
From: Andrew Morton <akpm@osdl.org>
Subject: Re: 2.6.1-mm4
To: "J.A. Magallon" <jamagallon@able.es>
Cc: linux-kernel@vger.kernel.org, netdev@oss.sgi.com
X-Mailer: Sylpheed version 0.9.4 (GTK+ 1.2.10; i686-pc-linux-gnu)

"J.A. Magallon" <jamagallon@able.es> wrote:
>
>=20
> On 01.18, Andrew Morton wrote:
> > "J.A. Magallon" <jamagallon@able.es> wrote:
> > >
> > > On 01.16, Andrew Morton wrote:
> > >  >=20
> > >  > ftp://ftp.kernel.org/pub/linux/kernel/people/akpm/patches/2.6/2.6.=
1/2.6.1-mm4/
> > >  >=20
> > >  >=20
> > >=20
> > >  Net driver problem:
> > >=20
> > >  werewolf:/etc# modprobe --verbose 3c59x
> > >  insmod /lib/modules/2.6.1-jam4/kernel/drivers/net/3c59x.ko=20
> > >  FATAL: Error inserting 3c59x (/lib/modules/2.6.1-jam4/kernel/drivers=
/net/3c59x.ko): Invalid argument
> >=20
> > hmm, cute.
> >=20
>=20
> Yes.
> It worked.=20
> I thought of this, but why this and not the other parameters ? Compiler b=
ug ?

Presumably, recent gcc's remove the variable altogether and just expand the
constant inline.  When the central module code checks for the parameter's
existence in the module's symbol table it errors out.


----- End forwarded message -----

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
