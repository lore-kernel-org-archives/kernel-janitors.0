From: Armin Schindler <armin@melware.de>
Date: Mon, 26 Jul 2004 22:29:25 +0000
Subject: Re: [Kernel-janitors] Re: [PATCH] eicon/platform: replace
Message-Id: <Pine.LNX.4.31.0407270022390.7535-100000@phoenix.one.melware.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============063624064244257816=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.31.0407240810500.21642-100000@phoenix.one.melware.de>
In-Reply-To: <Pine.LNX.4.31.0407240810500.21642-100000@phoenix.one.melware.de>
To: kernel-janitors@vger.kernel.org

--===============063624064244257816==
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Mon, 26 Jul 2004, Randy.Dunlap wrote:
> On Mon, 26 Jul 2004 21:48:33 +0200 (MEST) Armin Schindler wrote:
>
> | On Mon, 26 Jul 2004, Nishanth Aravamudan wrote:
> | > On Sat, Jul 24, 2004 at 08:17:51AM +0200, Armin Schindler wrote:
> | > > On Fri, 23 Jul 2004, Nishanth Aravamudan wrote:
> | > > > I would appreciate any comments from the janitors list.
> | > > >
> | > > > Thanks,
> | > > > Nish
> | > > >
> | > > >
> | > > > Depends-on: Patches to eicon/capifunc, io, mntfunc, os_4bri, os_bri,
> | > > > os_pri, which replace invocations of diva_os_sleep() and diva_os_wait()
> | > > > with msleep() and mdelay() respectively. Will not compile without those
> | > > > patches.
> | > >
> | > > What is the reason for your patches ?
> | > >
> | > > Most of the drivers code is 'common-' code, used in other OSes too.
> | > > So to maintain all of this, wrapper functions like diva_os_*() make it
> | > > easier and I don't like to change that.
> | > >
> | > > If necessary, the inline function itself should be changed, not the main
> | > > code.
> | >
> | > I have made this change specifically. Please find the new patch below.
> | > All of the previous eicon patches can be ignored, then, and just this
> | > one applied.
> |
> | Agreed.
> |
> | I'm not familiar with kernel-janitors, who is going to send your patches
> | to Linus/Andrew ?
>
> The module/subsystem maintainer can elect to merge it on his/her own
> (is that you?)

yes, that would be me.

I can put this onto the queue of the patches after 2.6.8.

Armin




--===============063624064244257816==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============063624064244257816==--
