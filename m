From: =?ISO-8859-1?Q?Lukas_Sandstr=F6m?= <lukass@etek.chalmers.se>
Date: Sat, 16 Jul 2005 19:53:31 +0000
Subject: Re: [KJ] [RFC] new design for kerneljanitors.org?
Message-Id: <42D965BB.2070402@etek.chalmers.se>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------050907050803000202030300"
List-Id: <kernel-janitors.vger.kernel.org>
References: <42C1CDE1.9010308@gmx.net>
In-Reply-To: <42C1CDE1.9010308@gmx.net>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------050907050803000202030300
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Michael Veeck wrote:
> Alrighty then, I uploaded latest website to http://veeck.de/janitor/
>=20
> Small cleanups and added the presentation from IEEE2005.
>=20
> Best regards
> Michael Veeck
>=20

Unfortunatley, it doesn't look very good in my Firefox setup, most
likley due to the relative positioning of the <div>'s.

See http://www.etek.chalmers.se/~lukass/linnewb/old_style.jpg for a
screenshot of how http://veeck.de/janitor/index.html rendered for me at
20:43 GMT 2005-07-16.

I took the liberty of making some improvements to the css and html. You
can see the results at http://www.etek.chalmers.se/~lukass/linnewb/

The attached diffs show the (fairly small) changes I made.

The only regression, as I see it, is that I had to place the
offsite-links before the local- and contact-info in order for the float
to work nicely. This makes the offsite links appear before the local and
contact when viewed in lynx or with stylesheets enabled.

/Lukas Sandstr=F6m

--------------050907050803000202030300
Content-Type: text/plain;
 name="index.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="index.diff"

--- index-orig.html	2005-07-16 21:23:11.000000000 +0200
+++ index.html	2005-07-16 21:33:58.000000000 +0200
@@ -14,18 +14,34 @@
     <body>
 
         <div id="header">
-            <img class="padded_left" src="pengsmall.png" alt="Linux Penguin Picture"/>
-            <p>Welcome to The Linux Kernel Janitor Project home page.</p>
+            <img id="penguin" src="pengsmall.png" alt="Linux Penguin Picture"/>
+            <h1>Welcome to The Linux Kernel Janitor Project home page.</h1>
         </div>
 
-        <div id="headtext">
+        <div id="headtext"><p>
        We go through the Linux kernel sources, doing code reviews, fixing up
        unmaintained code and doing other cleanups and API conversion.
-       It is a good start to kernel hacking.
+       It is a good start to kernel hacking.</p>
+        </div>
+        <div id="offsite" class="box">
+            <div class="title"><h2>Offsite Links:</h2></div>
+            <ul>
+                <li><a href="http://coderock.org/kj/">Kernel janitor patchsets</a></li>
+                <li><a href="http://bugzilla.kernel.org/">2.5/2.6 kernel bugzilla database</a></li>
+                <li><a href="http://www.codemonkey.org.uk/projects/git-snapshots/sparse/">Sparse snapshot</a></li>
+                <li><a href="http://smatch.sourceforge.net/">Smatch project</a></li>
+                <li><a href="http://metacomp.stanford.edu/">Stanford Checker</a></li>
+                <li><a href="http://developer.osdl.org/cherry/compile/">2.6 Linux IA-32 compile statistics</a></li>
+                <li><a href="http://www.osdl.org/projects/26lnxstblztn/results/">2.6 Linux stabilization project</a></li>
+                <li><a href="http://www.linuxdevices.com/articles/AT5340618290.html">Writing portable device drivers</a> - Linux Journal article by Greg Kroah-Hartman</li>
+                <li><a href="http://people.redhat.com/arjanv/olspaper.pdf">How to NOT write a device driver</a> - OLS2002 paper by Arjan van de Ven</li>
+                <li><a href="http://developer.osdl.org/rddunlap/doc/scale-3x-kj-v5.pdf">Randy's KJ presentation at SCALE 2005</a></li>
+                <li><a href="http://archive.linuxsymposium.org/ols2003/Proceedings/All-Reprints/Reprint-Melo-OLS2003.pdf">ACME's KJ presentation at OLS 2003</a></li>
+                <li><a href="http://www.madrone.org/mentor/linux-mentoring.pdf">Linux Kernel Development: Getting Started</a> - IEEE Northcon 2005 paper by Randy Dunlap </li>
+            </ul>
         </div>
-
         <div id="local" class="box">
-            <div class="title">Local Information:</div>
+            <div class="title"><h2>Local Information:</h2></div>
             <ul>
                 <li><a href="http://kerneljanitors.org/TODO">The current TODO list</a></li>
                 <li><a href="http://kerneljanitors.org/README">The project README file</a></li>
@@ -38,7 +54,7 @@
         </div>
 
         <div id="contact" class="box">
-            <div class="title">Contact Information:</div>
+            <div class="title"><h2>Contact Information:</h2></div>
             <ul>
                 <li>
                      <dl>
@@ -60,29 +76,11 @@
             </ul>
         </div>
 
-        <div id="offsite" class="box">
-            <div class="title">Offsite Links:</div>
-            <ul>
-                <li><a href="http://coderock.org/kj/">Kernel janitor patchsets</a></li>
-                <li><a href="http://bugzilla.kernel.org/">2.5/2.6 kernel bugzilla database</a></li>
-                <li><a href="http://www.codemonkey.org.uk/projects/git-snapshots/sparse/">Sparse snapshot</a></li>
-                <li><a href="http://smatch.sourceforge.net/">Smatch project</a></li>
-                <li><a href="http://metacomp.stanford.edu/">Stanford Checker</a></li>
-                <li><a href="http://developer.osdl.org/cherry/compile/">2.6 Linux IA-32 compile statistics</a></li>
-                <li><a href="http://www.osdl.org/projects/26lnxstblztn/results/">2.6 Linux stabilization project</a></li>
-                <li><a href="http://www.linuxdevices.com/articles/AT5340618290.html">Writing portable device drivers</a> - Linux Journal article by Greg Kroah-Hartman</li>
-                <li><a href="http://people.redhat.com/arjanv/olspaper.pdf">How to NOT write a device driver</a> - OLS2002 paper by Arjan van de Ven</li>
-                <li><a href="http://developer.osdl.org/rddunlap/doc/scale-3x-kj-v5.pdf">Randy's KJ presentation at SCALE 2005</a></li>
-                <li><a href="http://archive.linuxsymposium.org/ols2003/Proceedings/All-Reprints/Reprint-Melo-OLS2003.pdf">ACME's KJ presentation at OLS 2003</a></li>
-                <li><a href="http://www.madrone.org/mentor/linux-mentoring.pdf">Linux Kernel Development: Getting Started</a> - IEEE Northcon 2005 paper by Randy Dunlap </li>
-            </ul>
-        </div>
-
         <div id="footer">
             <a href="http://validator.w3.org/check?uri=referer">
-                <img src="http://www.w3.org/Icons/valid-xhtml11" alt="Valid XHTML 1.1!" height="31" width="88" class="padded_left"/>
+                <img src="http://www.w3.org/Icons/valid-xhtml11" alt="Valid XHTML 1.1!" height="31" width="88" id="valid_xhtml"/>
             </a>
-            <p>page last modified 07-16-2005</p>
+            <p id="lastmod">page last modified 07-16-2005</p>
         </div>
 
     </body>

--------------050907050803000202030300
Content-Type: text/plain;
 name="style.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="style.diff"

--- style-orig.css	2005-07-16 21:23:33.000000000 +0200
+++ style.css	2005-07-16 21:39:00.000000000 +0200
@@ -3,8 +3,13 @@ body {
         color: #000000;
         font-size: 12pt;
         font-family: verdana, arial, helvetica, sans-serif;
+        margin: 0 auto;
+        margin-top: 10px;
+        width: 910px;
+}
+#penguin {
+        float: left;
 }
-
 #header {
         border-collapse: collapse;
         border-style: solid;
@@ -20,7 +25,9 @@ body {
         margin-left:    auto;
         margin-right:   auto;
 }
-
+#header h1 {
+        font-size: 12pt;
+}
 #headtext {
         border-collapse: collapse;
         border-style: solid;
@@ -37,22 +44,19 @@ body {
 }
 
 #local {
-        position:relative; left:-189pt;
         width: 400px;
 }
 
 #contact {
-        position:relative; left:-252px; top: -10px;
         width: 400px;
 }
 
 #offsite {
-        position:relative; left: 204px; top: -362px;
         width: 495px;
+        float: right;
 }
 
 #footer {
-        position:relative; left: 500px; top: -330px;
         font-size:  0.7em;
 }
 
@@ -60,10 +64,15 @@ div.title {
         padding-top: 2px;
         padding-bottom: 2px;
         width: 100%;
+
+        background-color: #000000;
+}
+.title h2 {
         text-align: center;
         font-weight: bold;
-        background-color: #000000;
+        font-size: 12pt;
         color: #ffffff;
+        margin: 0;
 }
 
 div.box {
@@ -76,10 +85,10 @@ div.box {
         background-color: #ffffff;
 
         text-align: center;
-        vertical-align: text-top; 
+        vertical-align: text-top;
 
         padding: 0px;
-        margin: 1em auto;
+        margin-bottom: 10px;
 }
 
 a:link {
@@ -106,12 +115,17 @@ a:hover {
         font-weight: bold;
 }
 
-img.padded_left { 
+#valid_xhtml{
         position:      relative;
         border:        0px;
         float:         left;
 }
-
+#lastmod {
+        float: right;
+}
+p {
+        margin: 0;
+}
 ul {
         list-style-type: none;
         margin:  0px;
@@ -119,10 +133,10 @@ ul {
         border:  0px;
 }
 
-li { 
+li {
         text-align: left;
 }
 
-dt { 
+dt {
         font-weight: bold;
 }

--------------050907050803000202030300
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------050907050803000202030300--
