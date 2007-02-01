From: "Mehul Jani" <mehul.jani@gmail.com>
Date: Thu, 01 Feb 2007 10:13:51 +0000
Subject: Re: [KJ] the *right* way to do conditional compilation
Message-Id: <cad1dd0a0702010201s69f631c6j969b2c5e0d838a1@mail.gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============1079813045=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0702010435270.11868@CPE00045a9c397f-CM001225dbafb6>
In-Reply-To: <Pine.LNX.4.64.0702010435270.11868@CPE00045a9c397f-CM001225dbafb6>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format...

--===============1079813045==
Content-Type: multipart/alternative;
    boundary="----------=_1170324144-21336-160"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.411 (Entity 5.404)

This is a multi-part message in MIME format...

------------=_1170324144-21336-160
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

>
> a quick note:  most people on this list are already aware of how the
> kernel kbuild structure does conditional compilation of source files
> based on kernel configuration.  e.g., in net/atm/Makefile:
>
> ...
> obj-$(CONFIG_ATM) += atm.o
> ...
>
> so the source file net/atm/atm.o won't be compiled unless the
> config option ATM is selected.  so far, so good.
>
> the *wrong* way to do this is shown in that same directory.  in that
> same Makefile:
>
> ...
> mpoa-objs       := mpc.o mpoa_caches.o mpoa_proc.o
> ...


So instances like above will have to be located and .....



but if you look at the source file mpoa_proc.c, you'll see that its
> *entire* contents are surrounded by
>
> #ifdef CONFIG_PROC_FS
> ...
> #endif /* CONFIG_PROC_FS */
>
> that's just silly.  it would clearly(?) make more sense for the
> Makefile entry to read:


....a sanity check would be required from the *.c files.


obj-$(CONFIG_PROC_FS) += mpoa_proc.o


Hence the correction ???
It would be huge project !!!


or something to that effect, would it not?
>
> are there other examples of this?  i'm betting there are.
>
> rday
>
> --
> ========================================================================
> Robert P. J. Day
> Linux Consulting, Training and Annoying Kernel Pedantry
> Waterloo, Ontario, CANADA
>
> http://www.fsdev.dreamhosters.com/wiki/index.php?title=Main_Page
> ========================================================================
> _______________________________________________
> Kernel-janitors mailing list
> Kernel-janitors@lists.osdl.org
> https://lists.osdl.org/mailman/listinfo/kernel-janitors
>

------------=_1170324144-21336-160
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

<br>
<div>
<blockquote class="gmail_quote" DEFANGED_style="PADDING-LEFT: 1ex; MARGIN: 0px 0px 0px 0.8ex; BORDER-LEFT: #ccc 1px solid"><br>a quick note:&nbsp;&nbsp;most people on this list are already aware of how the<br>kernel kbuild structure does conditional compilation of source files
<br>based on kernel configuration.&nbsp;&nbsp;e.g., in net/atm/Makefile:<br><br>...<br>obj-$(CONFIG_ATM) += atm.o<br>...<br><br>so the source file net/atm/atm.o won&#39;t be compiled unless the<br>config option ATM is selected.&nbsp;&nbsp;so far, so good.
<br><br>the *wrong* way to do this is shown in that same directory.&nbsp;&nbsp;in that<br>same Makefile:<br><br>...<br>mpoa-objs&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; := mpc.o mpoa_caches.o mpoa_proc.o<br>...</blockquote>
<div>&nbsp;</div>
<div><font color="#333333">So instances like above will have to be located and .....</font></div>
<div>&nbsp;</div>
<div>&nbsp;</div><br>
<blockquote class="gmail_quote" DEFANGED_style="PADDING-LEFT: 1ex; MARGIN: 0px 0px 0px 0.8ex; BORDER-LEFT: #ccc 1px solid">but if you look at the source file mpoa_proc.c, you&#39;ll see that its<br>*entire* contents are surrounded by
<br><br>#ifdef CONFIG_PROC_FS<br>...<br>#endif /* CONFIG_PROC_FS */<br><br>that&#39;s just silly.&nbsp;&nbsp;it would clearly(?) make more sense for the<br>Makefile entry to read:</blockquote>
<div>&nbsp;</div>
<div>....a sanity check would be required from the *.c files.</div>
<div>&nbsp;</div><br>
<blockquote class="gmail_quote" DEFANGED_style="PADDING-LEFT: 1ex; MARGIN: 0px 0px 0px 0.8ex; BORDER-LEFT: #ccc 1px solid">obj-$(CONFIG_PROC_FS) += mpoa_proc.o</blockquote>
<div>&nbsp;</div>
<div>Hence the correction ??? </div>
<div>It would be huge project !!!</div>
<div>&nbsp;</div><br>
<blockquote class="gmail_quote" DEFANGED_style="PADDING-LEFT: 1ex; MARGIN: 0px 0px 0px 0.8ex; BORDER-LEFT: #ccc 1px solid">or something to that effect, would it not?<br><br>are there other examples of this?&nbsp;&nbsp;i&#39;m betting there are.
<br><br>rday<br><br>--<br>========================================================================<br>Robert P. J. Day<br>Linux Consulting, Training and Annoying Kernel Pedantry<br>Waterloo, Ontario, CANADA<br><br><a href="http://www.fsdev.dreamhosters.com/wiki/index.php?title=Main_Page">
http://www.fsdev.dreamhosters.com/wiki/index.php?title=Main_Page</a><br>========================================================================<br>_______________________________________________<br>Kernel-janitors mailing list
<br><a href="mailto:Kernel-janitors@lists.osdl.org">Kernel-janitors@lists.osdl.org</a><br><a href="https://lists.osdl.org/mailman/listinfo/kernel-janitors">https://lists.osdl.org/mailman/listinfo/kernel-janitors</a><br></blockquote>
</div><br>

------------=_1170324144-21336-160--

--===============1079813045==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============1079813045==--
