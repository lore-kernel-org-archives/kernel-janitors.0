From: "Mehul Jani" <mehul.jani@gmail.com>
Date: Thu, 01 Feb 2007 11:39:44 +0000
Subject: Re: [KJ] the *right* way to do conditional compilation
Message-Id: <cad1dd0a0702010327w774654bja19efffb1aba23ca@mail.gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============0340470975=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0702010435270.11868@CPE00045a9c397f-CM001225dbafb6>
In-Reply-To: <Pine.LNX.4.64.0702010435270.11868@CPE00045a9c397f-CM001225dbafb6>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format...

--===============0340470975==
Content-Type: multipart/alternative;
    boundary="----------=_1170329365-21336-416"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.411 (Entity 5.404)

This is a multi-part message in MIME format...

------------=_1170329365-21336-416
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

>
> > > a quick note:  most people on this list are already aware of how the
> > > kernel kbuild structure does conditional compilation of source files
> > > based on kernel configuration.  e.g., in net/atm/Makefile:
> > >
> > > ...
> > > obj-$(CONFIG_ATM) += atm.o
> > > ...
> > >
> > > so the source file net/atm/atm.o won't be compiled unless the
> > > config option ATM is selected.  so far, so good.
> > >
> > > the *wrong* way to do this is shown in that same directory.  in that
> > > same Makefile:
> > >
> > > ...
> > > mpoa-objs       := mpc.o mpoa_caches.o mpoa_proc.o
> > > ...
> >
> >
> > So instances like above will have to be located and .....
>
> actually, i just ran a quick script and i found only four files that
> seem to be like this, so it's not that big a deal after all:
>
> net/atm/mpoa_proc.c
> arch/mips/gt64120/momenco_ocelot/dbg_io.c
> arch/mips/momentum/ocelot_c/dbg_io.c
> arch/mips/momentum/ocelot_g/dbg_io.c
>
> should still be cleaned up, though.


Cool!!! If its not too much in heat ,let me know the kernel version you are
using. I will put forward a patch for it. Else it your baby!!!

Hope you are not making changes to dead CONFIG variables ;-) Jst to remind
you.


rday
>
> --
> ========================================================================
> Robert P. J. Day
> Linux Consulting, Training and Annoying Kernel Pedantry
> Waterloo, Ontario, CANADA
>
> http://www.fsdev.dreamhosters.com/wiki/index.php?title=Main_Page
> ========================================================================
>

------------=_1170329365-21336-416
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

<div>
<blockquote class="gmail_quote" DEFANGED_style="PADDING-LEFT: 1ex; MARGIN: 0px 0px 0px 0.8ex; BORDER-LEFT: #ccc 1px solid">&gt; &gt; a quick note:&nbsp;&nbsp;most people on this list are already aware of how the<br>&gt; &gt; kernel kbuild structure does conditional compilation of source files
<br>&gt; &gt; based on kernel configuration.&nbsp;&nbsp;e.g., in net/atm/Makefile:<br>&gt; &gt;<br>&gt; &gt; ...<br>&gt; &gt; obj-$(CONFIG_ATM) += atm.o<br>&gt; &gt; ...<br>&gt; &gt;<br>&gt; &gt; so the source file net/atm/atm.o won&#39;t be compiled unless the
<br>&gt; &gt; config option ATM is selected.&nbsp;&nbsp;so far, so good.<br>&gt; &gt;<br>&gt; &gt; the *wrong* way to do this is shown in that same directory.&nbsp;&nbsp;in that<br>&gt; &gt; same Makefile:<br>&gt; &gt;<br>&gt; &gt; ...<br>&gt; &gt; mpoa-objs&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; := 
mpc.o mpoa_caches.o mpoa_proc.o<br>&gt; &gt; ...<br>&gt;<br>&gt;<br>&gt; So instances like above will have to be located and .....<br><br>actually, i just ran a quick script and i found only four files that<br>seem to be like this, so it&#39;s not that big a deal after all:
<br><br>net/atm/mpoa_proc.c<br>arch/mips/gt64120/momenco_ocelot/dbg_io.c<br>arch/mips/momentum/ocelot_c/dbg_io.c<br>arch/mips/momentum/ocelot_g/dbg_io.c<br><br>should still be cleaned up, though.</blockquote>
<div>&nbsp;</div>
<div>Cool!!! If its not too much in heat ,let me know the kernel version you are using. I will put forward a patch for it. Else it your baby!!!</div>
<div>&nbsp;</div>
<div>Hope you are not making changes to dead CONFIG variables ;-) Jst to remind you.</div>
<div>&nbsp;</div><br>
<blockquote class="gmail_quote" DEFANGED_style="PADDING-LEFT: 1ex; MARGIN: 0px 0px 0px 0.8ex; BORDER-LEFT: #ccc 1px solid">rday<br><br>--<br>========================================================================<br>Robert P. J. Day
<br>Linux Consulting, Training and Annoying Kernel Pedantry<br>Waterloo, Ontario, CANADA<br><br><a href="http://www.fsdev.dreamhosters.com/wiki/index.php?title=Main_Page">http://www.fsdev.dreamhosters.com/wiki/index.php?title=Main_Page
</a><br>========================================================================<br></blockquote></div><br>

------------=_1170329365-21336-416--

--===============0340470975==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============0340470975==--
