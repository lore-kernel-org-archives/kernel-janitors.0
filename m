From: "surendra singh  bisht" <ssb_ait@rediffmail.com>
Date: Tue, 25 Jan 2005 14:06:15 +0000
Subject: [KJ] process group problem
Message-Id: <20050125140615.7125.qmail@webmail8.rediffmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============50385898052212985=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format...

--===============50385898052212985==
Content-Type: multipart/alternative;
    boundary="----------=_1106662006-7582-376"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.411 (Entity 5.404)

This is a multi-part message in MIME format...

------------=_1106662006-7582-376
Content-type: text/plain;
	charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

 =A0

    hi,
=20=20=20
       it is known that child inherit the process group ID of its   parent =
then, why the process run by the shell do not inherit its
(shell) process group ID??=20

       suppose process p1 is run from the shell and it forks process p2 the=
n p2 inherit process group of p1 but p1 doesn't inherit the proces group of=
 shell....( can be seen by command ps -xj )

       even i'm doing it in kernel < copy_process() in  fork.c   >

           like p->pgrp =3D p->parent->pgrp=20
          (p is task structure of child process)

    it is not working, why is it so..??

    any idea....

   surendra singh bisht
------------=_1106662006-7582-376
Content-type: text/html;
	charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

<P>
&nbsp; <BR>
<BR>
&nbsp; &nbsp; hi,<BR>
&nbsp;  <BR>
&nbsp; &nbsp; &nbsp;  it is known that child inherit the process group ID o=
f its&nbsp;  parent then, why the process run by the shell do not inherit i=
ts<BR>
(shell) process group ID?? <BR>
<BR>
&nbsp; &nbsp; &nbsp;  suppose process p1 is run from the shell and it forks=
 process p2 then p2 inherit process group of p1 but p1 doesn't inherit the =
proces group of shell....( can be seen by command ps -xj )<BR>
<BR>
&nbsp; &nbsp; &nbsp;  even i'm doing it in kernel &lt; copy_process() in&nb=
sp; fork.c&nbsp;  &gt;<BR>
<BR>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  like p-&gt;pgrp =3D p-&gt;parent-&gt;pg=
rp <BR>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; (p is task structure of child process)<B=
R>
<BR>
&nbsp; &nbsp; it is not working, why is it so..??<BR>
<BR>
&nbsp; &nbsp; any idea....<BR>
<BR>
&nbsp;  surendra singh bisht
</P>
<br><br>
<A target=3D"_blank" HREF=3D"http://clients.rediff.com/signature/track_sig.=
asp"><IMG DEFANGED_SRC=3D"http://ads.rediff.com/RealMedia/ads/adstream_nx.c=
gi/www.rediffmail.com/inbox.htm@Bottom" BORDER=3D0 VSPACE=3D0 HSPACE=3D0></=
a>

------------=_1106662006-7582-376--

--===============50385898052212985==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============50385898052212985==--
