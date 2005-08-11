From: Michael Veeck <michael.veeck@gmx.net>
Date: Thu, 11 Aug 2005 21:21:57 +0000
Subject: Re: [KJ] [RFC] new design for kerneljanitors.org?
Message-Id: <42FBC175.5040901@gmx.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <42C1CDE1.9010308@gmx.net>
In-Reply-To: <42C1CDE1.9010308@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

Looks good. Now we would need someone with an older version of IE to=20
test it. Anyone here who can provide such service?

Best regards
MVeeck

Lukas Sandstr=F6m schrieb:
> Michael Veeck wrote:
>=20
>>Alrighty then, I uploaded latest website to http://veeck.de/janitor/
>>
>>Small cleanups and added the presentation from IEEE2005.
>>
>>Best regards
>>Michael Veeck
>>
>=20
>=20
> Unfortunatley, it doesn't look very good in my Firefox setup, most
> likley due to the relative positioning of the <div>'s.
>=20
> See http://www.etek.chalmers.se/~lukass/linnewb/old_style.jpg for a
> screenshot of how http://veeck.de/janitor/index.html rendered for me at
> 20:43 GMT 2005-07-16.
>=20
> I took the liberty of making some improvements to the css and html. You
> can see the results at http://www.etek.chalmers.se/~lukass/linnewb/
>=20
> The attached diffs show the (fairly small) changes I made.
>=20
> The only regression, as I see it, is that I had to place the
> offsite-links before the local- and contact-info in order for the float
> to work nicely. This makes the offsite links appear before the local and
> contact when viewed in lynx or with stylesheets enabled.
>=20
> /Lukas Sandstr=F6m
>=20
>=20
> ------------------------------------------------------------------------
>=20
> --- index-orig.html	2005-07-16 21:23:11.000000000 +0200
> +++ index.html	2005-07-16 21:33:58.000000000 +0200
> @@ -14,18 +14,34 @@
>      <body>
> =20
>          <div id=3D"header">
> -            <img class=3D"padded_left" src=3D"pengsmall.png" alt=3D"Linu=
x Penguin Picture"/>
> -            <p>Welcome to The Linux Kernel Janitor Project home page.</p>
> +            <img id=3D"penguin" src=3D"pengsmall.png" alt=3D"Linux Pengu=
in Picture"/>
> +            <h1>Welcome to The Linux Kernel Janitor Project home page.</=
h1>
>          </div>
> =20
> -        <div id=3D"headtext">
> +        <div id=3D"headtext"><p>
>         We go through the Linux kernel sources, doing code reviews, fixin=
g up
>         unmaintained code and doing other cleanups and API conversion.
> -       It is a good start to kernel hacking.
> +       It is a good start to kernel hacking.</p>
> +        </div>
> +        <div id=3D"offsite" class=3D"box">
> +            <div class=3D"title"><h2>Offsite Links:</h2></div>
> +            <ul>
> +                <li><a href=3D"http://coderock.org/kj/">Kernel janitor p=
atchsets</a></li>
> +                <li><a href=3D"http://bugzilla.kernel.org/">2.5/2.6 kern=
el bugzilla database</a></li>
> +                <li><a href=3D"http://www.codemonkey.org.uk/projects/git=
-snapshots/sparse/">Sparse snapshot</a></li>
> +                <li><a href=3D"http://smatch.sourceforge.net/">Smatch pr=
oject</a></li>
> +                <li><a href=3D"http://metacomp.stanford.edu/">Stanford C=
hecker</a></li>
> +                <li><a href=3D"http://developer.osdl.org/cherry/compile/=
">2.6 Linux IA-32 compile statistics</a></li>
> +                <li><a href=3D"http://www.osdl.org/projects/26lnxstblztn=
/results/">2.6 Linux stabilization project</a></li>
> +                <li><a href=3D"http://www.linuxdevices.com/articles/AT53=
40618290.html">Writing portable device drivers</a> - Linux Journal article =
by Greg Kroah-Hartman</li>
> +                <li><a href=3D"http://people.redhat.com/arjanv/olspaper.=
pdf">How to NOT write a device driver</a> - OLS2002 paper by Arjan van de V=
en</li>
> +                <li><a href=3D"http://developer.osdl.org/rddunlap/doc/sc=
ale-3x-kj-v5.pdf">Randy's KJ presentation at SCALE 2005</a></li>
> +                <li><a href=3D"http://archive.linuxsymposium.org/ols2003=
/Proceedings/All-Reprints/Reprint-Melo-OLS2003.pdf">ACME's KJ presentation =
at OLS 2003</a></li>
> +                <li><a href=3D"http://www.madrone.org/mentor/linux-mento=
ring.pdf">Linux Kernel Development: Getting Started</a> - IEEE Northcon 200=
5 paper by Randy Dunlap </li>
> +            </ul>
>          </div>
> -
>          <div id=3D"local" class=3D"box">
> -            <div class=3D"title">Local Information:</div>
> +            <div class=3D"title"><h2>Local Information:</h2></div>
>              <ul>
>                  <li><a href=3D"http://kerneljanitors.org/TODO">The curre=
nt TODO list</a></li>
>                  <li><a href=3D"http://kerneljanitors.org/README">The pro=
ject README file</a></li>
> @@ -38,7 +54,7 @@
>          </div>
> =20
>          <div id=3D"contact" class=3D"box">
> -            <div class=3D"title">Contact Information:</div>
> +            <div class=3D"title"><h2>Contact Information:</h2></div>
>              <ul>
>                  <li>
>                       <dl>
> @@ -60,29 +76,11 @@
>              </ul>
>          </div>
> =20
> -        <div id=3D"offsite" class=3D"box">
> -            <div class=3D"title">Offsite Links:</div>
> -            <ul>
> -                <li><a href=3D"http://coderock.org/kj/">Kernel janitor p=
atchsets</a></li>
> -                <li><a href=3D"http://bugzilla.kernel.org/">2.5/2.6 kern=
el bugzilla database</a></li>
> -                <li><a href=3D"http://www.codemonkey.org.uk/projects/git=
-snapshots/sparse/">Sparse snapshot</a></li>
> -                <li><a href=3D"http://smatch.sourceforge.net/">Smatch pr=
oject</a></li>
> -                <li><a href=3D"http://metacomp.stanford.edu/">Stanford C=
hecker</a></li>
> -                <li><a href=3D"http://developer.osdl.org/cherry/compile/=
">2.6 Linux IA-32 compile statistics</a></li>
> -                <li><a href=3D"http://www.osdl.org/projects/26lnxstblztn=
/results/">2.6 Linux stabilization project</a></li>
> -                <li><a href=3D"http://www.linuxdevices.com/articles/AT53=
40618290.html">Writing portable device drivers</a> - Linux Journal article =
by Greg Kroah-Hartman</li>
> -                <li><a href=3D"http://people.redhat.com/arjanv/olspaper.=
pdf">How to NOT write a device driver</a> - OLS2002 paper by Arjan van de V=
en</li>
> -                <li><a href=3D"http://developer.osdl.org/rddunlap/doc/sc=
ale-3x-kj-v5.pdf">Randy's KJ presentation at SCALE 2005</a></li>
> -                <li><a href=3D"http://archive.linuxsymposium.org/ols2003=
/Proceedings/All-Reprints/Reprint-Melo-OLS2003.pdf">ACME's KJ presentation =
at OLS 2003</a></li>
> -                <li><a href=3D"http://www.madrone.org/mentor/linux-mento=
ring.pdf">Linux Kernel Development: Getting Started</a> - IEEE Northcon 200=
5 paper by Randy Dunlap </li>
> -            </ul>
> -        </div>
> -
>          <div id=3D"footer">
>              <a href=3D"http://validator.w3.org/check?uri=3Dreferer">
> -                <img src=3D"http://www.w3.org/Icons/valid-xhtml11" alt=
=3D"Valid XHTML 1.1!" height=3D"31" width=3D"88" class=3D"padded_left"/>
> +                <img src=3D"http://www.w3.org/Icons/valid-xhtml11" alt=
=3D"Valid XHTML 1.1!" height=3D"31" width=3D"88" id=3D"valid_xhtml"/>
>              </a>
> -            <p>page last modified 07-16-2005</p>
> +            <p id=3D"lastmod">page last modified 07-16-2005</p>
>          </div>
> =20
>      </body>
>=20
>=20
> ------------------------------------------------------------------------
>=20
> --- style-orig.css	2005-07-16 21:23:33.000000000 +0200
> +++ style.css	2005-07-16 21:39:00.000000000 +0200
> @@ -3,8 +3,13 @@ body {
>          color: #000000;
>          font-size: 12pt;
>          font-family: verdana, arial, helvetica, sans-serif;
> +        margin: 0 auto;
> +        margin-top: 10px;
> +        width: 910px;
> +}
> +#penguin {
> +        float: left;
>  }
> -
>  #header {
>          border-collapse: collapse;
>          border-style: solid;
> @@ -20,7 +25,9 @@ body {
>          margin-left:    auto;
>          margin-right:   auto;
>  }
> -
> +#header h1 {
> +        font-size: 12pt;
> +}
>  #headtext {
>          border-collapse: collapse;
>          border-style: solid;
> @@ -37,22 +44,19 @@ body {
>  }
> =20
>  #local {
> -        position:relative; left:-189pt;
>          width: 400px;
>  }
> =20
>  #contact {
> -        position:relative; left:-252px; top: -10px;
>          width: 400px;
>  }
> =20
>  #offsite {
> -        position:relative; left: 204px; top: -362px;
>          width: 495px;
> +        float: right;
>  }
> =20
>  #footer {
> -        position:relative; left: 500px; top: -330px;
>          font-size:  0.7em;
>  }
> =20
> @@ -60,10 +64,15 @@ div.title {
>          padding-top: 2px;
>          padding-bottom: 2px;
>          width: 100%;
> +
> +        background-color: #000000;
> +}
> +.title h2 {
>          text-align: center;
>          font-weight: bold;
> -        background-color: #000000;
> +        font-size: 12pt;
>          color: #ffffff;
> +        margin: 0;
>  }
> =20
>  div.box {
> @@ -76,10 +85,10 @@ div.box {
>          background-color: #ffffff;
> =20
>          text-align: center;
> -        vertical-align: text-top;=20
> +        vertical-align: text-top;
> =20
>          padding: 0px;
> -        margin: 1em auto;
> +        margin-bottom: 10px;
>  }
> =20
>  a:link {
> @@ -106,12 +115,17 @@ a:hover {
>          font-weight: bold;
>  }
> =20
> -img.padded_left {=20
> +#valid_xhtml{
>          position:      relative;
>          border:        0px;
>          float:         left;
>  }
> -
> +#lastmod {
> +        float: right;
> +}
> +p {
> +        margin: 0;
> +}
>  ul {
>          list-style-type: none;
>          margin:  0px;
> @@ -119,10 +133,10 @@ ul {
>          border:  0px;
>  }
> =20
> -li {=20
> +li {
>          text-align: left;
>  }
> =20
> -dt {=20
> +dt {
>          font-weight: bold;
>  }
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
