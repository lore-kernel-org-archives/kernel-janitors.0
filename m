From: "Mehul Jani" <mehul.jani@gmail.com>
Date: Sat, 10 Feb 2007 08:24:35 +0000
Subject: Re: [KJ] Taking the Min and Max macro job
Message-Id: <cad1dd0a0702100012r1744d21r9d38384434a97f69@mail.gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============2126471462=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20070207235145.GZ8991@Ahmed>
In-Reply-To: <20070207235145.GZ8991@Ahmed>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format...

--===============2126471462==
Content-Type: multipart/alternative;
    boundary="----------=_1171095195-18542-411"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.411 (Entity 5.404)

This is a multi-part message in MIME format...

------------=_1171095195-18542-411
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

>
>
> > > I believe Vignesh had confirmed the patch.....
> > >
> > > So now this is going to be crazy we have 3 pairs of min/max to deal
> with
> > >
> > > min()/max()
> > > min_t()/max_t()
> > > __min()/__max()
> > >
> > > Can the first one be considered *redundant*
> > min()/max()? That is our crown-jewel. I think the order above is then
> > one how to implement min/max. Use ex min() when possible. If min() does
> > not work, use min_t(). If min_t() does not work, use __min() (if it will
> > be accepted, that is). But you have to be more careful when using
> > __min() since it can have side-effects.
> > > I was wondering that from the very first. calling MACRO(MACRO())
> > > somehow is dirty....Any suggestions !!
> > Why? Calling function1(function2()) is ok (right?) and also when dealing
> > with pci-ids you use macros in macros. And the way __min() is in min()
> > and min_t() is also just common practice to reduce multiple
> declarations.
> >


Some how it did not look good , but you are right ....looks fine and clearly
i understood

Mehul I have tested the patch-compiles cleanly.


Great !!!

Will you patch the complete patching the complete tree ?

-Mehul

------------=_1171095195-18542-411
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

<div>
<blockquote class="gmail_quote" DEFANGED_style="PADDING-LEFT: 1ex; MARGIN: 0px 0px 0px 0.8ex; BORDER-LEFT: #ccc 1px solid"><br>&gt; &gt; I believe Vignesh had confirmed the patch.....<br>&gt; &gt;<br>&gt; &gt; So now this is going to be crazy we have 3 pairs of min/max to deal with
<br>&gt; &gt;<br>&gt; &gt; min()/max()<br>&gt; &gt; min_t()/max_t()<br>&gt; &gt; __min()/__max()<br>&gt; &gt;<br>&gt; &gt; Can the first one be considered *redundant*<br>&gt; min()/max()? That is our crown-jewel. I think the order above is then
<br>&gt; one how to implement min/max. Use ex min() when possible. If min() does<br>&gt; not work, use min_t(). If min_t() does not work, use __min() (if it will<br>&gt; be accepted, that is). But you have to be more careful when using
<br>&gt; __min() since it can have side-effects.<br>&gt; &gt; I was wondering that from the very first. calling MACRO(MACRO())<br>&gt; &gt; somehow is dirty....Any suggestions !!<br>&gt; Why? Calling function1(function2()) is ok (right?) and also when dealing
<br>&gt; with pci-ids you use macros in macros. And the way __min() is in min()<br>&gt; and min_t() is also just common practice to reduce multiple declarations.<br>&gt;</blockquote>
<div>&nbsp;</div>
<div>Some how it did not look good , but you are right ....looks fine and clearly i understood</div><br>
<blockquote class="gmail_quote" DEFANGED_style="PADDING-LEFT: 1ex; MARGIN: 0px 0px 0px 0.8ex; BORDER-LEFT: #ccc 1px solid">Mehul I have tested the patch-compiles cleanly.</blockquote>
<div>&nbsp;</div>
<div>Great !!! </div><br>Will you patch the complete patching the complete tree ?</div>
<div>&nbsp;</div>
<div>-Mehul</div>

------------=_1171095195-18542-411--

--===============2126471462==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============2126471462==--
