From: maximilian attems <janitor@sternwelten.at>
Date: Wed, 21 Jan 2004 16:43:32 +0000
Subject: Re: [Kernel-janitors] [announce] new KJ web hosting
Message-Id: <20040121164331.GA1498@mail.sternwelten.at>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============92430990165321214=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040111193612.2b4445fc.rddunlap@osdl.org>
In-Reply-To: <20040111193612.2b4445fc.rddunlap@osdl.org>
To: kernel-janitors@vger.kernel.org


--===============92430990165321214==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="OgqxwSJOaUobr8KG"
Content-Disposition: inline


--OgqxwSJOaUobr8KG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, 19 Jan 2004, Randy.Dunlap wrote:

> Applied, and thanks.

thank you!
some time latter the frontside should=20
be changed in xhtml using css positioning.


same story for driver-dosdonts/index.html
belows patch make this doc valid html,
tell me if you prefer extern css,
but i think here it's not necessary,
because of minimal use.

* adds document declaration 4.01 strict
* adds header style info
* removes all font tags
* removes all superfluous align=3D"left"
* changes align=3D"center" in css=20
* changes &LT; &GT; in &lt; &gt;

tested on mozilla 1.5 and lynx, no critical html stuff in there.

a++ maks


--- kernel-janitor/drivers-dosdonts/index.html	2004-01-21 15:51:56.00000000=
0 +0100
+++ kernel-janitor-maks/drivers-dosdonts/index.html	2004-01-21 17:35:00.000=
000000 +0100
@@ -1,56 +1,61 @@
+<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/ht=
=3Dml4/strict.dtd">
 <html>
=20
 <head>
 <meta http-equiv=3D"Content-Language" content=3D"en-us">
 <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dwindows-=
1252">
 <title>Linux Kernel and Device Drivers DOSDONTS</title>
+<style type=3D"text/css">
+p { font-size: 0.8em; }
+h1 { font-family: Bookman Old Style; color: #800000; font-size: 1.5em; tex=
t-align: center; font-weight: normal; }
+p#img { text-align: center; }
+</style>
 </head>
=20
 <body>
=20
-<p align=3D"center"><font size=3D"5" color=3D"#800000" face=3D"Bookman Old=
 Style">Linux=20
-Kernel and Device Drivers :: DOs and DON'Ts "DOSDONTS"</font></p>
-<p align=3D"center">
-<img border=3D"0" src=3D"extreme_lg.jpg" width=3D"144" height=3D"108"></p>
-<p align=3D"left"><font size=3D"2">A guide to newbies and Kernel hackers o=
f common=20
+<h1>Linux=20
+Kernel and Device Drivers :: DOs and DON'Ts "DOSDONTS"</h1>
+<p id=3D"img">
+<img src=3D"extreme_lg.jpg" width=3D"144" height=3D"108" alt=3D"Penguin Pi=
cture"></p>
+<p>A guide to newbies and Kernel hackers of common=20
 things to DO and DON'T when writing Kernel and device drivers code for the=
 Linux=20
 Operating system based on the experiences of open-source developers and TO=
DO=20
-list of the Kernel janitor Project.</font></p>
-<p align=3D"left"><font size=3D"2">This is an effort to document known goo=
d=20
+list of the Kernel janitor Project.</p>
+<p>This is an effort to document known good=20
 practices of the Kernel development community and provide them in an easy =
to=20
 understand and example-plenty format to assist Kernel hackers and newbies =
alike=20
-in their Linux development work.</font></p>
-<p align=3D"left"><font size=3D"2">This is an open project and contributio=
ns are=20
+in their Linux development work.</p>
+<p>This is an open project and contributions are=20
 welcome.&nbsp; However, submissions need to stay within the intended focus=
 of=20
-this effort:</font></p>
+this effort:</p>
 <ul>
   <li>
-  <p align=3D"left"><font size=3D"2">Back your contributions with code or =
valid=20
-  references.</font></li>
+  <p>Back your contributions with code or valid=20
+  references.</li>
   <li>
-  <p align=3D"left"><font size=3D"2">The goal of this document is to assis=
t=20
+  <p>The goal of this document is to assist=20
   developers in producing robust and as bug-free as possible code.&nbsp;=
=20
   Concepts such as statistics in drivers, resource monitoring, audit tools=
, etc.=20
-  don't belong here and are considered bloat.</font></li>
+  don't belong here and are considered bloat.</li>
   <li>
-  <p align=3D"left"><font size=3D"2">Follow the Linux CodingStyle and gene=
rate=20
-  patches to be applied with a -p1 flag.</font></li>
+  <p>Follow the Linux CodingStyle and generate=20
+  patches to be applied with a -p1 flag.</li>
   <li>
-  <p align=3D"left"><font size=3D"2">Make sure you're not violating any li=
censing or=20
-  copyrights.</font></li>
+  <p>Make sure you're not violating any licensing or=20
+  copyrights.</li>
 </ul>
-<p align=3D"left">&nbsp;</p>
-<p align=3D"left"><font size=3D"2">Links to Documents:</font></p>
-<p align=3D"left"><font size=3D"2"><a href=3D"../docs/driver-howto.html">D=
OSDONTS HTML version</font></p></a>
-<p align=3D"left"><font size=3D"2"><a href=3D"../docs/driver-howto.txt">DO=
SDONTS Text version</font></p></a>
-<p align=3D"left">&nbsp;</p>
-<p align=3D"left">Related projects:</p>
-<p align=3D"left"><a href=3D"../">Kernel-Janitor Project</a></p>
-
-<br>
-For questions or comments please contact Tariq Shureih &LT;tariq.shureih@i=
ntel.com&GT;
-<br><br>
-<br><br>
+<p>&nbsp;</p>
+<p>Links to Documents:</p>
+<p><a href=3D"../docs/driver-howto.html">DOSDONTS HTML version</a></p>
+<p><a href=3D"../docs/driver-howto.txt">DOSDONTS Text version</a></p>
+<p>&nbsp;</p>
+<p>Related projects:</p>
+<p><a href=3D"../">Kernel-Janitor Project</a></p>
+
+<p>
+For questions or comments please contact Tariq Shureih &lt;tariq.shureih@i=
ntel.com&gt;
+</p>
=20
 </body>
=20


--OgqxwSJOaUobr8KG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQFADqwz6//kSTNjoX0RAgjcAJ9YceHCStJUUZSB0QCxEEpCn1Bx2ACfe4b1
D/4ZK2lNjc7H8gsz9WRuqa0=
=GoqB
-----END PGP SIGNATURE-----

--OgqxwSJOaUobr8KG--

--===============92430990165321214==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============92430990165321214==--
