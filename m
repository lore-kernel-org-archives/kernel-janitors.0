From: maximilian attems <janitor@sternwelten.at>
Date: Mon, 19 Jan 2004 20:57:49 +0000
Subject: Re: [Kernel-janitors] [announce] new KJ web hosting
Message-Id: <20040119205748.GB927@mail.sternwelten.at>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============39331077359491129=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040111193612.2b4445fc.rddunlap@osdl.org>
In-Reply-To: <20040111193612.2b4445fc.rddunlap@osdl.org>
To: kernel-janitors@vger.kernel.org


--===============39331077359491129==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="61jdw2sOBCFtR2d/"
Content-Disposition: inline


--61jdw2sOBCFtR2d/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

hey randy,

just run the new page through the validator:
http://validator.w3.org/check?uri=3Dhttp%3A%2F%2Fjanitor.kernelnewbies.org%=
2F
uuups
the html is far from being valid.

belows 2 patches make the webpage valid,
* adds document declaration 4.01 strict
* removes unused body css class
* removes center tags
* adds alt tag for pinguin
* adds 2 div containers for centred tables
  =3D> replacement of invalid <table align=3D"middle">
* adds extern <tr> to <th> tags
* extra minor stuff

the html patch tries to be minimal
it leaves table even if they shouldn't be used for layout.
and doesn't switch to newer xhtml.=20

please do not forget to apply the css patch
without it the text of the homepage would be invisible

tested on mozilla-firebird 0.7, mozilla 1.5, lynx 2.8.4rel.1
and netscape 4.77 (it didn't crash ;)
hope you like it?

a++
maks


--- kernel-janitor/index.html	2004-01-14 00:59:48.000000000 +0100
+++ kernel-janitor-maks/index.html	2004-01-19 21:49:42.000000000 +0100
@@ -1,3 +1,4 @@
+<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/ht=
ml4/strict.dtd">
 <html>
 <head>
 <title>Linux Kernel Janitor Project home page.</title>
@@ -8,22 +9,23 @@
 <meta name=3D"KeyWords" content=3D"Linux, Kernel, Janitor, cleanup, audit,=
 bugfixing">
 </head>
=20
-<body class=3D"background">
+<body>
+  <div id=3D"head_center">
=20
-<center>
-<table width=3D"50%" class=3D"box">
+<table class=3D"box">
 <tr>
-<td valign=3D"top"><img SRC=3D"pengsmall.gif"></td>
-<td valign=3D"top">
-<center>Welcome to The Linux Kernel Janitor Project home page.</center>
+<td valign=3D"top"><img src=3D"pengsmall.gif" alt=3D"Linux Pinguin Picture=
 "></td>
+<td valign=3D"top" align=3D"center">
+<p>Welcome to The Linux Kernel Janitor Project home page.</p>
 </td></tr></table>
=20
-<p>
+  </div>
+  <div id=3D"content_center">
=20
-<table width=3D"90%" class=3D"box">
+<table class=3D"box">
 <tr><td class=3D"dark">
   <table class=3D"box" width=3D"100%">
-   <th class=3D"th"><b>Local info:</b></th>
+   <tr><th class=3D"th"><b>Local info:</b></th></tr>
    <tr><td>
    <a href=3D"TODO">The current TODO list</a><br>
    <a href=3D"README">The project README file</a>.<br>
@@ -36,7 +38,7 @@
   <p><p>
=20
   <table class=3D"box">
-   <th class=3D"th"><b>Offsite Links:</b></th>
+   <tr><th class=3D"th"><b>Offsite Links:</b></th></tr>
    <tr><td>
    <a href=3D"http://developer.osdl.org/rddunlap/kj-patches/">kernel-janit=
or patchsets.</a><br>
    <a href=3D"http://bazar.conectiva.com.br/~acme/TODO">Acme's original Ja=
nitor TODO list.</a><br>
@@ -53,7 +55,7 @@
=20
   <td class=3D"dark">
     <table class=3D"box">
-    <th class=3D"th"><b>CVS Info:</b></th>
+    <tr><th class=3D"th"><b>CVS Info:</b></th></tr>
     <tr><td>
     You can also check out the current TODO from anonymous CVS using these=
 commands:<br>
     <code>cvs -d:pserver:cvs@nl.linux.org/home/CVS login</code><br>
@@ -64,25 +66,22 @@
=20
    <p><p>
=20
-   <table class=3D"box" width=3D100%>
-   <th class=3D"th"><b>IRC:</b></th>
+   <table class=3D"box" width=3D"100%">
+   <tr><th class=3D"th"><b>IRC:</b></th></tr>
    <tr><td>
-   <b>IRC</b>: irc.kernelnewbies.org #kerneljanitor</td>
+   <b>IRC</b>: irc.kernelnewbies.org #kerneljanitor
    </td></tr></table>
=20
    <p><p>
=20
-   <table class=3D"box" width=3D100%>
-   <th class=3D"th"><b>EMAIL:</b></th>
+   <table class=3D"box" width=3D"100%">
+   <tr><th class=3D"th"><b>EMAIL:</b></th></tr>
    <tr><td>
    For further information, email kernel-janitors at lists.osdl.org<br>
-   Mailing list subscription information is at <A href=3D"http://lists.osd=
l.org/mailman/listinfo/kernel-janitors">OSDL</a></p>
+   Mailing list subscription information is at <A href=3D"http://lists.osd=
l.org/mailman/listinfo/kernel-janitors">OSDL</a>
    </td></tr></table>
=20
 </table>
-
-</center>
-
+</div>
 </body>
 </html>
-



--- kernel-janitor/style.css	2004-01-10 01:58:55.000000000 +0100
+++ kernel-janitor-maks/style.css	2004-01-19 21:08:22.000000000 +0100
@@ -3,7 +3,6 @@
 	font-family: verdana, arial, helvetica, sans-serif;
 	font-size: 12pt;
 	color: #000000;
-	text-align: justify;
 	margin: 5px;
 }
=20
@@ -47,6 +46,7 @@
 	border-color: #000000;
 	border-spacing: 0px;
 	background-color: #ffffff;
+	text-align: center;
 }
=20
 th {
@@ -57,8 +57,10 @@
 }
=20
 td {
+	color: #000000;
 	padding: 3px;
 	vertical-align: top;
+	text-align: justify;
 }
=20
 th.list {
@@ -100,5 +102,15 @@
 	list-style: circle outside url(/images/bullet.png);
 }
=20
+/* workaround table centering */
+#head_center {
+  	margin: 1em auto;
+	width: 500px;
+}
+
+#content_center {
+  	margin: 1em auto;
+	width: 900px;
+}
 /* vim:ts=3D8:noexpandtab:nosmartindent:autoindent:hlsearch:
 */

--61jdw2sOBCFtR2d/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQFADETM6//kSTNjoX0RArOPAJwJte1j9Iu4iaYSBRN5X4sJt5PsngCfajlh
KIo/qZOq5tA7lRi/jHJDwvk=
=hIBx
-----END PGP SIGNATURE-----

--61jdw2sOBCFtR2d/--

--===============39331077359491129==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============39331077359491129==--
