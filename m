From: maximilian attems <janitor@sternwelten.at>
Date: Wed, 21 Jan 2004 16:52:45 +0000
Subject: Re: [Kernel-janitors] [announce] new KJ web hosting
Message-Id: <20040121165245.GB1498@mail.sternwelten.at>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============79305697961452704=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040111193612.2b4445fc.rddunlap@osdl.org>
In-Reply-To: <20040111193612.2b4445fc.rddunlap@osdl.org>
To: kernel-janitors@vger.kernel.org


--===============79305697961452704==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jho1yZJdad60DJr+"
Content-Disposition: inline


--jho1yZJdad60DJr+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

hey randy,

the last "local" html ;)
same story for the docs/driver-howto.html
again if you prefer outside css file,
please tell .. here there is a bit more css,
in order to look like the original.
belows patch make this document valid:

 * adds document declaration 4.01 strict
 * split up invalid meta tag in 2
 * adds header css information=20
 * removes superfluous defs, font tags
 * restore right order of nested tags=20
   <hx><a> ..</hx></a> -> <hx><a> .. </a></hx>
 * souround all non formated text with <pre> </pre>
 * change &quote, &LT, &GT -> &quot, &lt, &gt

tested on mozilla 1.5 and lynx.

hope this helps
regards maks


--- kernel-janitor/docs/driver-howto.html	2004-01-09 22:09:18.000000000 +01=
00
+++ kernel-janitor-maks/docs/driver-howto.html	2004-01-21 17:25:47.00000000=
0 +0100
@@ -1,18 +1,30 @@
+<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/ht=
=3Dml4/strict.dtd">
 <html>
 <head>
 <title>Dos and Don't when writing a Linux Device Driver</title>
-<meta name=3D"Tariq Shureih" content=3D"Vim/6.1">
+<meta name=3D"Author" content=3D"Tariq Shureih">
+<meta name=3D"Editor" content=3D"Vim/6.1">
+<meta http-equiv=3D"content-type" content=3D"text/html; charset=3Diso-8859=
-15">
+<style type=3D"text/css">
+h1 { text-align: center; }
+div.mid { text-align: center; }
+h2 { font-size: 1.1em; font-family: Courier New, Courier, monospace; }
+h3 { font-size: 1.0em; font-family: Courier New, Courier, monospace; }
+h4 { font-size: 0.8EM; font-family: Courier New, Courier, monospace; }
+li { font-size: 0.8em; font-family: Courier New, Courier, monospace; }
+</style>
 </head>
-<body bgcolor=3D"#ffffff" text=3D"#000000">
-<strong><div align=3D"center"><h1>HOWTO: Linux Device Driver Dos and Don't=
s</strong></h1></div>
+<body>
+<h1>HOWTO: Linux Device Driver Dos and Don'ts</h1>
=20
-<div align=3D"center">         Linux Device Drivers DOs and DON'Ts
+<div class=3D"mid">         Linux Device Drivers DOs and DON'Ts
         A guide to writing Robust Linux Device Drivers</div>
-<dev align=3D"center">Version 1.1</div>
+<div>Version 1.1</div>
 <pre>
 ---------------------------------------------------------------------
=20
-<h2>Index</h2>
+</pre>
+<h2>Index</h2><p>&nbsp;<p>
 <ul>
 <li><a href=3D"#license">License, author and version</a>
 <li><a href=3D"#intro">Introduction</a>
@@ -40,10 +52,19 @@
=20
=20
=20
+<pre>
+
+
+
+
+
+
=20
-----------------------------------------------------------------------
-<h3><a NAME=3D"license">License, author and version</h3></a>
=20
+----------------------------------------------------------------------
+</pre>
+<h3><a NAME=3D"license">License, author and version</a></h3>
+<pre>
 Copyright (c) 2003 by Intel Corporation.  This material may be
 distributed only subject to the terms and conditions set forth
 in the Open Publication License, v1.0 or later.
@@ -51,13 +72,15 @@
 The latest version is presently available at:     =20
 <a href=3D"http://www.opencontent.org/openpub.">http://www.opencontent.org=
/openpub.</a>=20
=20
-Author: Tariq Shureih &LT;tariq.shureih@intel.com&GT;
+Author: Tariq Shureih &lt;tariq.shureih@intel.com&gt;
=20
 Version: 1.1
 Date updated:$Date: 2004/01/09 21:09:18 $
=20
=20
-<h3><a NAME=3D"intro">Introduction</h3></a>
+</pre>
+<h3><a NAME=3D"intro">Introduction</a></h3>
+<pre>
 This document is not a real driver HOWTO -- there are books out there on
 how to write a linux kernel driver.
 Writing a linux kernel driver can be as simple as writing three lines
@@ -74,8 +97,10 @@
=20
 For more information on the Kernel-Janitor project, visit http://kernel-ja=
nitor.sourceforge.net/.
=20
-<h2><a NAME=3D"ov">1-Overview</h2></a>
-    <h3><a NAME=3D"1.1">1.1 Why this document?</h3></a>
+</pre>
+<h2><a NAME=3D"ov">1-Overview</a></h2>
+    <h3><a NAME=3D"1.1">1.1 Why this document?</a></h3>
+<pre>
=20
     I wanted to collect the information I learned when I got involved in k=
ernel development
     in a single document and hopefully make it a guide to newbies and/or p=
eople looking for
@@ -84,8 +109,9 @@
     This document is rather a simple guide to known methods and techniques=
 when writing
 	a Linux device driver and it could be regarded as a companion to other av=
ailable resources.
=20
-
-    <h3><a NAME=3D"1.2">1.2 What's a &quot;Hardened Device Driver&quot;?</=
h3></a>
+</pre>
+    <h3><a NAME=3D"1.2">1.2 What's a &quot;Hardened Device Driver&quot;?</=
a></h3>
+<pre>
     The answer to this question depends on who you ask.  To some, a harden=
ed
     device driver is a stable, reliable, instrumental and highly available=
 device
     driver.  In a previous effort to specify what constitutes a hardened d=
river, a
@@ -109,7 +135,9 @@
     To avoid confusion with previous efforts to speficy the requirements o=
f a hardened driver,
     this document will refer to the ideal driver as an &quot;robust&quot; =
driver.
=20
-    <h3><a NAME=3D"1.3">1.3 Robust device drivers</h3></a>
+</pre>
+    <h3><a NAME=3D"1.3">1.3 Robust device drivers</a></h3>
+<pre>
=20
     A robust driver is really just a robust, bug free and maintainable exa=
mple of kernel level code.
 	As Linux evolves, the specifics of what makes up a robust device driver w=
ill change, but the=20
@@ -150,8 +178,9 @@
     robust device drivers.
=20
=20
-
-    <h2><a NAME=3D"2.0">2.0 Where do I start?</h2></a>
+</pre>
+    <h2><a NAME=3D"2.0">2.0 Where do I start?</a></h2>
+<pre>
=20
     If you're new to writing Linux device drivers, you're probably better =
off getting a copy of O'Reilly's book
     &quot;Linux Device Drivers&quot;, reading the &quot;linux-kernel-sourc=
e/Documentation/driver-model&quot;, and looking through
@@ -169,13 +198,15 @@
     Further, I hope this document will help you in avoiding common DON'Ts =
and shed light on advocated DOs that
     will help your driver and code function at the highest levels of perfo=
rmance.
=20
-
-    <h2><a NAME=3D"3.0">3.0 OK, I'm ready...</h2></a>
+</pre>
+    <h2><a NAME=3D"3.0">3.0 OK, I'm ready...</a></h2>
+<pre>
=20
     Let's start examining the aspects of a robust device driver code and t=
he various techniques to achieve
     high efficiency and stability.
-
-    <h4><a NAME=3D"3.1">3.1 Efficient error handling, reporting and recove=
ry:</h4></a>
+</pre>
+    <h4><a NAME=3D"3.1">3.1 Efficient error handling, reporting and recove=
ry:</a></h4>
+<pre>
=20
     You can follow some simple and proven ways to handle errors and faults=
 within your code:
=20
@@ -348,8 +379,9 @@
     What this document advocates against is the &quot;lazy&quot; panics wh=
ere the developer did not
     have an understanding of the full picture and opted to panic() out for=
 simplicity.
=20
-
-    <h4><a NAME=3D"3.2">3.2 Up-to-date with kernel APIs/Interfaces:</h4></=
a>
+</pre>
+    <h4><a NAME=3D"3.2">3.2 Up-to-date with kernel APIs/Interfaces:</a></h=
4>
+<pre>
=20
     This document was written during the development of the 2.6 Linux kern=
el.
     During the development and various releases of linux-2.5.x, many conce=
pts, interfaces
@@ -364,8 +396,9 @@
     experience while contributing to linux kernel and gathered input from =
experienced
     developers in the open source community.
=20
-
-    <h4><a NAME=3D"3.2.1">3.2.1 Module interface changes</h4></a>
+</pre>
+    <h4><a NAME=3D"3.2.1">3.2.1 Module interface changes</a></h4>
+<pre>
=20
         &lt;Initialization and cleanup&gt;
=20
@@ -411,7 +444,7 @@
=20
         }
=20
-        <u>You no longer need to adjust your own module reference count</u>
+        <b>You no longer need to adjust your own module reference count</b>
=20
         -Reference counting from other modules:
=20
@@ -456,8 +489,9 @@
             See 3.2.2 Sysfs and new driver model below.
=20
=20
-
-    <h4><a NAME=3D"3.2.2">3.2.2 Sysfs and new driver model</h4></a>
+</pre>
+    <h4><a NAME=3D"3.2.2">3.2.2 Sysfs and new driver model</a></h4>
+<pre>
=20
         Reference: linux-kernel-source/Documentation/driver-model/
         Reference: linux-kernel-source/Documentation/filesystems/sysfs.txt
@@ -762,7 +796,9 @@
 		is not driver-wide and is only available (in this example) if the device=
 itself provided
 		functionality specific to it and is not implemented in the generic drive=
r.
=20
-    <h4><a NAME=3D"3.2.3">3.2.3 Cli() and Sti()</h4></a>
+</pre>
+    <h4><a NAME=3D"3.2.3">3.2.3 Cli() and Sti()</a></h4>
+<pre>
=20
     Starting linux-2.5.x and targeted for linux-2.6.x, the following funct=
ions (macros)
     are absolete and have been deprecated:
@@ -800,8 +836,9 @@
     The spinlock functions (actually macros) are defined in:
         linux/include/linux/spinlock.h
=20
-
-    <h4><a NAME=3D"3.2.4">Misc pointers to new API</h4></a>
+</pre>
+    <h4><a NAME=3D"3.2.4">Misc pointers to new API</a></h4>
+<pre>
=20
     -proc_register is dead, use create_proc_entry() instead.
=20
@@ -829,14 +866,16 @@
     -sleep_on() function will go away in 2.5/2.6 kernels.
=20
=20
-
-    <h3><a NAME=3D"3.3">3.3 Managing resources:</h3></a>
+</pre>
+    <h3><a NAME=3D"3.3">3.3 Managing resources:</a></h3>
+<pre>
     In this section we will look at the various resource allocation
     methods, variable initialization, balancing function calls and
     proper string function for drivers.
=20
-
-   <h4><a NAME=3D"3.3.1">3.3.1 String functions</h4></a>
+</pre>
+   <h4><a NAME=3D"3.3.1">3.3.1 String functions</a></h4>
+<pre>
=20
     -strtok() is not thread and SMP safe and strsep() should be used
      instead:
@@ -854,8 +893,9 @@
      Same goes with the store() method.  It should return the number of
      bytes used from the buffer using strnlen().
=20
-
-    <h4><a NAME=3D"3.3.2">3.3.2 Variable declaration and initialization.</=
h4></a>
+</pre>
+    <h4><a NAME=3D"3.3.2">3.3.2 Variable declaration and initialization.</=
a></h4>
+<pre>
=20
     -For optimal assembly code output, declaring
         [const] char foo[] =3D &quot;blah&quot;;
@@ -875,8 +915,9 @@
      have to search for all instances of &quot;sizeof(type)&quot; and upda=
te
      them.
=20
-
-    <h4><a NAME=3D"3.3.3">3.3.3 Balancing functions:</h4></a>
+</pre>
+    <h4><a NAME=3D"3.3.3">3.3.3 Balancing functions:</a></h4>
+<pre>
=20
     It is important to make sure all your function calls for resource
 	allocation/release are balanced and matched on the other end and=20
@@ -893,10 +934,11 @@
     partner to void dead-locks.
=20
=20
-
-    <h3><a NAME=3D"3.4">3.4 I/O operations:</h3></a>
+</pre>
+    <h3><a NAME=3D"3.4">3.4 I/O operations:</a></h3>
     <h4><a NAME=3D"3.4.1">3.4.1 All I/O space access should use the C I/O =
functions instead of assembly
-    code.</h4></a>
+    code.</a></h4>
+<pre>
=20
     These functions are:
         Byte I/O read/writes:
@@ -923,9 +965,10 @@
             __asm__( &quot;mov $0, %al\n\t&quot; &quot;outb %al, $0x70&quo=
t;);
         should be:
             outb(0x00, 0x70);
-
+</pre>
         <h4><a NAME=3D"3.4.2">3.4.2 All memory mapped I.O access should us=
e read()/write()
-            functions instead of de-referencing a pointer.</h4></a>
+            functions instead of de-referencing a pointer.</a></h4>
+<pre>
=20
=20
         These functions are:
@@ -946,10 +989,11 @@
         Note: you have to use the -O2 optimization flag while compiling for
             these functions (macros really) to expand.
=20
+</pre>
+    <h4><a NAME=3D"3.5">3.5 Obvious DONTZ</a></h4>
+<pre>
=20
-    <h4><a NAME=3D"3.5">3.5 Obvious DONTZ</h4></a>
-
-		-Device drivers should never add a &quote;syscall&quote;.
+		-Device drivers should never add a &quot;syscall&quot;.
 		 system calls are decided by the linux maintainers and involve
 		 assembly code and mess with software interrup (int 0x80); something
 		 drivers should never do.

--jho1yZJdad60DJr+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQFADq5d6//kSTNjoX0RAo0UAJ46rPazCvi6/y63KxOyA17TcJCE2wCdFWBs
g3FmV8wpeDLQLqccAEuJPQI=
=v3ti
-----END PGP SIGNATURE-----

--jho1yZJdad60DJr+--

--===============79305697961452704==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============79305697961452704==--
